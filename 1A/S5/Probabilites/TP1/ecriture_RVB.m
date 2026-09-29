function image_RVB = ecriture_RVB(image_originale)
[n,p] = size (image_originale);
image_RVB = ones(n/2,p/2,3);

image_RVB(:,:,1) = image_originale(1:2:end , 2:2:end);
image_RVB(:,:,2) = (1/2)*(image_originale(1:2:end , 1:2:end)+ image_originale(1:2:end , 1:2:end))
image_RVB(:,:,3) = image_originale(2:2:end , 1:2:end);

end