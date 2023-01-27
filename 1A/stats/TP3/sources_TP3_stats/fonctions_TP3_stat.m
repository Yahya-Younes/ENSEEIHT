
% TP3 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : YOUNES
% Prenom : Yahya
% Groupe : 1SN-B

function varargout = fonctions_TP3_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction estimation_F (exercice_1.m) ------------------------------------
function [rho_F,theta_F,ecart_moyen] = estimation_F(rho,theta)

Y = rho;
X = [cos(theta),sin(theta)];
A = X\Y;
x_F = A(1);
y_F = A(2);
rho_F = sqrt(x_F^2 + y_F^2);
theta_F = atan2(y_F,x_F);




    % A modifier lors de l'utilisation de l'algorithme RANSAC (exercice 2)
    ecart_moyen = (1/length(rho))*sum(abs(rho - rho_F*cos(theta-theta_F)));

end

% Fonction RANSAC_2 (exercice_2.m) ----------------------------------------
function [rho_F_estime,theta_F_estime] = RANSAC_2(rho,theta,parametres)

S1 = parametres(1);
S2 = parametres(2);
k_max = parametres(3);
n= length(rho);  
residu_inf = Inf;
for k=1 : k_max
        ind = randperm(n,2);
        [rho_F , theta_F] = estimation_F(rho(ind) , theta(ind));
        residu = abs(rho - rho_F*cos(theta - theta_F));
        I = residu <=S1;
        droites_conformes = sum(I)/length(I);
        if  droites_conformes >= S2 
             residu = sum(1/length(I)*abs(rho(I) - rho_F*cos(theta(I) - theta_F)));
              if residu <= residu_inf
                  residu_inf = residu;
                  rho_F_estime = rho_F;
                  theta_F_estime = theta_F;
              end;
       end ; 
end ; 

    
end



% Fonction G_et_R_moyen (exercice_3.m, bonus, fonction du TP1) ------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)

G = [mean(x_donnees_bruitees),mean(y_donnees_bruitees)];
x = (x_donnees_bruitees-G(1));
y = (y_donnees_bruitees-G(2));
distances = sqrt(x.^2 + y.^2);
R_moyen = mean(distances);

end

% Fonction estimation_C_et_R (exercice_3.m, bonus, fonction du TP1) -------
function [C_estime,R_estime,critere] = ...
         estimation_C_et_R(x_donnees_bruitees,y_donnees_bruitees,n_tests,C_tests,R_tests)
     
    % Attention : par rapport au TP1, le tirage des C_tests et R_tests est 
    %             considere comme etant deje effectue 
    %             (il doit etre fait au debut de la fonction RANSAC_3)

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


end

% Fonction RANSAC_3 (exercice_3, bonus) -----------------------------------
function [C_estime,R_estime] = ...
         RANSAC_3(x_donnees_bruitees,y_donnees_bruitees,parametres)
     
    % Attention : il faut faire les tirages de C_tests et R_tests ici



end
