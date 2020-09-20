clear;
load GolayTables.mat; #run GolayTableGenerator to make the tables

img = imread("Images/einstein_encoded_0.01_error.png");
[m,n] = size(img);
ndiv2 = n/2;

d = img(:,1:ndiv2);
p = img(:,(ndiv2+1):n);

[dHat, pHat, bitCorrectionCount] = GolayArrayDecode (d,p,H,errorTable);

img2 = uint8(dHat(:,1:(ndiv2-1)));

imwrite(img2,"Images/einstein_0.01_error_decoded.png");
