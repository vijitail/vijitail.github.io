pkg load image;
clear all;
close all;

r = imread('imagesfolder/baby.jpg');

r = im2double(r);

[m n] = size(r);

r1 = input("Enter R1: ");
r2 = input("Enter R2: ");
s1 = input("Enter S1: ");
s2 = input("Enter S2: ");

a = s1/r1;
b = (s2 - s1)/(r2 - r1);
c = (255 - s2)/(255 - r2);
for i=1:m
  for j=1:n
    if r(i,j) < r1
      s(i,j) = a * r(i,j);
     elseif r(i,j) < r2
      s(i,j) = b*(r(i,j) - r1) + s1;
     else
      s(i,j) = c*(r(i,j) - r2) + s2;
    endif
  endfor
endfor;

figure(3);
subplot(1,2,1);
imshow(r);
title("Original Image");

subplot(1,2,2)
imhist(r);
title("Histogram Of Original Image");
figure(4);
subplot(1,2,1);
imshow(s);
title("Contrast Stretched Image");
subplot(1,2,2);
imhist(s);
title("Histogram Of Contrast Stretched Image");
