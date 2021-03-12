pkg load image;
clear all;
close all;

a = imread('imagesfolder/lena.png');

gray = rgb2gray(a);

ad = im2double(a);

subplot(2, 2, 1);
imshow(ad);
title("before");

subplot(2,2,2);
imhist(ad);
title("before hist");

imad = imadjust(ad, [0.44 0.8], [0.1 0.9]);

subplot(2,2,3);
imshow(imad);
title("after")

subplot(2,2,4);
imhist(imad);
title("after hist");

