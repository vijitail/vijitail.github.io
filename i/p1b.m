x = imread('imagesfolder/baboon.png'); 
x = rgb2gray(x); 
x = im2double(x); 
[row col] = size(x); 
c=2; 
for i = 1:row 
for j = 1:col 
N(i,j)=c*log(1+x(i,j)); 
endfor
endfor
figure
imshow(x);
title('Original Image');
figure
imshow(N);
title('Log Transformation Filtered Image');
