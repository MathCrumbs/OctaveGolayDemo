function p = GolayVectorEncode (d, G)

  n = size(d)(2);
  n3 = floor(n/3);
  b1 = zeros(1,8);

  w = 2 .^ (0:7);

  for i = 1:n3
    b1 = bitget(d(3*i-2),1:8);
    b2 = bitget(d(3*i-1),1:8);
    b3 = bitget(d(3*i),1:8);
  
    d1 = [b1,b2(1:4)];
    d2 = [b2(5:8),b3];
  
    y1 = mod(d1 * G,2);
    y2 = mod(d2 * G,2);

    f = y1(13:20); 
    p(3*i-2)= w * f';
    f = [y1(21:23),0,y2(13:16)];
    p(3*i-1)= w * f';
    f = [y2(17:23),0];
    p(3*i)= w * f';
  endfor
endfunction
