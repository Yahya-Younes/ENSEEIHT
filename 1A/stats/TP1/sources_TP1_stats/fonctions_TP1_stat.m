
% TP1 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : YOUNES
% Prénom : Yahya
% Groupe : 1SN-B

function varargout = fonctions_TP1_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction G_et_R_moyen (exercice_1.m) ----------------------------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
G = [mean(x_donnees_bruitees),mean(y_donnees_bruitees)];
x = (x_donnees_bruitees-G(1));
y = (y_donnees_bruitees-G(2));
distances = sqrt(x.^2 + y.^2);
R_moyen = mean(distances);

     
end

% Fonction estimation_C_uniforme (exercice_1.m) ---------------------------
function [C_estime, R_moyen] = ...
         estimation_C_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
[G, R_moyen,~] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C = G + (rand(n_tests,2)-0.5)*2*R_moyen;
%calculer distance
n =length(x_donnees_bruitees);
ecart_x = repmat(x_donnees_bruitees,n_tests,1)-repmat(C(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1)-repmat(C(:,2),1,n);
eps = sqrt(ecart_x.^2 + ecart_y.^2) - R_moyen;
residus = sum(eps.^2,2);
[~, position] = min(residus);
C_estime = C(position,:);
  

end

% Fonction estimation_C_et_R_uniforme (exercice_2.m) ----------------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)
[G, R_moyen, ~] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C_test = G + (rand(n_tests,2)-0.5)*2*R_moyen;
R_test = (rand(n_tests,1)+0.5)*R_moyen;
%calculer distance
n =length(x_donnees_bruitees);
ecart_x = repmat(x_donnees_bruitees,n_tests,1)-repmat(C_test(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1)-repmat(C_test(:,2),1,n);
eps = sqrt(ecart_x.^2 + ecart_y.^2) - repmat(R_test,1,n);
residus = sum(eps.^2,2);
[~, position] = min(residus);
C_estime = C_test(position,:);
R_estime = R_test(position,:);
end

% Fonction occultation_donnees (donnees_occultees.m) ----------------------
function [x_donnees_bruitees, y_donnees_bruitees] = occultation_donnees(x_donnees_bruitees, y_donnees_bruitees, theta_donnees_bruitees)
theta = randn(2,1)*2*pi;
if theta(1) <= theta(2)
    theta_bruit_ind = find(theta(1)<= theta_donnees_bruitees & theta_donnees_bruitees <= theta(2));
else 
    theta_bruit_ind = find(0 <= theta_donnees_bruitees & theta_donnees_bruitees <= theta(1)  | theta(2) <= theta_donnees_bruitees & theta_donnees_bruitees < 2*pi);
end
x_donnees_bruitees = x_donnees_bruitees(theta_bruit_ind);
y_donnees_bruitees = y_donnees_bruitees(theta_bruit_ind);
end
% Fonction estimation_C_et_R_normale (exercice_4.m, bonus) ----------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_normale(x_donnees_bruitees,y_donnees_bruitees,n_tests)
[G, R_moyen, ~] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);
C_test = G + (rand(n_tests,2)-0.5)*2*R_moyen;
R_test = (randn(n_tests,1)+0.5)*R_moyen;
%calculer distance
n =length(x_donnees_bruitees);
ecart_x = repmat(x_donnees_bruitees,n_tests,1)-repmat(C_test(:,1),1,n);
ecart_y = repmat(y_donnees_bruitees,n_tests,1)-repmat(C_test(:,2),1,n);
eps = sqrt(ecart_x.^2 + ecart_y.^2) - repmat(R_test,1,n);
residus = sum(eps.^2,2);
[~, position] = min(residus);
C_estime = C_test(position,:);
R_estime = R_test(position,:);
end
