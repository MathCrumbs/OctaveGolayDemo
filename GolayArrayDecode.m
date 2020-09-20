function [dHat, pHat, bitCorrectionCount] = GolayArrayDecode (d,p,H,errorTable)

  [m,n] = size(d);
  for i=1:m
    [dHat(i,:), pHat(i,:), bcc] = GolayVectorDecode (d(i,:),p(i,:),H,errorTable);
    bitCorrectionCount(i) = bcc;
  endfor
endfunction