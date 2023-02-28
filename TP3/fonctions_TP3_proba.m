
% TP3 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : Younes
% Prénom : Yahya
% Groupe : 1SN-B

function varargout = fonctions_TP3_proba(varargin)

    switch varargin{1}
        
        case 'matrice_inertie'
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case {'ensemble_E_recursif','calcul_proba'}
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
    
    end
end

% Fonction ensemble_E_recursif (exercie_1.m) ------------------------------
function [E,contour,G_somme] = ...
    ensemble_E_recursif(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)
[n,p] = size (voisins);
contour(i,j) = 0;
k = 1;
while k <= n & size(E,1) <= card_max
    a = i + voisins(k,1);
    b = j + voisins(k,1);
    if contour(a,b) == 1
       grad = [G_x(a,b) G_y(a,b)];
       if dot((grad/norm(grad)),(G_somme/norm(G_somme))) >= cos_alpha
           E = [E ; a b];
           G_somme = G_somme + [G_x(a,b) G_y(a,b)];
           [E,contour,G_somme] = ensemble_E_recursif(E,contour,G_somme,a,b,voisins,G_x,G_y,card_max,cos_alpha);    
       end
    end
k = k+1;
end  
end

% Fonction matrice_inertie (exercice_2.m) ---------------------------------
function [M_inertie,C] = matrice_inertie(E,G_norme_E)
S = sum(G_norme_E);
C = (1/P) * sum(G_norme_E .* E);
M_inertie(1,1) = (1/S) * sum(G_norme_E .* ((E(1,:)-C(1,:)) .* (E(1,:)-C(1,:))));
M_inertie(1,2) = (1/S) * sum(G_norme_E .* ((E(1,:)-C(1,:)) .* (E(2,:)-C(2,:))));
M_inertie(2,1) = (1/S) * sum(G_norme_E .* ((E(2,:)-C(2,:)) .* (E(1,:)-C(1,:))));
M_inertie(2,2) = (1/S) * sum(G_norme_E .* ((E(2,:)-C(2,:)) .* (E(2,:)-C(2,:))));

end
% Fonction calcul_proba (exercice_2.m) ------------------------------------
function [x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p)
X = E_nouveau_repere(:,1);
   Y = E_nouveau_repere(:,2);
   x_min = min(X);
   y_min = min(Y);
   x_max = max(X);
   y_max = max(Y);
   lar = x_max-x_min;
   lon = y_max-y_min;
   N = lar*lon;
   probabilite = 1-binocdf(length(E_nouveau_repere),floor(N),p);
    
end
