clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Separation des canaux RVB','Position',[0,0,0.67*L,0.67*H]);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0.67*L,0,0.33*L,0.45*H]);

% Lecture et affichage d'une image RVB :
I = imread('ishihara-0.png');
figure(1);				% Premiere fenetre d'affichage
subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
imagesc(I);
axis off;
axis equal;
title('Image RVB','FontSize',20);

% Decoupage de l'image en trois canaux et conversion en doubles :
R = double(I(:,:,1));
V = double(I(:,:,2));
B = double(I(:,:,3));

% Affichage du canal R :
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(2,2,2);
imagesc(R);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal V :
subplot(2,2,3);
imagesc(V);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal B :
subplot(2,2,4);
imagesc(B);
axis off;
axis equal;
title('Canal B','FontSize',20);

% Affichage du nuage de pixels dans le repere RVB :
figure(2);				% Deuxieme fenetre d'affichage
plot3(R,V,B,'b.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Matrice des donnees :
X = [R(:) V(:) B(:)];		% Les trois canaux sont vectorises et concatenes
m = size(X,2);

% Matrice de variance/covariance :
x_bar = (1/m).*X';
X_c = repmat(x_bar,m,1);
Sigma = (1/m).*(X_c'*X_c);

% Coefficients de correlation lineaire :
r1 = Sigma(1,2)/sqrt(Sigma(1,1)*Sigma(2,2));
r2 = Sigma(2,3)/sqrt(Sigma(1,1)*Sigma(3,3));
r3 = Sigma(3,1)/sqrt(Sigma(1,1)*Sigma(1,1));

% Proportions de contraste :
c_x = Sigma(1,1)/trace(Sigma);
c_y = Sigma(2,2)/trace(Sigma);
c_z = Sigma(3,3)/trace(Sigma);

% Calcul des valeurs propres par ordre croissant
[W,D] = eig(Sigma);

% Tri des valeurs propres ordre décroissant
sort(diag(D), 'descend');

% Calcul de la matrice des composantes principales
C= X_c*W;
colormap gray;
I = reshape(C(:,1), size(R));

