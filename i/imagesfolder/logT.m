pkg load image;
a=imread('leenanew1.tif');
#agray=rgb2gray(a);
ad=im2double(a);
x=ad;
c=1;
[row,col]=size(ad);
for i=1:row
  for j=1:col
    x(i,j)=c*log(1+ad(i,j));
  endfor
 endfor
 
 #imwrite(x, 'leenanew1.tif');

 subplot(2,2,1);
 imhist(ad); title("Old Histogram");
 subplot(2,2,2); imhist(x); title("Histogram after transformation");
 
subplot(2,2,3); imshow(ad); title("before");
subplot(2,2,4); imshow(x); title("After");