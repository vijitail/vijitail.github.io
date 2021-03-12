pkg load image;
clear all;
img = imread('imagesfolder/hawk1.png'); % Read image
figure, imshow(img);title("original Image");
red = 0.66*img; 
green=0.25*img;
blue = img; 
pseudo_img = cat(3, red, green, blue);
figure, imshow(pseudo_img), title('Pseudo Image');
