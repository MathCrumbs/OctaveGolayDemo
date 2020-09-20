clear;

imgOriginal = imread("Images/einstein.png");
[m,n] = size(imgOriginal);

imgModified = imread("Images/einstein_0.01_error_decoded.png");

imgCompare = 1 .- (imgOriginal == imgModified(:,1:n));

byteErrors = sum(sum(imgCompare));