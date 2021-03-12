pkg load image;
r=imread("baby.jpg");
r=rgb2gray(r);
#r=im2double(r);
figure
imshow(r);
figure
imhist(r);