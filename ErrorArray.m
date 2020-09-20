function ba = ErrorArray (n,m,p)
  for i=1:m
    ba(i,:) = ErrorVector (n,p);
  endfor
endfunction
    
