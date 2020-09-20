clear;
load GolayTables.mat; #run GolayTableGenerator to make the tables

#img = imread("Images/einstein.png");
img = imread("Images/einstein_encoded.png");
[m,n] = size(img);

#rand("state", 1234324);
#prob = 0.0005;
prob = 0.01;
errors = ErrorArray(n,m, prob);

img = bitxor(img, errors);


imwrite(img,"Images/einstein_encoded_0.01_error.png");
