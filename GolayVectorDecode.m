function [dHat, pHat, bitCorrectionCount] = GolayVectorDecode (d,p,H,errorTable)

	n = size(d)(2);
	n3 = floor(n/3);
	b1 = zeros(1,8);

	w = 2 .^ (0:7);
	v = 2 .^ (0:10);

	bitCorrectionCount = 0;

	for i = 1:n3
		b1 = bitget(d(3*i-2),1:8);
		b2 = bitget(d(3*i-1),1:8);
		b3 = bitget(d(3*i),1:8);
		p1 = bitget(p(3*i-2),1:8);
		p2 = bitget(p(3*i-1),1:8);
		p3 = bitget(p(3*i),1:8);
	  
		y1 = [b1,b2(1:4),p1,p2(1:3)];
		y2 = [b2(5:8),b3,p2(5:8),p3(1:7)];

		z1 = mod(y1 * H',2);
		if sum(z1) > 0
			e = errorTable(v*z1',:);
			y1 = mod(y1+e,2);
			bitCorrectionCount = bitCorrectionCount + sum(e);
		endif
		z2 = mod(y2 * H',2);  
		if sum(z2) > 0
			e = errorTable(v*z2',:);
			y2 = mod(y2+e,2);
			bitCorrectionCount = bitCorrectionCount + sum(e);
		endif

		f = y1(1:8); 
		dHat(3*i-2)= w * f';
		f = [y1(9:12),y2(1:4)];
		dHat(3*i-1)= w * f';
		f = y2(5:12);
		dHat(3*i)= w * f';

		f = y1(13:20); 
		pHat(3*i-2)= w * f';
		f = [y1(21:23),0,y2(13:16)];
		pHat(3*i-1)= w * f';
		f = [y2(17:23),0];
		pHat(3*i)= w * f';

	endfor
endfunction