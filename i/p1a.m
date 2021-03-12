pkg load image;

x = imread('imagesfolder/baboon.png');
x = rgb2gray(x);
x = im2double(x);

[row col] = size(x);

for i =1:row
  for j = 1:col
    
    N(i,j) = 1 - x(i,j);
    
  endfor;
endfor;

figure
imshow(x);
title('Original Image');

figure
imshow(N);
title('Negative Transformation Filtered Image');

clear all;
