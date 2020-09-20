clear;
load GolayTables.mat; #run GolayTableGenerator to make the tables

img = imread("Images/einstein.png");
[m,n] = size(img);

nAdd = mod(3-mod(n,3),3); #increase the width to be a factor of 3

if nAdd > 0
  padding = zeros(m,nAdd);
  img = [img,padding];
endif
p = GolayArrayEncode (img, G);
img = [img,p];

imwrite(img,"Images/einstein_encoded.png");
