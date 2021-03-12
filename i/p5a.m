pkg load image;
close all;
clear all;
%READ INPUT IMAGE
A = imread('imagesfolder/coins.png');
%RESIZE IMAGE
A = imresize(A,[256 256]);
%PRE-ALLOCATE THE OUTPUT MATRIX
Output = ones([size(A,1) size(A,2)]);

%COLORMAPS
#maps={'jet(256)';'hsv(256)';'cool(256)';'spring(256)';'summer(256)';'parula(256)';'hot(256)'};
%COLORMAP 1
map = colormap(jet(256));
Red = map(:,1);
Green = map(:,2);
Blue = map(:,3);

R1 = Red(A);
G1 = Green(A);
B1 = Blue(A);

%COLORMAP 2
map = colormap(cool(256));
Red = map(:,1);
Green = map(:,2);
Blue = map(:,3);

%RETRIEVE POSITION OF UPPER TRIANGLE
[x,y]=find(triu(Output)==1);

Output(:,:,1) = Red(A);
Output(:,:,2) = Green(A);
Output(:,:,3) = Blue(A);
for i=1:numel(x)
        Output(x(i),y(i),1)=R1(x(i),y(i));
        Output(x(i),y(i),2)=G1(x(i),y(i));
        Output(x(i),y(i),3)=B1(x(i),y(i));
end
Output = im2uint8(Output);
%FINAL IMAGE
imshow(Output);
