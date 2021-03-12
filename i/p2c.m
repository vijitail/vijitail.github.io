pkg load image;

close all;
clear all;

A = imread('imagesfolder/airplane.png');

B = zeros(size(A));

B = bitset(B, 7, bitget(A, 7));
B = bitset(B, 8, bitget(A, 8));

B = uint8(B);

figure, imshow(B);  

%Image reconstruction by combining 8,7,6 and 5 bit planes

A = imread('imagesfolder/baby.jpg');

B = zeros(size(A));

B = bitset(B, 8, bitget(A, 8));
B = bitset(B, 7, bitget(A, 7));
B = bitset(B, 6, bitget(A, 6));
B = bitset(B, 5, bitget(A, 5));

B = uint8(B);
figure, imshow(B);  
