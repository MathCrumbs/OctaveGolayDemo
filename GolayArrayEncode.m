function p = GolayArrayEncode (d, G)

  [m,n] = size(d);
  for i=1:m
    p(i,:) = GolayVectorEncode(d(i,:),G);
  endfor
endfunction
