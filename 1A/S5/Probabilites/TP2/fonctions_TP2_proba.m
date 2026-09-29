
% TP2 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : YOUNES
% Prenom : Yahya
% Groupe : 1SN-B

function varargout = fonctions_TP2_proba(varargin)

    switch varargin{1}
        
        case {'calcul_frequences_caracteres','determination_langue','coeff_compression','gain_compression','partitionnement_frequences'}

            varargout{1} = feval(varargin{1},varargin{2:end});
            
        case {'recuperation_caracteres_presents','tri_decroissant_frequences','codage_arithmetique'}
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case 'calcul_parametres_correlation'
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
            
    end

end

% Fonction calcul_frequences_caracteres (exercice_0.m) --------------------
function frequences = calcul_frequences_caracteres(texte,alphabet)
frequences = zeros(1,length(alphabet));
for i= 1:length(alphabet)
    frequences(i) = (1/length(texte))*sum(texte == alphabet(i));
end
end

% Fonction recuperation_caracteres_presents (exercice_0.m) ----------------
function [selection_frequences,selection_alphabet] = ...
                      recuperation_caracteres_presents(frequences,alphabet)
selection_frequences = frequences(find(frequences>0));
selection_alphabet = alphabet(find(frequences>0));

end

% Fonction tri_decremental_frequences (exercice_0.m) ----------------------
function [frequences_triees,indices_frequences_triees] = ...
                           tri_decroissant_frequences(selection_frequences)
[frequences_triees,indices_frequences_triees] = sort(selection_frequences,'descend');

end

% Fonction determination_langue (exercice_1.m) ----------------------------
function langue = determination_langue(frequences_texte, frequences_langue, nom_norme)
    % Note : la variable nom_norme peut valoir 'L1', 'L2' ou 'Linf'.
[n,p] = size(frequences_langue);
err = zeros(n,1);
switch nom_norme 
    case 'L2'
        err = sum((frequences_langue-frequences_texte).^2,1);

    case 'L1'
        err = sum(abs((frequences_langue-frequences_texte)),1);
    

    case'Linf'
        err= max(abs(frequences_langue-frequences_texte));
    
end
langue = find(min(err));
end

% Fonction coeff_compression (exercice_2.m) -------------------------------
function coeff_comp = coeff_compression(signal_non_encode,signal_encode)
coeff_comp = (8*length(signal_non_encode))/(length(signal_encode));

end

% Fonction coeff_compression (exercice_2bis.m) -------------------------------
function gain_comp = gain_compression(coeff_comp_avant,coeff_comp_apres)
 n_compression = 0;  
  n_ss_compression = 8*sum(coeff_comp_avant);
  for i=1 :length(coeff_comp_avant)
      n_compression = n_compression + coeff_comp_avant(i)*length(coeff_comp_apres{i,2});
              
  end
    gain_comp = n_ss_compression/n_compression;  
end


% Fonction partitionnement_frequences (exercice_3.m) ----------------------
function bornes = partitionnement_frequences(selection_frequences)
longueur = length(selection_frequences);
bornes   = zeros(2,longueur);
bornes(1,1) = 0;
bornes(2,1) = selection_frequences(1);
for i = 2 : longueur
    bornes(1,i) = bornes(2,i-1);
    bornes(2,i) = selection_frequences(i) + bornes(2,i-1);
end 


end

% Fonction codage_arithmetique (exercice_3.m) -----------------------------
function [borne_inf,borne_sup] = ...
                       codage_arithmetique(texte,selection_alphabet,bornes)
[n, p] = size(texte);
borne_inf = 0;

borne_sup = 1;
for i = 1 : p
    j = find(selection_alphabet == texte(i));    
    largeur = borne_sup - borne_inf;
    borne_sup = borne_inf + largeur*bornes(2,j);
    borne_inf = borne_inf + largeur*bornes(1,j);
end

    
end