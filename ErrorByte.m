function b = ErrorByte (p)
  b=0;
  d=1;
  for i=1:8
    if rand()<p
      b=b+d;
    endif
    d = d+d;
  endfor
endfunction
    
