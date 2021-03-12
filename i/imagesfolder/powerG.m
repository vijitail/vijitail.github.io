a=imread('cameraman.png');
#agray=rgb2gray(a);
ad=im2double(a);
y=ad;
cc=1
[r,c]=size(ad);
for i=1:r
  for j=1:c
    y(i,j)=cc*ad(i,j)^.6;
  endfor
 endfor
 
 #imwrite(y, 'leenanew1.tif');
subplot(2,2,1);
 imhist(ad);
 subplot(2,2,2);
 imhist(y);
subplot(2,2,3); imshow(ad); title("before");
subplot(2,2,4); imshow(y); title("After");