pkg load image;
clear;
x = imread('imagesfolder/baby.jpg'); 
x = rgb2gray(x); 
 x = im2double(x); 
 [row col] = size(x); 
 gamma=2; 
 c=1;
 for i = 1:row 
for j = 1:col    
N(i,j)=c*(x(i,j)^gamma);     
endfor 
endfor
figure, imshow(x); title('Original Image'); 
figure, imshow(N); title('Gamma Transformation Filtered Image');
