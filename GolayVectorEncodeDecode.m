clear;
load GolayTables.mat; #run GolayTableGenerator to make the tables

n=6;
m=2;
for i=1:m
  d(i,:) = mod(1:n,256);
endfor


p = GolayArrayEncode (d, G);
#"hello world" 

#rand("state", 1234324);
prob = 0.02;
dErrors = ErrorArray(n,m, prob);
pErrors = ErrorArray(n,m, prob);

d = bitxor(dErrors, d);
p = bitxor(pErrors, p);

[dHat, pHat, bitCorrectionCount] = GolayArrayDecode (d,p,H,errorTable);
 
#ByteErrorCount = n-sum(dHat == mod(1:513,256))
bitCorrectionCount