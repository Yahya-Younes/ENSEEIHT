clear all;
close all;
clc ;


Fe = 10000;
% Fréquence porteuse
Fp = 2000;
% Periode d'echantillonnage
Te = 1/Fe;
% Le roll-off
alpha = 0.35;
%........
Rb = 2000;
nb_bits = 10000;
M = 4;             % ordre de modulation
Rs = Rb/log2(M);
Ts = 1/Rs;
Ns = Ts/Te;

% Chaine de transmission sur porteuse

%Generation de bits
bits = randi([0,1],1,nb_bits);

 %Mapping
ak = 2*bits(1:2:end)-1;
bk = 2*bits(2:2:end)-1;
dk = ak + 1j*bk;

 %Surechontinllnage
Suite_diracs = kron(dk, [1 zeros(1,Ns-1)]);

%Filtrage de mise en forme
h = rcosdesign(alpha,20,Ns);
retard = (20*Ns)/2; 

%Filtrage de mise en forme
x_1 = filter(h,1,[Suite_diracs zeros(1,retard)]);
x_1_fp = x_1(retard+1:end);
t = 0:Te:length(x_1_fp)*Te-Te;
Signal = x_1_fp .* exp(1j*2*pi*Fp*t);

signal_reel = real(Signal);
S1 = signal_reel.*cos(2*pi*Fp*t);
S2 = signal_reel.*sin(2*pi*Fp*t);
S = S1 - 1j*S2;

% Filtre de rÃ©ception
z = filter(h, 1, [S zeros(1,retard)]);
z = z(retard+1 : end);
figure(1);
plot((0:Te:length(z)*Te-Te), z);

% Echantillonage
z_echant = z(1:Ns:end);

% DÃ©cisions
symboles_decides_reel = sign(real(z_echant));
symboles_decides_imag = sign(imag(z_echant));
symboles_decides = symboles_decides_reel + 1j*symboles_decides_imag;
bits_decides = zeros(1, 2*length(symboles_decides));
bits_decides_reel = (symboles_decides_reel + 1)/2;
bits_decides_imag = (symboles_decides_imag + 1)/2;
bits_decides(1:2:end) = bits_decides_reel;
bits_decides(2:2:end) = bits_decides_imag;
% Calcul de la DSP
DSP = pwelch(signal_reel,[],[],[],Fe,'twosided');
figure(20000);
plot(linspace(0,Fe,length(DSP)),(abs(DSP)));
% Calcul du TEB
TEB = length(find(bits_decides ~= bits));

% Chaine avec bruit
P = mean(abs(signal_reel).^2);
SNR = (0:1:6);
TEB_2 = zeros(1,7);
for i = 0:length(SNR)-1
   rapport_decibel = SNR(1,i+1)/10; 
   sigma = sqrt(P*Ns/(2*log2(M)*10^rapport_decibel));
   bruit = sigma*randn(1,length(signal_reel));
   r = signal_reel + bruit;
   R1 = r.*cos(2*pi*Fp*t);
   R2 = r.*sin(2*pi*Fp*t);
   R = R1 - 1j*R2;

   % Filtre de rÃ©ception
   z2 = filter(h, 1, [R zeros(1,retard)]);
   z2 = z2(retard+1 : end);
   figure(3);
   plot((0:Te:length(z2)*Te-Te), z2);
   % Echantillonage
   z_echant_2 = z2(1:Ns:end);

   % Detecteur Ã  seuil
   symboles_decides_reel_2 = sign(real(z_echant_2));
   symboles_decides_imag_2 = sign(imag(z_echant_2));
   symboles_decides_2 = symboles_decides_reel_2 + 1j*symboles_decides_imag_2;
   bits_decides_2 = zeros(1, 2*length(symboles_decides_2));
   bits_decides_reel_2 = (symboles_decides_reel_2 + 1)/2;
   bits_decides_imag_2 = (symboles_decides_imag_2 + 1)/2;
   bits_decides_2(1:2:end) = bits_decides_reel_2;
   bits_decides_2(2:2:end) = bits_decides_imag_2;
   TEB_2(1,i+1) = length(find(bits_decides_2 ~= bits))/length(bits);   % ICI il faut diviser par length(bits) et non pas length(dk)
   % car BER(ou TEB)= longueur de bits erronés/longueur des bits
   % introduits : donc ton cas c'est bits , le dk c'est le signal mappé qui
   % a une longuer =1/2 de longueur de tes bits, puisqu'il s'agit d'une
   % QPSK : 2 bits codent un symboles. si tu as un signal BPSK oû t'as un
   % seul bit code 1 symbole, tu auras length(dk) = length(bits) sonc tu
   % peux mettre dk au lieu bits, par contre ce n'est pas le cas pour un
   % signal qui l'est pas bpsk. 
end
figure(4);
semilogy(SNR, TEB_2, 'g-'); grid on;

TEB_th = 1 - normcdf(sqrt(2*10.^(SNR/10)));
hold on;
semilogy(SNR, TEB_th, '*-');
figure(5);
DSP2 = pwelch(r,[],[],[],Fe,'twosided');
plot(linspace(0,Fe,length(DSP2)),abs(DSP2));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implantation de la chaine passe-bas équivalente
%  
% Mapping
% ak = 2*bits(1:2:end)-1;
% bk = 2*bits(2:2:end)-1;
% dk = ak + 1j*bk;
% Surechontinllnage
% Suite_diracs = kron(dk, [1 zeros(1,Ns-1)]);
% Filtrage de mise en forme
% h = rcosdesign(alpha,20,Ns);
% retard = (20*Ns)/2; 
% 
% Filtrage de mise en forme
% x_1 = filter(h,1,[Suite_diracs zeros(1,retard)]);
% x_1_fp = x_1(retard+1:end);