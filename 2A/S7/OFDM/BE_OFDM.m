close all;
clear all;
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTIE 2 : Implantation de la chaine de transmission OFDM sans canal %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      %% 2.1) Emission

 %Déclaration des constantes
N = 16;      % Nombre de porteuses
M = 2;       % Modulation
n = 16000;    % Nombre de bits à transmettre
Fe = 24000;  % Fréquence d'echantillonnage
Rb = 3000;   % Débit binaire

 % Génération de bits
 bits = randi([0,1],1,n);

 % Mapping
 Symboles = 2*bits-1;

 % Génération du signal OFDM sans canal
Symboles_reshape = reshape(Symboles , N, n/N);

% Génération du signal OFDM pour la deuxième porteuse
Porteuse_1 = ifft([zeros(1,n/N); Symboles_reshape(2,:); zeros(N-2,n/N)]);
P1 = reshape(Porteuse_1, 1, n);

% Génération du signal OFDM pour la deuxième et la troisième porteuses
Porteuse_2 = ifft([zeros(1,n/N);Symboles_reshape(2:3,:); zeros(N-3,n/N)]);
P2 = reshape(Porteuse_2, 1, n);

% Génération du signal OFDM pour les 8 porteuses centrales
Porteuse_8 = ifft([zeros(4,n/N);Symboles_reshape(5:12,:); zeros(4,n/N)]);
P3 = reshape(Porteuse_8,1,n);

% Caclcul des densites spectrales
[DSP_P1, f1] = pwelch(P1,[],[],[],Fe,"twosided");
figure(1)
plot(f1, 10*log10(DSP_P1));
title("DSP de la deuxième porteuse ")
xlabel('Fréquence(Hz)')
ylabel("DSP(dB)")

[DSP_P2, f2] = pwelch(P2,[],[],[],Fe,"twosided");
figure(2)
plot(f2,10*log10(DSP_P2));
title("DSP de la deuxième et troisième porteuses ")
xlabel('Fréquence(Hz)')
ylabel("DSP(dB)")

[DSP_P3, f3] = pwelch(P3,[],[],[],Fe,"twosided");
figure(3)
plot(f3,10*log10(DSP_P3));
title("DSP des 8 porteuses centrales")
xlabel('Fréquence(Hz)')
ylabel("DSP(dB)")


%% 2.1) Récéption sans canal
% Symboles reçus: N=16 porteuses
Matrice_OFDM= ifft(Symboles_reshape);
Signal_OFDM = reshape(Matrice_OFDM,1,n);
FFT_Matrice_SignalOFDM = fft(Matrice_OFDM);
FFT_SignalOFDM = reshape(FFT_Matrice_SignalOFDM, 1, n);
Symboles_recus = sign(FFT_SignalOFDM);

% Demapping
bits_recus = (Symboles_recus + 1)/2;

% Calcul du TEB
ecart_ss_canal = abs(bits - bits_recus);
TEB_ss_canal = mean(ecart_ss_canal);




%%











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTIE 3 : Implantation de la chaine de transmission OFDM avec canal multi-trajets, sans bruit %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N_calc = 40; % Nombres de porteuses calculées


 %% Récéption avec canal
% Symboles reçus: N_calc = 40 porteuses
Symboles_reshape_40 = reshape(Symboles , N_calc, n/N_calc);
Matrice_OFDM_40= ifft(Symboles_reshape_40);
Signal_OFDM_40 = reshape(Matrice_OFDM_40,1,n);
FFT_Matrice_SignalOFDM_40 = fft(Matrice_OFDM_40);
FFT_SignalOFDM_40 = reshape(FFT_Matrice_SignalOFDM_40, 1, n);
Symboles_recus_40 = sign(FFT_SignalOFDM_40);

% Demapping
bits_recus_40 = (Symboles_recus_40 + 1)/2;






% Canal de propagation
alpha0 = 0.04; 
alpha1 = -0.05;
alpha2 = 0.07;
alpha3 = -0.21;
alpha4 = -0.5;
alpha5 = 0.72;
alpha6 = 0.36;
alpha7 = 0;
alpha8 = -0.21;
alpha9 = 0.03;
alpha10 = 0.07;
hc = [alpha0 alpha1  alpha2 alpha3 alpha4 alpha5 alpha6 alpha7 alpha8 alpha9 alpha10];


figure(5)
subplot(2,1,1)
plot(abs(fft(hc,4096)));
title("Module de la réponse fréquentielle")
subplot(2,1,2)
plot(angle(fft(hc,4096)));
title("Phase de la réponse fréquentielle")



%% 3.1) Implantation sans intervalle de garde
% Filtrage du signal OFDM
Signal_Recu = filter(hc, 1, Signal_OFDM);
Matrice_Signal_Recu = reshape(Signal_Recu, N_calc, n/N_calc);

% Comparaison des DSPs avant et après le canal
[DSP_Signal_Recu, f_signal_recu] = pwelch(Signal_Recu,[],[],[],Fe,"twosided");
[DSP_Signal_OFDM, f_signal_ofdm] = pwelch(Signal_OFDM,[],[],[],Fe,"twosided");
figure(6)
xlim([0 1]);
plot(f_signal_recu, log10(DSP_Signal_Recu),'r');
hold on
plot(f_signal_ofdm, log10(DSP_Signal_OFDM),'b');
title("Comparaison des DSPs avant et après le canal")
xlabel('Fréquence(Hz)')
ylabel("DSP(dB)")
legend('après le canal','avant le canal')

% Réception
FFT_Signal_Recu_Matrice = fft(Matrice_Signal_Recu);
FFT_Signal_Recu = reshape(FFT_Signal_Recu_Matrice, 1, n);

% Constellations
scatterplot(FFT_Signal_Recu_Matrice(1,:));
title("Constellations de la première porteuse sans canal")
scatterplot(FFT_Signal_Recu_Matrice(N,:));
title("Constellations de la dernière porteuse sans canal")

% Calcul du TEB
symboles_recu_canal = sign(real(FFT_Signal_Recu));
bits_recus_canal = (symboles_recu_canal + 1)/2;
ecart_canal = abs(bits_recus_canal - bits);
TEB_canal = mean(ecart_canal);




%% 3.2) Implantation avec intervalle de garde composé de zéros
% Emission
Matrice_Signal_OFDM_IG = [zeros(10,n/N_calc); Matrice_OFDM_40];
Signal_OFDM_IG = reshape(Matrice_Signal_OFDM_IG, 1, n+10*n/N_calc);
Signal_Recu_IG = filter(hc, 1, Signal_OFDM_IG);
Signal_Recu_IG_Matrice = reshape(Signal_Recu_IG, N_calc+10, n/N_calc);

% Réception
Signal_Recu_IG_Matrice = Signal_Recu_IG_Matrice(11:N_calc+10,:);
TF_Signal_Recu_IG_Matrice = fft(Signal_Recu_IG_Matrice);

% Constellations
scatterplot(TF_Signal_Recu_IG_Matrice(1,:));
title("Constellations de la première porteuse avec IG")
scatterplot(TF_Signal_Recu_IG_Matrice(N_calc,:));
title("Constellations de la dernière porteuse avec IG")

% Calcul du TEB
TF_Signal_Recu_IG = reshape(TF_Signal_Recu_IG_Matrice, 1, n);
symboles_recu_IG = sign(real(TF_Signal_Recu_IG));
bits_recus_IG = (symboles_recu_IG + 1)/2;
ecart_IG = abs(bits_recus_IG - bits);
TEB_IG = mean(ecart_IG);



%% 3.3) Implantation avec préfixe cyclique
Matrice_Signal_OFDM_PC = [Matrice_OFDM_40(N_calc-9:N_calc,:); Matrice_OFDM_40];
Signal_OFDM_PC = reshape(Matrice_Signal_OFDM_PC, 1, (N_calc+10)*(n/N_calc));
Signal_Recu_PC = filter(hc, 1, Matrice_Signal_OFDM_PC);
Matrice_Signal_Recu_PC = reshape(Signal_Recu_PC, N_calc+10, n/N_calc);

% Réception
Matrice_Signal_Recu_PC = Matrice_Signal_Recu_PC(11:N_calc+10,:);
Matrice_FFT_Signal_Recu_PC = fft(Matrice_Signal_Recu_PC);
FFT_Signal_Recu_PC = reshape(Matrice_FFT_Signal_Recu_PC, 1, n);

% Constellations
scatterplot(Matrice_FFT_Signal_Recu_PC(1,:));
title("Constellations de la première porteuse avec PC")
scatterplot(Matrice_FFT_Signal_Recu_PC(N_calc,:));
title("Constellations de la dernière porteuse avec PC")

% Calcul du TEB
symboles_recu_PC = sign(real(FFT_Signal_Recu_PC));
bits_recus_PC = (symboles_recu_PC + 1)/2;
ecart_PC = abs(bits_recus_PC - bits);
TEB_PC = mean(ecart_PC);


%% 3.4) Implantation avec préfixe cyclique et égalisation

h = [hc zeros(1,N_calc-length(hc))];
H = fft(h);

% Egalisation ZF
Matrice_symboles_recu_ZF = Matrice_FFT_Signal_Recu_PC./H.';

%Constellations
scatterplot(Matrice_symboles_recu_ZF(1,:));
title("Constellations de la première porteuse avec egalisation ZF ")
scatterplot(Matrice_symboles_recu_ZF(N_calc,:));
title("Constellations de la dernière porteuse avec egalisation ZF ")

% Calcul du TEB
symboles_recu_ZF = reshape(Matrice_symboles_recu_ZF, 1, n);
symboles_recu_ZF = sign(real(symboles_recu_ZF));
bits_recus_ZF = (symboles_recu_ZF + 1)/2;
ecart_ZF = abs(bits_recus_ZF - bits);
TEB_ZF = mean(ecart_ZF);

% Egalisation ML
Matrice_symboles_recu_ML = Matrice_FFT_Signal_Recu_PC.*H';

%Constellations
scatterplot(Matrice_symboles_recu_ML(1,:));
title("Constellations de la première porteuse avec Egalisation ML ")
scatterplot(Matrice_symboles_recu_ML(N_calc,:));
title("Constellations de la dernière porteuse Egalisation ML ")

%Calcul du TEB
symboles_recu_ML = reshape(Matrice_symboles_recu_ML, 1, n);
symboles_recu_ML = sign(real(symboles_recu_ML));
bits_recus_ML = (symboles_recu_ML + 1)/2;
ecart_ML = abs(bits_recus_ML - bits);
TEB_ML = mean(ecart_ML);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARTIE 4 : Impact d'une erreur de synchronisation horloge %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Surdimensionnement du préfixe cyclique
Matrice_Signal_OFDM_PC = [Matrice_OFDM(9:16,:); Matrice_OFDM];

% Cas 1
Signal_OFDM_PC_cas1 = reshape(Matrice_Signal_OFDM_PC, 1, (N+8)*(n/N));
Signal_Recu_PC_cas1 = filter(h, 1, Signal_OFDM_PC_cas1);
Matrice_Signal_OFDM_PC_cas1 = reshape(Signal_Recu_PC_cas1, N+8, n/N);
Matrice_Signal_OFDM_PC_cas1 = Matrice_Signal_OFDM_PC_cas1(1:N,:);
Matrice_FFT_Signal_Recu_PC__cas1 = fft(Matrice_Signal_OFDM_PC_cas1);
FFT_Signal_Recu_PC_cas1 = reshape(Matrice_FFT_Signal_Recu_PC__cas1, 1, n);

% Calcul du TEB cas 1
symboles_recu_PC_cas1 = sign(real(FFT_Signal_Recu_PC_cas1));
bits_recus_PC_cas1 = (symboles_recu_PC_cas1 + 1)/2;
ecart_PC_cas1 = abs(bits_recus_PC_cas1 - bits);
TEB_PC_cas1 = mean(ecart_PC_cas1);

% Constellations
scatterplot(Matrice_FFT_Signal_Recu_PC__cas1(1,:))
title("première porteuse dans le premier cas")
scatterplot(Matrice_FFT_Signal_Recu_PC__cas1(N,:))
title("dernière porteuse dans le premier cas")


% Cas 2
Signal_OFDM_PC_cas2 = reshape(Matrice_Signal_OFDM_PC, 1, (N+8)*(n/N));
Signal_Recu_PC_cas2 = filter(h, 1, Signal_OFDM_PC_cas2);
Matrice_Signal_Recu_PC_cas2 = reshape(Signal_Recu_PC_cas2, N+8, n/N);
Matrice_Signal_Recu_PC_cas2 = Matrice_Signal_Recu_PC_cas2(6:N+5,:);
FFT_Matrice_Signal_Recu_PC_cas2 = fft(Matrice_Signal_Recu_PC_cas2);
FFT_Signal_Recu_PC_cas2 = reshape(FFT_Matrice_Signal_Recu_PC_cas2, 1, n);

% Calcul du TEB cas 2
symboles_recu_PC_cas2 = sign(real(FFT_Signal_Recu_PC_cas2));
bits_recus_PC_cas2 = (symboles_recu_PC_cas2 + 1)/2;
ecart_c_PC_cas2 = abs(bits_recus_PC_cas2 - bits);
TEB_PC_cas2 = mean(ecart_c_PC_cas2);

% Constellations
scatterplot(FFT_Matrice_Signal_Recu_PC_cas2(1,:))
title("première porteuse dans le deuxième cas ")
scatterplot(FFT_Matrice_Signal_Recu_PC_cas2(N,:))
title("dernière porteuse dans le deuxième cas")

% Cas 3
Signal_OFDM_PC_cas3 = reshape(Matrice_Signal_OFDM_PC, 1, (N+8)*(n/N));
SignalRecu_PC_cas3 = filter(h, 1, Signal_OFDM_PC_cas3);
SignalRecu_PC_cas3 = [SignalRecu_PC_cas3(2:end) SignalRecu_PC_cas3(1)];
Matrice_SignalRecu_PC_cas3 = reshape(SignalRecu_PC_cas3, N+8, n/N);
Matrice_SignalRecu_PC_cas3 = Matrice_SignalRecu_PC_cas3(9:N+8,:);
FFT_Matrice_Signal_Recu_PC_cas3 = fft(Matrice_SignalRecu_PC_cas3);
FFT_SignalRecu_PC_cas3 = reshape(FFT_Matrice_Signal_Recu_PC_cas3, 1, n);

% Calcul du TEB cas 3
symboles_recu_PC_cas3 = sign(real(FFT_SignalRecu_PC_cas3));
bits_recus_PC_cas3 = (symboles_recu_PC_cas3 + 1)/2;
ecart_PC_cas3 = abs(bits_recus_PC_cas3 - bits);
TEB_PC_cas3 = mean(ecart_PC_cas3);

% Constellations
scatterplot(FFT_Matrice_Signal_Recu_PC_cas3(1,:))
title("première porteuse dans le troisième cas")
scatterplot(FFT_Matrice_Signal_Recu_PC_cas3(N,:))
title("dernière porteuse dans le troisième cas")


