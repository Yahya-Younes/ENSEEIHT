close all
clear


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Partie Rayleigh avec entrelaceur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Partie Rayleigh avec entrelaceur

% Déclaration des données
Rs = 1e3;
Fe = 1e4;
Ts = floor(Fe/Rs);
Ns = Ts;
a=0.35;
M = 4; % QPSK
%M = 2; % BPSK

% Partie II : communications avec les mobiles par satellites
% Modelisation du canal mobile satellite
N_avec = 204;
K_avec = 188;
liste_bits_avec = randi([0,1],1,K_avec*8*100);

% Entrelaceur
encoder = comm.RSEncoder(N_avec, K_avec, 'BitInput', true); %Reed-Solomon coder
decoder = comm.RSDecoder(N_avec, K_avec, 'BitInput', true); %Reed-Solomon decoder
bitscoderRS = step(encoder, liste_bits_avec.');    %Codage de la liste d'entrée "liste_bits"
vect_perm = randperm(length(bitscoderRS)); %Génération d'une permutation aléatoire de la longueur du vecteur codé
intr = intrlv(bitscoderRS, vect_perm); %Entrelacement du vecteur codé "bitscoderRS

% Codage canal
trellis = poly2trellis(7,[171 133]); %Definition d'un treillis pour le codage convolutionnel 
bits_entr = convenc(intr.', trellis); %Effectuer un codage convolutionnel
N_e = length(bits_entr); % La longueur du résultat du codage convolutionnel

symboles_avec = (qammod(bits_entr.', M, 'InputType', 'bit')).';

% surechantillonage 
signal_surechantillone = kron(symboles_avec,[1 zeros(1, Ns-1)]);
h = rcosdesign( a, 8, Ns);
n0 = length(h);
x = filter(h,1,[signal_surechantillone  zeros(1, n0-1)]);

n = length(x);

Eb_N0_dB = -5:2;

c_Rayleigh = rand(1,n) + rand(1,n)*1i;
x_Rayleigh = x.*c_Rayleigh;

R=1/2; % Rendement du code
Eb_N0 = 10.^(Eb_N0_dB/10);
PxRayleigh = mean(abs(x_Rayleigh).^2); % Puissance du signal émis
sigma_ne = sqrt((PxRayleigh * Ns)./(2*log2(M)*Eb_N0));
dim1 = length(Eb_N0);
dim2 = length(x_Rayleigh);
n_I_R = randn(dim1, dim2) .* sigma_ne.';
n_Q_R = randn(dim1, dim2) .* sigma_ne.';
n_e_R = n_I_R + 1i * n_Q_R;

r = x_Rayleigh + n_e_R; 

z = filter(h,1, r,[],2);


% Echantillonnage
z_ech = z(:, n0: Ns :end); %Echantillonner les données du vecteur z
c_Rayleigh_m = c_Rayleigh(n0 : Ns : end); %Echantillonner les données du vecteur c_Rayleigh

% égalisation
z_ech_ZF = z_ech./c_Rayleigh_m; %L'égalisation ZF
z_ech_ML = z_ech.*conj(c_Rayleigh_m); %L'égalisation ML 

bits_recus_ZF= zeros(dim1, N_e);
bits_recus_ML_hard= zeros(dim1, N_e);
bits_recus_ML_soft= zeros(dim1, N_e);
for i =1:dim1
    ligne_i = qamdemod(z_ech_ZF(i,:).', M, 'OutputType', 'bit');
    bits_recus_ZF(i,:) = ligne_i.';
    ligne_i = qamdemod(z_ech_ML(i,:).', M, 'OutputType', 'bit');
    bits_recus_ML_hard(i,:) = ligne_i.';
    ligne_i = qamdemod(z_ech_ML(i,:).', M, 'OutputType', 'llr');
    bits_recus_ML_soft(i,:) = ligne_i.';
end

clear i
clear ligne_i
% Décodage canal
tblen = 5*7;
Nb = length(liste_bits_avec);
bits_decoded_ZF = zeros(dim1, Nb);
bits_decoded_ML_hard = zeros(dim1, Nb);
bits_decoded_ML_soft = zeros(dim1, Nb);

for i=1:dim1
    v = vitdec(bits_recus_ZF(i,:),trellis,tblen,'trunc','hard');
    v = deintrlv(v, vect_perm);
    v = step(decoder, v.');
    bits_decoded_ZF(i,:) = v.';

    v = vitdec(bits_recus_ML_hard(i,:),trellis,tblen,'trunc','hard');
    v = deintrlv(v, vect_perm);
    v = step(decoder, v.');
    bits_decoded_ML_hard(i,:) = v.';

    v = vitdec(bits_recus_ML_soft(i,:),trellis,tblen,'trunc','unquant');
    v = deintrlv(v, vect_perm);
    v = step(decoder, v.');
    bits_decoded_ML_soft(i,:) = v.';    
end


TEB_ZF = mean(abs(liste_bits_avec-bits_decoded_ZF),2);
TEB_ML_hard = mean(abs(liste_bits_avec-bits_decoded_ML_hard),2);
TEB_ML_soft = mean(abs(liste_bits_avec-bits_decoded_ML_soft),2);


% La diversité
d_ZF = polyfit(Eb_N0_dB,10*log(TEB_ZF),1);
d_ML_hard = polyfit(Eb_N0_dB,10*log(TEB_ML_hard),1);
d_ML_soft = polyfit(Eb_N0_dB,10*log(TEB_ML_soft),1);

figure()
semilogy(Eb_N0_dB, TEB_ZF);
hold on
grid on
semilogy(Eb_N0_dB, TEB_ML_hard);
hold on
grid on
semilogy(Eb_N0_dB, TEB_ML_soft);
legend("avec ZF","avec ML hard", "avec ML soft")
xlabel('E_b/N_0 (dB)')
ylabel('TEB')
title('TEB avec entrelaceur et code convolutif R=1/2')





















%% Partie Rayleigh sans entrelaceur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Partie Rayleigh sans entrelaceur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclaration des données
N = 1e4;
Tc = 10*Ts;
Fc = 1/(5*Tc);
K_rice = 5;

% Partie II : communications avec les mobiles par satellites
% Modelisation du canal mobile satellite
liste_bits_ss = randi([0,1],1,N);
symboles_ss = (qammod(liste_bits_ss.', M, 'InputType', 'bit')).';


% Codage canal

bits_coded_ss = convenc(liste_bits_ss, trellis); % Effectuer un codage convolutionnel
N_c_ss = length(bits_coded_ss);  % La longueur du résultat du codage convolutionnel

symboles_coded_ss = (qammod(bits_coded_ss.',M,'InputType','bit')).';

% surechantillonage 
signal_surechantillone_ss = kron(symboles_ss,[1 zeros(1, Ns-1)]); % sans codage
signal_coded = kron(symboles_coded_ss,[1 zeros(1, Ns-1)]); % avec codage

x_ss = filter(h,1,[signal_surechantillone_ss  zeros(1, n0-1)]); % sans codage
x_coded_ss = filter(h,1,[signal_coded  zeros(1, n0-1)]); % avec codage
Eb_NO_dB = -5:2;

%x=x(1+sigma :length(x));
n_ss = length(x_ss);
n_coded_ss = length(x_coded_ss);

[nom , denom] = butter(2, Fc); % génération des coefficients d'un filtre Butterworth

s = nom./denom;
bruit_blanc = randn(1,n_ss) + randn(1,n_ss)*1i; % génèration d'un bruit blanc gaussien 
m = filter(s, 1, bruit_blanc); % filtrer le bruit blanc avec le filtre Butterworth

%Canal de Rayleigh
bruit_Rayleigh = randn(1,n_ss) + randn(1,n_ss)*1i ; % génèration d'un bruit Gaussien complexe
s_Rayleigh = m.*x_ss;  %simuler un canal de Rayleigh

%Canal de Rice 
bruit_Rice = K_rice + randn(1,n_ss) + randn(1,n_ss)*1i;%génèration d'un bruit Rice en ajoutant une constante K et du bruit Gaussien complexe
s_Rice = m.*x_ss + a*x_ss;  % simuler un canal Rice

%Etude de la diversité apportée par le codage dans un canal de Rayleigh non
%sélectif en fréquenceS

% sans codage
c_Rayleigh_ss = rand(1,n_ss) + rand(1,n_ss)*1i;
x_Rayleigh_ss = x_ss.*c_Rayleigh_ss;

% avec codage
c_Rayleigh_coded_ss = rand(1,n_coded_ss) + rand(1,n_coded_ss)*1i;
x_Rayleigh_coded_ss = x_coded_ss.*c_Rayleigh_coded_ss;


PxRayleigh_ss = mean(abs(x_Rayleigh_ss).^2); % Puissance du signal émis
PxRayleigh_coded_ss = mean(abs(x_Rayleigh_coded_ss).^2); % Puissance avec codage
sigma_ne_ss = sqrt((PxRayleigh_ss * Ns)./(2*log2(M)*Eb_N0));
sigma_ne_coded_ss = sqrt((R*PxRayleigh_coded_ss * Ns)./(2*log2(M)*Eb_N0));
dim2_ss = length(x_Rayleigh_ss);
dim2_coded_ss = length(x_Rayleigh_coded_ss);

n_I_R_ss = zeros(dim1, dim2_ss);
n_I_R_coded_ss = zeros(dim1, dim2_coded_ss);
n_Q_R_ss = zeros(dim1, dim2_ss);
n_Q_R_coded_ss = zeros(dim1, dim2_coded_ss);
n_e_R_ss = zeros(dim1, dim2_ss);
n_e_R_coded_ss = zeros(dim1, dim2_coded_ss);

for i=1:dim1
    n_I_R_ss(i,:) = sigma_ne_ss(i).*randn(1,dim2_ss);
    n_I_R_coded_ss(i,:) = sigma_ne_coded_ss(i).*randn(1,dim2_coded_ss);
    n_Q_R_ss(i,:) = sigma_ne_ss(i).*randn(1,dim2_ss);
    n_Q_R_coded_ss(i,:) = sigma_ne_coded_ss(i).*randn(1,dim2_coded_ss);
    n_e_R_ss(i,:) = n_I_R_ss(i,:) + 1i* n_Q_R_ss(i,:);
    n_e_R_coded_ss(i,:) = n_I_R_coded_ss(i,:) + 1i* n_Q_R_coded_ss(i,:);
end
clear i

r_ss = x_Rayleigh_ss + n_e_R_ss;
r_coded_ss = x_Rayleigh_coded_ss + n_e_R_coded_ss; 

z_ss = zeros(dim1, dim2_ss);
z_coded_ss = zeros(dim1, dim2_coded_ss);
for i=1:dim1
    z_ss(i,:) = filter(h,1,r_ss(i,:));
    z_coded_ss(i,:) = filter(h,1,r_coded_ss(i,:));
end
clear i;

% Echantillonnage

    % Sans codage
z_ech_ss = z_ss(:, n0: Ns :end);
c_Rayleigh_m_ss = c_Rayleigh_ss(n0 : Ns : end);

    % Avec codage
z_ech_coded_ss = z_coded_ss(:, n0: Ns :end);
c_Rayleigh_m_coded_ss = c_Rayleigh_coded_ss(n0 : Ns : end);

% égalisation
    % Sans codage
z_ech_ZF_ss = zeros(dim1, length(z_ech_ss(1,:)));
z_ech_ML_ss = zeros(dim1, length(z_ech_ss(1,:)));

    % Avec codage
z_ech_ZF_coded_ss = zeros(dim1, length(z_ech_coded_ss(1,:)));
z_ech_ML_coded_ss = zeros(dim1, length(z_ech_coded_ss(1,:)));
for i=1:dim1

    % Sans codage
    z_ech_ZF_ss(i,:) = z_ech_ss(i,:)./c_Rayleigh_m_ss;
    z_ech_ML_ss(i,:) = z_ech_ss(i,:).*conj(c_Rayleigh_m_ss);

    % Avec codage
    z_ech_ZF_coded_ss(i,:) = z_ech_coded_ss(i,:)./c_Rayleigh_m_coded_ss;
    z_ech_ML_coded_ss(i,:) = z_ech_coded_ss(i,:).*conj(c_Rayleigh_m_coded_ss);
end

    % Sans codage
bits_recus_ZF_ss = zeros(dim1, N);
bits_recus_ML_ss = zeros(dim1, N);

    % Avec codage
bits_recus_ZF_coded_ss = zeros(dim1, N_c_ss);
bits_recus_ML_coded_ss = zeros(dim1, N_c_ss);

for i =1:dim1

    % Sans codage
    bits_recus_ZF_ss(i,:) = (qamdemod(z_ech_ZF_ss(i,:).', M, 'OutputType', 'bit')).';
    bits_recus_ML_ss(i,:) = (qamdemod(z_ech_ML_ss(i,:).', M, 'OutputType', 'bit')).';

    % Avec codage
    bits_recus_ZF_coded_ss(i,:) = (qamdemod(z_ech_ZF_coded_ss(i,:).', M, 'OutputType', 'bit')).';
    bits_recus_ML_coded_ss(i,:) = (qamdemod(z_ech_ML_coded_ss(i,:).', M, 'OutputType', 'bit')).';
end
clear i

% Décodage canal
bits_decoded_ZF_ss = zeros(dim1, N);
bits_decoded_ML_ss = zeros(dim1, N);
for i=1:dim1
    bits_decoded_ZF_ss(i,:) = vitdec(bits_recus_ZF_coded_ss(i,:),trellis,tblen,'trunc','hard');
    bits_decoded_ML_ss(i,:) = vitdec(bits_recus_ML_coded_ss(i,:),trellis,tblen,'trunc','hard');
end

% TEB_ZF_ss = zeros(1 , length(ebnodB));
TEB_ML_ss = zeros(1 , length(Eb_NO_dB));
TEB_ZF_coded_ss = zeros(1 , length(Eb_NO_dB));
TEB_ML_coded_ss = zeros(1 , length(Eb_NO_dB));
for i=1:dim1
    % Sans codage
    TEB_ZF_ss(i) = mean(abs(liste_bits_ss-bits_recus_ZF_ss(i,:)));
    TEB_ML_ss(i) = mean(abs(liste_bits_ss-bits_recus_ML_ss(i,:)));
    % Avec codage
    TEB_ZF_coded_ss(i) = mean(abs(liste_bits_ss-bits_decoded_ZF_ss(i,:)));
    TEB_ML_coded_ss(i) = mean(abs(liste_bits_ss-bits_decoded_ML_ss(i,:)));
end


% La diversité
d_ZF_ss = polyfit(Eb_NO_dB,10*log(TEB_ZF_ss),1);
d_ML_ss = polyfit(Eb_NO_dB,10*log(TEB_ML_ss),1);
d = d_ML_ss;
d_ZF_coded_ss = polyfit(Eb_NO_dB,10*log(TEB_ZF_coded_ss),1);
d_ML_coded_ss = polyfit(Eb_NO_dB,10*log(TEB_ML_coded_ss),1);
d_coded_ss = d_ML_coded_ss;

figure()
semilogy(Eb_NO_dB, TEB_ZF_ss);
hold on
grid on 
semilogy(Eb_NO_dB, TEB_ML_ss);
legend("avec ZF","avec ML")
xlabel('E_b/N_0 (dB)')
ylabel('TEB')
title('Comparaison entre TEB ZF et TEB ML')

figure()
semilogy(Eb_NO_dB, TEB_ZF_coded_ss);
hold on
grid on
semilogy(Eb_NO_dB, TEB_ML_coded_ss);
hold on
grid on
xlabel('E_b/N_0 (dB)')
ylabel('TEB')
title('Comparaison entre TEB ZF et TEB ML avec codage R=1/2')
legend("ZF avec codage R=1/2", "ML avec codage R=1/2")