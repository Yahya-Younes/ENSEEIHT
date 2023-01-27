
% TP2 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : YOUNES
% Prénom : Yahya
% Groupe : 1SN-B

function varargout = fonctions_TP2_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction centrage_des_donnees (exercice_1.m) ----------------------------
function [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)
x_G = mean(x_donnees_bruitees);
y_G = mean(y_donnees_bruitees);
x_donnees_bruitees_centrees = x_donnees_bruitees - x_G;
y_donnees_bruitees_centrees = y_donnees_bruitees - y_G;     
end

% Fonction estimation_Dyx_MV (exercice_1.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
           estimation_Dyx_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)
psi = (randn(n_tests,1)-0.5)*(pi/2);    
[x_G, y_G, x_centrees, y_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
Y = repmat(y_centrees,[n_tests,1]);
A = sum((Y-tan(psi).*x_centrees).^2,2);
[~,I] = min(A);
psi_min = psi(I);
a_Dyx = tan(psi_min); 
b_Dyx = y_G - a_Dyx*x_G;
end

% Fonction estimation_Dyx_MC (exercice_2.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
                   estimation_Dyx_MC(x_donnees_bruitees,y_donnees_bruitees)
A = [x_donnees_bruitees;ones(size(x_donnees_bruitees))]';
B = y_donnees_bruitees';
X = A\B;
a_Dyx = X(1);
b_Dyx = X(2);  
end

% Fonction estimation_Dorth_MV (exercice_3.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
         estimation_Dorth_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)

theta = rand(n_tests,1)*pi;
[x_G,y_G,x_centrees,y_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
n = length(repmat(x_centrees,n_tests,1));
ecrt = cos(repmat(theta,1,n))*repmat(x_centrees,n_tests,1) + sin(repmat(theta,1,n).^2)*repmat(y_centrees,n_tests,1);
A = sum(ecrt.^2,2);
[~,I] = min(A);
theta_Dorth = theta(I);
rho_Dorth = x_G*cos(theta_Dorth) + y_G*sin(theta_Dorth);
end

% Fonction estimation_Dorth_MC (exercice_4.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
                 estimation_Dorth_MC(x_donnees_bruitees,y_donnees_bruitees)

[x_G,y_G,x_centrees,y_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
A = [x_centrees,y_centrees];
C = A';
[V D] = eig(A*C);
P = diag(D);
[~, ind] = min(P);
Y = V(:,ind);
cos_estime = Y(1);
sin_estime = Y(2);
rho_estime = x_G*cos_estime + y_G*sin_estime;



end
