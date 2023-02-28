                             %% Etude de transmissions en bande de base %%


clear;
close all;
clc;

% Decclarations des constantes
nb_bits = 200;
Fe = 24000;
Rb = 3000;
Tb = 1/Rb;
Te = 1/Fe;
ord_m1 = 2;
ord_m2 = 4;

                                                             %% Séquence 2 %%    
                                  %% Etude des interferences entre symbole et du critere e Nyquist %%

%% 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 4.2 Etude sans canal de propagation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

    % Implantation du bloc modulateur et demodulateur

% Generation des bits   
bits = randi([0,1],1,200);

%Mapping
Symboles = 2*bits-1;
Ns = Fe/Rb;
h = ones(1,Ns);

% Surechantillonage
Suite_diracs = kron(Symboles,[1 zeros(1,Ns-1)]);

%Suite_diracs = Suite_diracs(:,1);
% Filtrage
x = filter(h,1,Suite_diracs);

% Tracé du signal en sortie du filtre de reception 
figure(1);
plot((0:Te:length(x)*Te-Te),x); grid on;
xlabel("Temps en secondes");
ylabel("Signal en sortie");
title("Signal en sortie du filtre de reception en fonction du temps ");

% Calcul de la DSP
DSP = pwelch(x, [], [], [], Fe, 'twosided');
figure(2);
plot(linspace(-Fe/2,Fe/2,length(DSP)),fftshift(abs(DSP))); grid on;
xlabel("Frequence en Hz");
ylabel("Signal en sortie");
title(" Trace de la DSP du signal en sortie en fonction de la frequence ");

% Demodulateur
signal_filtre = filter(h,1,x);
figure(3);
plot((0:Te:length(signal_filtre)*Te-Te),signal_filtre); grid on;
xlabel("Temps en secondes");
ylabel("Signal demodule");
title("Signal demodule en fonction du temps ");


% Réponse impulsionnelle globale de la chaine de transmission g
g = conv(h,h);
figure(4);
plot(g); grid on;
xlabel("Frequence en Hz");
ylabel("Reponse impulsionnelle");
title("La reponse impulsionnelle globale de la chaine de transmission g");

% Diagramme de l'oeil
figure(5);
plot(reshape(signal_filtre(Ns+1:end),Ns,length(signal_filtre(Ns+1:end))/Ns));grid on;
xlabel("Temps");
ylabel("Amplitude du signal");
title("Diagramme de l'oeil");



% Echantillonnage du signal en sortie du filtre de reception
n0 = 8;
signal_echant = signal_filtre(Ns:n0+Ns:end);

% Detecteur a seuil
symboles_decides = sign(signal_echant);

% TEB
bits_decides = (symboles_decides + 1)/2;
TEB = length(find(bits_decides ~= bits));

% Echantillonnage du signal en sortie du filtre de réception avec n0
n0_1 = 3;
signal_echant_2 = signal_filtre(Ns:n0_1+Ns:end);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%


%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4.3 Etude avec canal de propagation sans bruit %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Filtre passe-bas
hc = (2*fc/Fe)*sinc(2*(fc/Fe)*[-(N-1)/2:(N-1)/2]);



