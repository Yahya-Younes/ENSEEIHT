% Script for computing the BER for QAM modulation in ISI Channels with FDE
% 
close all;
clear;

%% Simulation parameters
% On décrit ci-après les paramètres généraux de la simulation

%modulation parameters
M = 4; %Modulation order 
Nframe = 10000;
Nfft=1024;
Ncp=8;
Ns=Nframe*(Nfft+Ncp);
N= log2(M)*Nframe*Nfft;
Nsamples = 100;

%Channel Parameters
Eb_N0_dB = [0:10]; % Eb/N0 values
%Multipath channel parameters
%hc=[1 -0.9];
hc = [0.227,0.46,0.688,0.46,0.227];
Lc=length(hc);%Channel length
H=fft(hc,Nfft);
%Preallocations
nErr_zffde=zeros(1,length(Eb_N0_dB));
nErr_mmsefde=zeros(1,length(Eb_N0_dB));
for ii = 1:length(Eb_N0_dB)

   %Message generation
   bits= randi([0 1],N,1);
   s = qammod(bits,M,'InputType','bit');
   sigs2=var(s);
   
   %Add CP
   smat=reshape(s,Nfft,Nframe);
   smatcp=[smat(end-Ncp+1:end,:);smat];
   scp=reshape(smatcp,1,(Nfft+Ncp)*Nframe);
   
    % Channel convolution: equivalent symbol based representation
   z = filter(hc,1,scp);  
   
   %Generating noise
   sig2b=10^(-Eb_N0_dB(ii)/10);
   
   %n = sqrt(sig2b)*randn(1,N+Lc-1); % white gaussian noise, 
   n = sqrt(sig2b/2)*randn(1,Ns)+1j*sqrt(sig2b/2)*randn(1,Ns); % white gaussian noise, 
   
    % Noise addition
   ycp = z + n; % additive white gaussian noise

  

   %remove CP
   y = reshape(ycp,Nfft+Ncp,Nframe);
   y = y(Ncp+1:end,:);
   
   %FDE
   Y = fft(y,Nfft,1);
   Wzf = 1./H;
   Wmmse = conj(H)./(abs(H).^2 + sig2b/sigs2);

   Yzf = diag(Wzf)*Y;
   Ymmse = diag(Wmmse)*Y;

   xhat_zf = ifft(Yzf,Nfft,1);
   xhat_mmse = ifft(Ymmse,[],1);
   
   %Detection
   bhat_zfeq = qamdemod(xhat_zf(:),M,'outputType','bit');
   bhat_mmseeq = qamdemod(xhat_mmse(:),M,'outputType','bit');
   nErr_zffde(1,ii) = size(find([bits(:)- bhat_zfeq(:)]),1);
   nErr_mmsefde(1,ii) = size(find([bits(:)- bhat_mmseeq(:)]),1);
   

end

simBer_zf = nErr_zffde/N; % simulated ber
simBer_mmse = nErr_mmsefde/N; % simulated ber

% plot

figure
semilogy(Eb_N0_dB,simBer_zf(1,:),'bs-','Linewidth',2);
hold on
semilogy(Eb_N0_dB,simBer_mmse(1,:),'rd-','Linewidth',2);
axis([0 70 10^-6 0.5])
grid on
legend('sim-zf-fde','sim-mmse-fde');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for QPSK in ISI with ZF and MMSE equalizers')

[h,w] = freqz(Wzf);
figure
plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title("Réponse en fréquence de l'égalisateur ZF")

[h,w] = freqz(Wmmse);
figure
plot(w/pi,20*log10(abs(h)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title("Réponse en fréquence de l'égalisateur MMSE")

figure
plot(abs(z(1:Nsamples)));
xlabel("Samples (time)")
ylabel("Magnitude")
title("Tracé du signal SCFDE")








%% Partie Multi-utilisateurs


%% Simulation parameters
% On décrit ci-après les paramètres généraux de la simulation

%modulation parameters
M = 4; %Modulation order 
Nframe = 10000;
Nfft=1024;
Nfftu = 512;
Ncp=8;
Ns=Nframe*(Nfft+Ncp);
N= log2(M)*Nframe*Nfft;
Nsamples = 100;

%Channel Parameters
Eb_N0_dB = 5; % Eb/N0 values
%Multipath channel parameters
hc1=[1 -0.9];
hc2=[0.227,0.46,0.688,0.46,0.227];
Lc1=length(hc1);%Channel length
Lc2=length(hc2);
H1=fft(hc1,Nfft);
H2=fft(hc2,Nfft);
%Preallocations
bits1 = randi([0 1],N/2,1);
bits2 = randi([0 1],N/2,1);
s1 = qammod(bits1,M,'InputType','bit');
s2 = qammod(bits2,M,'InputType','bit');
sigs1 = var(s1);
sigs2 = var(s2);

smat1 = reshape(s1,Nfftu,Nframe);
smat2 = reshape(s2,Nfftu,Nframe);

x1 = [fft(smat1);zeros(Nfftu,Nframe)];
x2 = [zeros(Nfftu,Nframe);fft(smat2)];
x1 = ifft(x1);
x2 = ifft(x2);

x1cp = [x1(end-Ncp+1:end,:);x1];
x2cp = [x2(end-Ncp+1:end,:);x2];
z1 = reshape(x1cp,1,Ns);
z2 = reshape(x2cp,1,Ns);
z1 = filter(hc1,1,z1);
z2 = filter(hc2,1,z2);
z = z1 + z2;

sig2b=10^(-Eb_N0_dB/10);
n = sqrt(sig2b/2)*randn(1,Ns)+1j*sqrt(sig2b/2)*randn(1,Ns);
y = z + n;
y = reshape(y,Nfft+Ncp,Nframe);
y = y(Ncp+1:end,:);

Y = fft(y);

%Y1 = [Y(1:Nfftu,:);zeros(Nfftu,Nframe)];
%Y2 = [zeros(Nfftu,Nframe);Y(Nfftu+1:end,:)];
W1 = conj(H1)./(abs(H1).^2 + sig2b/sigs1);
W2 = conj(H2)./(abs(H2).^2 + sig2b/sigs2);
Y1 = diag(W1(1:Nfftu))*Y(1:Nfftu,:);
Y2 = diag(W2(Nfftu+1:end))*Y(Nfftu+1:end,:);
S1 = ifft(Y1);
S2 = ifft(Y2);

xhat1 = qamdemod(S1(:),M,'outputType','bit');
xhat2 = qamdemod(S2(:),M,'outputType','bit');

BER1 = size(find([bits1(:)- xhat1(:)]),1)/length(bits1);
BER2 = size(find([bits2(:)- xhat2(:)]),1)/length(bits2);


figure
plot(abs(z1(1:Nsamples)),'r')
hold on
plot(abs(z2(1:Nsamples)),'b')
legend("User 1","User 2")
xlabel("Samples (time)")
ylabel("Magnitude")
title("Tracé du signal SC-FDMA")

figure()
subplot(2,1,1)
plot(abs(fft(hc1,4096)));
title("Module de la réponse fréquentielle de l'utilisateur 1")
subplot(2,1,2)
plot(angle(fft(hc1,4096)));
title("Phase de la réponse fréquentielle de l'utilisateur 1")

figure()
subplot(2,1,1)
plot(abs(fft(hc2,4096)));
title("Module de la réponse fréquentielle de l'utilisateur 2")
subplot(2,1,2)
plot(angle(fft(hc2,4096)));
title("Phase de la réponse fréquentielle de l'utilisateur 2")


%% Simulation parameters
% On décrit ci-après les paramètres généraux de la simulation

%modulation parameters
M = 4; %Modulation order
Nframe = 100;
Nfft=1024;
Ncp=8;
Ns=Nframe*(Nfft+Ncp);
N= log2(M)*Nframe*Nfft;
hMod = comm.QPSKModulator('BitInput',true);
hDemodHD = comm.QPSKDemodulator('BitOutput',true,...
    'DecisionMethod', 'Hard decision');


%Channel Parameters
Eb_N0_dB = [0:70]; % Eb/N0 values
%Multipath channel parameters
%hc=[1 -0.9];
hc1=[0.227, 0.46, 0.688, 0.460, 0.227];
hc2=[0.227, 0.46, 0.688, 0.460, 0.227];
Lc1=length(hc1);%Channel length
Lc2=length(hc2);%Channel length
H1=fft(hc1,Nfft);
H2=fft(hc2,Nfft);
%Preallocations
nErr_zffde=zeros(1,length(Eb_N0_dB));
nErr_mmsefde=zeros(1,length(Eb_N0_dB));
biasvect=zeros(1,length(Eb_N0_dB));
for ii = 1:length(Eb_N0_dB)

   disp(ii);
   %Message generation

   %User 1
   bits1= randi([0 1],N/2,1);
   s1 = step(hMod, bits1);
   smat1 = reshape(s1,Nfft/2,Nframe);
   S1 = fft(smat1,Nfft/2,1);
   s11 = ifft([S1;zeros(Nfft/2,Nframe)],Nfft,1);

   sigs2=var(s1);

   %User 2
   bits2= randi([0 1],N/2,1);
   s2 = step(hMod, bits2);
   smat2 = reshape(s2,Nfft/2,Nframe);
   S2 = fft(smat2,Nfft/2,1);
   s22 = ifft([zeros(Nfft/2,Nframe);S2],Nfft,1);

   %Add CP

   %User 1
   smatcp1=[s11(end-Ncp+1:end,:);s11];
   scp1=reshape(smatcp1,1,(Nfft+Ncp)*Nframe);


   %User 2
   smatcp2=[s22(end-Ncp+1:end,:);s22];
   scp2=reshape(smatcp2,1,(Nfft+Ncp)*Nframe);

   % Channel convolution: equivalent symbol based representation

   %User 1
   z1 = filter(hc1,1,scp1);

   %User 2
   z2 = filter(hc2,1,scp2);


   %Generating noise
   sig2b=10^(-Eb_N0_dB(ii)/10);

   %n = sqrt(sig2b)*randn(1,N+Lc-1); % white gaussian noise,
   n = sqrt(sig2b/2)*randn(1,Ns)+1j*sqrt(sig2b/2)*randn(1,Ns); % white gaussian noise,

    % Noise addition
   ycp = z1 + z2 + n; % additive white gaussian noise

   %remove CP
   ymatcp=reshape(ycp,Nfft+Ncp,Nframe);

   y = ymatcp(Ncp+1:end,:);

   %user 1

   H = H1;

   bits = bits1; % estimation user 1 

   %% zero forcing equalization
   % We now study ZF equalization
   Wzf=1./H;
   Y=fft(y,Nfft,1);
   Yf=diag(Wzf)*Y;%static channel
   xhat_zf=ifft(Yf(1:Nfft/2,:),Nfft/2,1); % Nfft/2+1 : end
   bhat_zfeq = step(hDemodHD,xhat_zf(:));
   %%%%%%

   %% MMSE Equalization
   % We now study MMSE equalization
   Wmmse=conj(H)./(abs(H).^2+sig2b/sigs2);
   Y=fft(y,[],1);
   Yf=diag(Wmmse)*Y;
   xhat_mmse=ifft(Yf(1:Nfft/2,:),[],1);
   bhat_mmseeq = step(hDemodHD,xhat_mmse(:));
   %%%%%%
    nErr_zffde(1,ii) = size(find([bits(:)- bhat_zfeq(:)]),1);
    nErr_mmsefde(1,ii) = size(find([bits(:)- bhat_mmseeq(:)]),1);
    biasvect(ii)=1/Nfft*sum(Wmmse.*H);
end

simBer_zf = nErr_zffde/N/2; % simulated ber
simBer_mmse = nErr_mmsefde/N/2; % simulated ber
% plot

figure
semilogy(Eb_N0_dB,simBer_zf(1,:),'bs-','Linewidth',2);
hold on
semilogy(Eb_N0_dB,simBer_mmse(1,:),'rd-','Linewidth',2);
axis([0 70 10^-6 0.5])
grid on
legend('sim-zf-fde','sim-mmse-fde');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for QPSK in ISI with ZF and MMSE equalizers')

bias= 1/Nfft*sum(Wmmse.*H);