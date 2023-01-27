clear all;
close all;

load donnees1.mat;
load donnees2.mat;

fp1 = 0;
fp2 = 46000;
T = 40e-3;
Fe = 120000;
Te = 1/Fe;
Ns = Fe*(T/length(bits_utilisateur2));
Ts = Ns*Te;

%3.2.1 Modulation bande base

    % Génération des signaux m1(t) et m2(t)
m1 = 2*bits_utilisateur1 - 1;
m2 = 2*bits_utilisateur2 - 1;
    %Tracage de m1 e m2
plot((0:Te:(length(m1)-1)*Te),m1);
xlabel("Temps en secondes t");
ylabel("Signal m1(t) ");
title('Figure1 : Signal m1')
figure;
plot((0:Te:(length(m2)-1)*Te),m2);
xlabel("Temps en secondes t");
ylabel("Signal m2(t) ");
title('Figure2 : Signal m2')


    %Densité spectrale de puissance de m1 et m2
Sm1 = abs(fft(m1)).^2;
Sm2 = abs(fft(m2)).^2;
    %Tracage des densités spectrales
figure;
semilogy(0:Fe:(length(m1)-1)*Fe,Sm1);
xlabel("Hz");
title('Figure3 : Densité spectrale du signal m1')
figure;
semilogy(0:Fe:(length(m2)-1)*Fe,Sm2);
xlabel("Hz");
title('Figure4 : Densité spectrale du signal m2')




%3.2.2 Construction du signal MF-TDMA

    % Génerer un signal comportant 5 slots de durée T = 40 ms 
s1 = [zeros(1,length(m1)),m1,zeros(1,3*length(m1))];
s2 = [zeros(1,4*length(m2)),m2];
signal = s1 + s2;
figure;
plot((0:Te:(length(signal)-1)*Te),signal);
xlabel("Temps en secondes t");
ylabel("Signal résultant");
title('Figure5 : Signal comportant 5 slots')  
    % Signal MF-TDMA
phi = 2*pi*rand;
x = s1 + s2.*cos(2*pi*fp2*(0:Te:(length(signal)-1)*Te)+phi);
bruit = randn(1,length(signal));
SNR = 100;
x_b = x + bruit;
figure
plot((0:Te:(length(x_b)-1)*Te),x_b);
xlabel("Temps en secondes t");
ylabel("Signal résultant");
title('Figure6 : Signal MF-TDMA')

Sx = abs(fft(x_b)).^2;
figure
semilogy((0:Fe:(length(Sx)-1)*Fe),Sx)
xlabel('Fréquence en Hz');
ylabel('Densité spectrale de puissance de x(t)');
title('Figure7 : Densité spectrale de puissance du signal MF-TDMA')

%ATTENTION DEUX QUESTIONS A EXPLIQUER!!!!


%Démultiplexage des porteuses 
    
        %4.1.1 Synthèse du fltre passe-bas

A = [1];
N1 = 30;
fc = (fp1+fp2)/2;
h = 2*fc*sinc(2*pi*fc*Te*(-N1:N1))*Te;
H = fft(h);

figure;
plot((0:Te:(length(h)-1)*Te),h);
xlabel("Temps en secondes t");
ylabel("h(t)");
title('Figure 8 : Réponse impulsionnelle')


figure;
semilogy((0:Fe:(length(H)-1)*Fe),abs(H))
xlabel("Fréquence en Hz");
ylabel("Réponse en fréquence");
title('Figure 9 : Réponse en fréquence')
         
y = filter(h,A,x);
TF_s1 = fft(s1);
TF_s2 = fft(s2);
semilogy((0:Fe:(length(TF_s1)-1)*Fe),abs(TF_s1))
hold on 
semilogy((0:Fe:(length(TF_s1)-1)*Fe),abs(TF_s2))

       
         
           %4.1.2.Synthèse du filtre passe-haut

% Réponse impulsionnelle et la réponse en fréquence
dirac = zeros(1,N1);
dirac(N1/2 + 1) = 1;
y_pass_haut = dirac - h;
H = 1 - y_pass_haut;
plot((0:Te:(length(y_pass_haut)-1)*Te),h);

plot(-N1*1/Fe:1/Fe:N1*1/Fe,abs(y_pass_haut));
semilogy((0:Fe:(length(TF_s1)-1)*Fe),abs(y_pass_haut));
figure
xlabel('temps en s');
ylabel('Morceau de la trace impulsionnelle idéale');
title('Réponse impulsionnelle du filtre passe haut');











