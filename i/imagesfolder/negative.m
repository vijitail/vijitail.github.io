

x = imread('image1.tif');#Reading the image
#x = rgb2gray(x); #Converting RGB image to gray-level
x = im2double(x); #Converting image into double data type

[row col] = size(x); #taking image size into matrix form
for i = 1:row #reading row value from starting to end and storing in (i) variable
for j = 1:col #reading row value from starting to end and storing in (j) variable
N(i,j)=1-x(i,j); #subtracting input matrix values from 255 and storing in new Matrix(N)
endfor
endfor
subplot(1,2,1); imshow(x); title("Original Image");
subplot(1,2,2); imshow(N); title("Negative Transformation Filtered Image");


