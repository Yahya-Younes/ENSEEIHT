

clear all;
close all;
clc ;


                      % Séquence 3 %

                      
Fe = 24000;
Te = 1/Fe;
bits = randi([0,1],1,10000);
% Mapping
 Symboles = 2*bits -1;
%[Symboles,Ns] = Mapping(bits,Fe,Rb);
Ns = 8;
h = ones(1,Ns);
% Surechantillonage
Suite_diracs = kron(Symboles,[1 zeros(1,Ns-1)]);
%Suite_diracs = Suite_diracs(:,1);

% Filtrage
x = filter(h,1,Suite_diracs);
% Introduction d'un bruit gaussien
Px = mean(abs(x).^2);
M = 2;
SNR = (0:1:8);
TEB = zeros(1,9);
for i = 0:length(SNR)-1
   rapport_decibel = SNR(1,i+1)/10; 
   sigma = sqrt(Px*Ns/(2*log2(M)*10^rapport_decibel));
   bruit = sigma*randn(1,length(x));
   r = x + bruit;
   signal_filtre = filter(h,1,r);
   n0 = 8;
   signal_echant = signal_filtre(n0:Ns:end);
   % Detecteur à seuil
   symboles_decides = sign(signal_echant);
   % TEB
   bits_decides =  (symboles_decides+1)/2;
   TEB(1,i+1) = length(find(bits_decides ~= bits))/length(Symboles)
end
% figure(1);
% semilogy(SNR,TEB,'m--');

% Tracé de la réponse impulsionnelle 
% figure(1);
% plot((0:Te:length(x)*Te-Te),x);
% % Calcul de la DSP
% DSP = pwelch(x, [], [], [], Fe, 'twosided');
% figure(2);
% plot(linspace(-Fe/2,Fe/2,length(DSP)),fftshift(abs(DSP)));

%% Demodulateur

% signal_filtre = filter(h,1,x);
figure(1);
plot((0:Te:length(signal_filtre)*Te-Te),signal_filtre);
% % Diagramme de l'oeil
% figure(2);
% plot(reshape(signal_filtre(Ns+1:end),Ns,length(signal_filtre(Ns+1:end))/Ns));
% Echantillonage du signal en sortie du filtre de réception
% n0 = 8;
% signal_echant = signal_filtre(n0:Ns:end);
TEB_th = 1 - normcdf(sqrt(2.*10.^(SNR/10)));
% nexttile;
% semilogy(SNR,TEB_th,'r*-');

figure(3)
semilogy(SNR,TEB,'m--');grid on;
hold on;
semilogy(SNR,TEB_th,'r*-');
hold off;
%5.3.1
bits_2 = randi([0,1],1,10000);
% Mapping
Symboles_2 = 2*bits_2 -1;
%[Symboles_2,Ns_2] = Mapping(bits_2,Fe,Rb);
Ns_2 = 8;
h2 = ones(1,Ns_2);
% Surechantillonage
Suite_diracs_2 = kron(Symboles_2,[1 zeros(1,Ns_2 - 1)]);

% Filtrage
x2 = filter(h2,1,Suite_diracs_2);
% Diagramme de l'oeil en sortie du filtre de réception
hr = h2;
hr(Ns_2/2 +1 : end) = 0;%zeros(1,Ns_2/2 + 1);
signal_filtre_2 = filter(hr,1,x2);
% figure(4);
% plot(reshape(signal_filtre_2(Ns_2+1:end),Ns_2,length(signal_filtre_2(Ns_2+1:end))/Ns_2));
% Echantillonage du signal en sortie du filtre de réception
signal_echant_2 = signal_filtre_2(n0:Ns_2:end);

% % Detecteur à seuil
% symboles_decides_2 = sign(signal_echant_2);
% 
% % TEB
% bits_decides_2 =  (symboles_decides_2+1)/2;
% TEB1 = length(find(bits_decides_2 ~= bits_2));
% TEB1_th = 1 - normcdf(sqrt(10.^(SNR/10)));
% 
% figure(200)
% semilogy(SNR,TEB,'m--');grid on;
% hold on;
% semilogy(SNR,TEB_th,'r*-');

% 5.3.2
% Diagramme de l'oeil pour différentes valeurs de Eb/N0
TEB1 = zeros(1,9);
Px2 = mean(abs(x2).^2);
%hr = 
for i = 0:8
   rapport_decibel_2 = SNR(1,i+1)/10;
   sigma2 = sqrt(Px2*Ns_2/(2*log2(M)*10^rapport_decibel_2));
   bruit2 = sigma2*randn(1,length(x2));
   r2 = x2 + bruit2;
   signal_filtre_2 = filter(hr,1,r2);
   n0 = 8;
   signal_echant_2 = signal_filtre_2(n0:Ns_2:end);
   % Detecteur à seuil
   symboles_decides_2 = sign(signal_echant_2);
   % TEB
   bits_decides_2 =  (symboles_decides_2+1)/2;
   
   TEB1(1,i+1) = length(find(bits_decides_2 ~= bits_2))/length(Symboles_2);
end

TEB1_th = 1 - normcdf(sqrt(10.^(SNR/10)));
figure(5)
semilogy(SNR,TEB1,'m--');grid on;
hold on;
semilogy(SNR,TEB1_th,'r*-');


%5.4 Mapping 4-aire

symboles_3 = (2 * bi2de(reshape(bits, 2, length(bits)/2).') - 3).';
Ns = 8;
h = ones(1,Ns);
% Surechantillonage
Suite_diracs_3 = kron(symboles_3,[1 zeros(1,Ns-1)]);
%Suite_diracs = Suite_diracs(:,1);

% Filtrage
x_3 = filter(h,1,Suite_diracs_3);
% Introduction d'un bruit gaussien
Px = mean(abs(x_3).^2);
M = 4;
SNR = (0:1:8);
TEB_3 = zeros(1,length(SNR));
TES_3 = zeros(1,length(SNR));
for i = 0:length(SNR)-1
   rapport_decibel = SNR(1,i+1)/10; 
   sigma = sqrt(Px*Ns/(2*log2(M)*10^rapport_decibel));
   bruit = sigma*randn(1,length(x_3));
   r_3 = x_3 + bruit;
   signal_filtre = filter(h,1,r_3);
   n0 = 8;
   signal_echant_3 = signal_filtre(n0:Ns:end);
   % Detecteur à seuil : décision par detecteur à seuil

   symboles_decides_3 = zeros(1,length(signal_echant_3));
   symboles_decides_3 (find(signal_echant_3<-2*Ns))=-3;
   symboles_decides_3 (find(signal_echant_3>-2*Ns & signal_echant_3 < 0))= -1;
   symboles_decides_3 (find(signal_echant_3<2*Ns & signal_echant_3 >0 ))= 1;
   symboles_decides_3 (find(signal_echant_3> 2*Ns))= 3;
   % Demapping
   bits_decides_3 = reshape(de2bi((symboles_decides_3+3)/2).',1,length(bits));
   % TEB
   TEB_3(1,i+1) = length(find(bits_decides_3 ~= bits))/length(bits);
   TES_3(1,i+1) =  length(find(symboles_decides_3 ~= symboles_3))/length(symboles_3);
end

TEB3_th = (qfunc(sqrt((4/5)*10.^(SNR/10))))*(3/4);
figure(100)
semilogy(SNR,TEB_3,'m--');grid on;
hold on;
semilogy(SNR,TEB3_th,'r*-');
title('Comparaison entre TEB théorique et TEB par simulation')
legend('TEB théorique','TEB par simulation')


%TES
TES3_th = (qfunc(sqrt((4/5)*10.^(SNR/10))))*(3/2);
figure()
semilogy(SNR,TES_3,'m--');grid on;
hold on;
semilogy(SNR,TES3_th,'r*-');
title('Comparaison entre TES théorique et TES par simulation')
legend('TES théorique','TES par simulation')







