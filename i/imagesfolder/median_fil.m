# Median Spatial Domain Filtering 
pkg load image;
clear all;
close all;  
# Read the image 
a=imread('hawk1.png'); 
img_noisy1=imnoise(a,'salt & pepper' ); 

# Obtain the number of rows and columns of the image 
[m, n] = size(img_noisy1);
   
# Traverse the image. For every 3X3 area,  
# find the median of the pixels and 
# replace the center pixel by the median 
img_new1 = zeros(m, n); 
  
for i=2: m-1
      for j =2: n-1
        temp = [img_noisy1(i-1, j-1), 
               img_noisy1(i-1, j), 
               img_noisy1(i-1, j + 1), 
               img_noisy1(i, j-1), 
               img_noisy1(i, j), 
               img_noisy1(i, j + 1), 
               img_noisy1(i + 1, j-1), 
               img_noisy1(i + 1, j), 
               img_noisy1(i + 1, j + 1)] ;
          
        temp = sort(temp);
        img_new1(i, j)= temp(4);
  endfor
  endfor
img_new1 = uint8(img_new1);
figure
subplot(1,2,1); imshow(img_new1); title('After Applying Median Filter');
subplot(1,2,2); imshow(img_noisy1);title('noisy image');
