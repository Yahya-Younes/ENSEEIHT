%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% cgs.m
%--------------------------------------------------------------------------

function Q = cgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    %------------------------------------------------
    % A remplir
    % Algorithme de Gram-Schmidt classique
    %------------------------------------------------
Q(:,1) = Q(:,1)/norm(Q(:,1));
for i = 2:m
    for j = 1:i-1
        Q(:,i) = Q(:,i) - A(:,i)'*Q(:,j)*Q(:,j); 
    end
    Q(:,i) = Q(:,i)/norm(Q(:,i));
end