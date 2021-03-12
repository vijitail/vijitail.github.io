close all;
clear all;
pkg load image;
A=imread('doller.png');
g=rgb2gray(A);
B=zeros(size(g));

#Getting the bit at specified position#
g1 = bitget(g,1);
g2 = bitget(g,2);
g3 = bitget(g,3);
g4 = bitget(g,4);
g5 = bitget(g,5);
g6 = bitget(g,6);
g7 = bitget(g,7);
g8 = bitget(g,8);

figure,
subplot(2,2,1)
imshow(g1);
title('Bit 1');
subplot(2,2,2)
imshow(logical(g2));
title("Bit 2");
subplot(2,2,3)
imshow(logical(g3));
title('Bit 3');
subplot(2,2,4)
imshow(logical(g4));
title('Bit 4');

figure,
subplot(2,2,1)
imshow(logical(g5));
title('Bit 5');
subplot(2,2,2)
imshow(logical(g6));
title("Bit 6");
subplot(2,2,3)
imshow(logical(g7));
title('Bit 7');
subplot(2,2,4)
imshow(logical(g8));
title('Bit 8');

#B=bitset(B,4,bitget(A,4));
B=bitset(B,5,g5);
B=bitset(B,6,g6);
B=bitset(B,7,g7);
B=bitset(B,8,g8);
B=uint8(B);
figure,
subplot(2,2,1),imshow(B); title("5,6,7,8")
subplot(2,2,2),imshow(g); title("original image");
subplot(2,2,3),imhist(B); title("5,6,7,8")
subplot(2,2,4),imhist(g); title("original image");
