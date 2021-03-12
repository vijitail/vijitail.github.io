clear all;
close all;
pkg load image;
a=imread('hawk1.png');
#a=rgb2gray(a);
#imwrite(a,'hawk1.png');
a=im2double(a);
r=imnoise(a,'salt & pepper' );
f=ones(3,3)/9;
af=filter2(f,r);
figure
#imshow(a); title('original');
subplot(1,2,1)
 imshow(r); title('noised image');
subplot(1,2,2);imshow(af); title('After applying average filter');

