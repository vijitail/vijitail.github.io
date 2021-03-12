clear all;
close all;

pkg load image;
a=imread('fields.jpg');
#a=rgb2gray(a);
#a=a(1:10,1:10)
r=size(a,1);
c=size(a,2);
ah=uint8(zeros(r,c));
n=r*c;
f=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cumm=zeros(256,1);
out=zeros(256,1);

for i=1:r
  for j=1:c
    values=a(i,j);
    f(values+1)=f(values+1)+1;
    pdf(values+1)=f(values+1)/n;
    
  endfor
endfor  

sum=0; L=255; size(pdf);
for i=1:size(pdf)
  sum=sum+f(i);
  cum(i)=sum;
  cdf(i)=cum(i)/n;
  out(i)=round(cdf(i)*L);
endfor

for i=1:r
  for j=1:c
  ah(i,j)=out(a(i,j)+1);
endfor
endfor

figure,
subplot(2,2,1), imshow(a); title('original image');
subplot(2,2,2), imhist(a); title('original hist');
#he=histeq(a); 
subplot(2,2,3), imshow(ah); title('after processing image');
 subplot(2,2,4), imhist(ah); title('after processing hist');
 #imhist(he);
