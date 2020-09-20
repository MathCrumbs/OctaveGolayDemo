function bv = ErrorVector (n,p)
  bv=zeros(1,n);
  for i=1:n
    bv(i) = ErrorByte(p);
  endfor
endfunction
    
