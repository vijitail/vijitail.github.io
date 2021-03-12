pkg load image;
clear all;

r=imread("fields.jpg");
#r=rgb2gray(r);
#r=im2double(r);
imhist(r);
thr=150;
[m n]=size(r);
s=zeros(m,n);
for i=1:m
  for j=1:n
    if(r(i,j))>thr
    s(i,j)=1;
    else
    s(i,j)=0;
    endif 
  endfor
 endfor

subplot(2,2,1); imshow(r); title("original");
subplot(2,2,2); imhist(r); title("original histogram");
subplot(2,2,3); imshow(s); title("thresholded image");
subplot(2,2,4); imhist(s); title("threshold histogram"); 

