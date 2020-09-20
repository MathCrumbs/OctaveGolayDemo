clear;
g = [[1,1,0,0,0,1,1,1,0,1,0,1],zeros(1,11)];

for i=1:12  #Generator matrix corresponding to polynomial multiplication
  G(i,:)=g;
  g = circshift(g,1);
endfor

for i=1:11 #Converting the generator matrix to the systematic form
  for j=(i+1):12
    G(i,:) = mod(G(i,j) .* G(j,:) + G(i,:),2);
  endfor
endfor

A = G(:,13:23);
H = [A',eye(11)]; #Creating the syndrome matrix

F=mod(G*H',2); #F=0 shows that rows of H and G are perpendicular

x = [1,0,0,1,1,0,0,1,1,0,0,1];
y = mod(x*G,2);
z = mod(y*H',2);

e = zeros(1,23);
e(3) = 1;
e(5) = 1;
e(11) = 1;

ze = mod((e+y)*H',2); #calculate the syndrome vector, that points to the error pattern

F #all zeroes prove that rows of H and G are perpendicular
G #a systematic representation of the generator matrix
H #the corresponding syndrome matrix
x
y
z
ze


w = 2 .^ (0:10);
errorTable = zeros(2047,23); #lookup error pattern for a specific syndrome <> 0

e = zeros(1,23); #first error pattern with one error
e(1) = 1;

flag = 1;
while (flag == 1)
  ze = mod(e*H',2); #calculate the syndrome vector
  idx = ze * w';
  errorTable(idx,:) = e;
  [flag, e] = nextPattern(e);
endwhile

e = zeros(1,23); #first error pattern with two errors
e(1) = 1;
e(2) = 1;

flag = 1;
while (flag == 1)
  ze = mod(e*H',2); #calculate the syndrome vector
  idx = ze * w';
  errorTable(idx,:) = e;
  [flag, e] = nextPattern(e);
endwhile

e = zeros(1,23); #first error pattern with three errors
e(1) = 1;
e(2) = 1;
e(3) = 1;

flag = 1;
while (flag == 1)
  ze = mod(e*H',2); #calculate the syndrome vector
  idx = ze * w';
  errorTable(idx,:) = e;
  [flag, e] = nextPattern(e); #flag=0 means no next pattern
endwhile

save GolayTables.mat G H errorTable;