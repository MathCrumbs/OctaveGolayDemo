clear;
load GolayTables.mat; #run GolayTableGenerator to make the tables

x = [1,0,0,1,1,0,0,1,1,0,0,1];
y = mod(x*G,2); #generate the code word corresponding to x
w = 2 .^ (0:10);

e = zeros(1,23);
e(3) = 1;
e(5) = 1;
e(11) = 1;

yError = mod(y + e,2); #the received code word with errors

z = mod(yError*H',2); #calculate the syndrome vector
eEstimate = errorTable(w*z',:); #lookup the estimated error pattern
yEstimate = mod(yError + eEstimate,2);#estimate the original codeword
xEstimate = yEstimate(1:12); #grab the data bits 

x
y
e
yError
z
eEstimate
yEstimate
xEstimate

