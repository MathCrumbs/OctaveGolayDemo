function [flag,f] = nextPattern (e)
  flag=1;
  i=1;
  while (e(i) == 0)
    i = i + 1;
  endwhile
  j = 0;
  while ((i < 24) && (e(i) == 1) )
    e(i) = 0;
    i = i + 1;
    j = j + 1;
  endwhile
  if (i == 24)
    flag = 0;
  else
    e(i) = 1;
  endif
  for i=1:(j-1)
    e(i)=1;
  endfor
  f=e;
endfunction
