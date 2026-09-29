                                                  %% Etude de transmissions en bande de base %%



clear;
close all;
clc;

% Declaration des constantes utilisées
nb_bits = 200;
Fe = 24000;
Rb = 3000;
Tb = 1/Rb;
Te = 1/Fe;
ord_m1 = 2;
ord_m2 = 4;
                                                                     %% Séquence 1 %%
                                                            %% Etude de modulateurs bande de base %%





%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                       %  Modulateur 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%% Implantation du modulateur %%%%%%%%%%%%%%%%%%%%%%

    %Debit Symbole
Rs_1 = Rb/log2(ord_m1);
Ts_1 = 1/Rs_1;
Ns_1 = Ts_1/Te;

    %Generation des bits
bits_1 = randi([0,1],1,nb_bits);
  
    %Mapping
Symboles_1 = 2*bits_1-1;

    %Surechantillonnage
Suite_diracs_1 = kron(Symboles_1, [1 zeros(1,Ns_1-1)]);

    %Filtrage de mise en forme
h = ones(1,Ns_1);
 
    %Filtrage de mise en forme
x_1 = filter(h,1,Suite_diracs_1);  

    %DSP
DSP_1 = pwelch(x_1,[],[],[],Fe,'twosided');

   %Tracé du signal transmis et de sa DSP
figure(1);
plot((0:Te:length(x_1)*Te-Te),x_1); grid on;
xlabel("Temps en secondes");
ylabel("Signal transmis");
title("Signal 1 transmis en fonction du temps");

figure(2);
plot(linspace(-Fe/2,Fe/2,length(DSP_1)),fftshift(DSP_1)); grid on ;
xlabel("Fréquence en Hz");
ylabel("DSP 1");
title("DSP 1 en fonction de la fréquence");


%%%%%%%%%%%%%%%%%%%%%%%%%%% Calcul théorique de la DSP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S_x_1 = Ts_1*sinc((linspace(-Fe/2,Fe/2,length(DSP_1)))*Ts_1).^2;
figure (3);
plot(linspace(-Fe/2,Fe/2,length(DSP_1)), S_x_1); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 1");
title("DSP 1 théorique en fonction de la frequence");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Comparaison entre la DSP théorique et par simuation du modulateur 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure (4);
semilogy(linspace(-Fe/2,Fe/2,length(DSP_1)), S_x_1,'b-*'); grid on;
hold on;
semilogy(linspace(-Fe/2,Fe/2,length(DSP_1)),fftshift(DSP_1),'r'); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 1");
title(" Comparaison entre la DSP 1 théorique et par simuation en fonction de la fréquence");
legend('DSP 1 théorique','DSP 1 par simuation')








%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                       %  Modulateur 2 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% Implantation du modulateur %%%%%%%%%%%%%%%%%%%%%%

    %Debit Symbole
Rs_2 = Rb/log2(ord_m2);
Ts_2 = 1/Rs_2;
Ns_2 = Ts_2/Te;

    %Generation des bits
bits_2 = randi([0,1],1,nb_bits);
  
    %Mapping
Symboles_2 = 2*(bi2de(reshape(bits_2,2,length(bits_2)/2)).')-3;

    %Surechantillonnage
Suite_diracs_2 = kron(Symboles_2, [1 zeros(1,Ns_2-1)]);

    %Filtrage de mise en forme
h = ones(1,Ns_2);
 
    %Filtrage de mise en forme
x_2 = filter(h,1,Suite_diracs_2);  

    %DSP
DSP_2 = pwelch(x_2,[],[],[],Fe,'twosided');

    %Tracé du signal transmis et de sa DSP
figure(5);
plot((0:Te:length(x_2)*Te-Te),x_2); grid on;
xlabel("Temps en secondes");
ylabel("Signal transmis");
title("Signal 2 transmis en fonction du temps");

figure(6);
plot(linspace(-Fe/2,Fe/2,length(DSP_2)),fftshift(DSP_2)); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 2");
title("DSP 2 en fonction de la fréquence");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PArtie a revoir recaluculer SX a partir d SX1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Calcul théorique de la DSP   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% S_x_2 = Ts_2*sinc((linspace(-Fe/2,Fe/2,length(DSP_2)))*Ts_2).^2;
% figure (7);
% plot(linspace(-Fe/2,Fe/2,length(DSP_1)), S_x); grid on;
% xlabel("Fréquence en Hz");
% ylabel("DSP_1");
% title("DSP_1 theorique en fonction de la frequence");
% 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Comparaison entre la DSP théorique et par simuation du modulateur 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% figure (8);
% semilogy(linspace(-Fe/2,Fe/2,0−length(DSP_2)), S_x_2,'b-*'); grid on;
% hold on;
% semilogy(linspace(-Fe/2,Fe/2,length(DSP_2)),fftshift(DSP_2),'r'); grid on;
% xlabel("Fréquence en Hz");
% ylabel("DSP 2");
% title(" Comparaison entre la DSP 2 théorique et par simuation en fonction de la fréquence");
% legend('DSP 2 théorique','DSP 2 par simuation')










%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                     % Modulateur3 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% Implantation du modulateur %%%%%%%%%%%%%%%%%%%%%%

% Debit Symbole
 Rs_3 = Rb/log2(ord_m1);
 Ts_3 = 1/Rs_3;
 Ns_3 = Ts_3/Te;
 alpha = 0.6;
 L = (nb_bits-1)/Ns_3;  

% Generation des bits
 bits_3 = randi([0,1],1,nb_bits);
     
% Mapping
 Symboles_3 = 2*bits_3-1;
 
% Surechantillonnage
 Suite_diracs_3 = kron(Symboles_3, [1 zeros(1,Ns_3-1)]);

% Filtrage de mise en forme
 h = rcosdesign(alpha,L,Ns_3);
 
% Filtrage de mise en forme
 x_3 = filter(h,1,Suite_diracs_3);  
 
% DSP
 DSP_3 = pwelch(x_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé du signal transmis et de sa DSP
figure(9);
plot((0:Te:length(x_1)*Te-Te),x_3); grid on;
xlabel("Temps en secondes");
ylabel("Signal transmis");
title("Signal 3 transmis en fonction du temps");

figure(10);
plot(linspace(-Fe/2,Fe/2,length(DSP_3)),fftshift(DSP_3)); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 3");
title("DSP 3 en fonction de la fréquence");


%%%%%%%%%%%%%%%%%%%%%%%%%% Calcul théorique de la DSP 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S_x_3 = Ts_1*sinc((linspace(-Fe/2,Fe/2,length(DSP_3)))*Ts_3).^2;
figure (11);
plot(linspace(-Fe/2,Fe/2,length(DSP_1)), S_x_3); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 3");
title("DSP 3 theorique en fonction de la frequence");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Comparaison entre la DSP théorique et par simuation du modulateur 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure (12);
semilogy(linspace(-Fe/2,Fe/2,length(DSP_3)), S_x,'b-*'); grid on;
hold on;
semilogy(linspace(-Fe/2,Fe/2,length(DSP_3)),fftshift(DSP_3),'r'); grid on;
xlabel("Fréquence en Hz");
ylabel("DSP 3");
title(" Comparaison entre la DSP 3 théorique et par simuation en fonction de la fréquence");
legend('DSP 3 théorique','DSP 3 par simuation')