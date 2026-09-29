clear all;
close all;
clc ;


 % On ajoute le _c pour tous les variables pour differencier la partie
 % comparaison des autres parties
 
Fe_c = 96000;
Fp_c = 2000;
Te_c = 1/Fe_c;
alpha_c = 0.5;
Rb_c = 48000;
nb_bits = 10000;
M = 4; % ordre de modulation
Rs = Rb_c/log2(M);
Ts = 1/Rs;
Ns = Ts/Te_c;


% Chaine de transmission sur porteuse
                %  Modulation QPSK

%Generation de bits
bits = randi([0,1],1,nb_bits);

 %Mapping
y = pskmod(bits,M);

 %Surechontinllnage
Suite_diracs = kron(y, [1 zeros(1,Ns-1)]);

%Filtrage de mise en forme
h = rcosdesign(alpha_c,20,Ns);
retard = (20*Ns)/2; 

%Filtrage de mise en forme
x_1 = filter(h,1,[Suite_diracs zeros(1,retard)]);
x_1_fp = x_1(retard+1:end);
t = 0:Te_c:length(x_1_fp)*Te_c-Te_c;
Signal = x_1_fp .* exp(1j*2*pi*Fp_c*t);

signal_reel = real(Signal);
S1 = signal_reel.*cos(2*pi*Fp_c*t);
S2 = signal_reel.*sin(2*pi*Fp_c*t);
S = S1 - 1j*S2;

% Filtre de rÃ©ception
z = filter(h, 1, [S zeros(1,retard)]);
z = z(retard+1 : end);
figure(1);
plot((0:Te_c:length(z)*Te_c-Te_c), z);
% Echantillonage
z_echant = z(1:Ns:end);
% DÃ©cisions
symboles_decides_reel = sign(real(z_echant));
symboles_decides_imag = sign(imag(z_echant));
symboles_decides = symboles_decides_reel + 1j*symboles_decides_imag;
bits_decides = pskdemod(symboles_decides, M);


% Calcul du TEB
TEB = length(find(bits_decides ~= bits))
