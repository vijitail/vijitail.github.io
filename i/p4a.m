clear all;
close all;

pkg load image;

a = imread('imagesfolder/airplane.png');
a=rgb2gray(a);
a = im2double(a);
r = imnoise(a, 'salt & pepper');
f = ones(3,3)/9;

af = filter2(f,r);
figure
subplot(1,2,1); 
imshow(af);
title('After applying average filter');
subplot(1,2,2);
imshow(r);
title('noised image');
