%Input Image
clear all;
A=imread('coins.png');
size(A);
figure,
subplot(2,2,1);imshow(A); title('original Image');
%Preallocate the matrices with zeros
I1=A;
I=zeros(size(A));
I2=zeros(size(A));
%Filter Masks
F1=[0 2 0;2 -8 2; 0 2 0];
#F2=[1 1 1;1 -8 1; 1 1 1];
%Padarray with zeros
A=padarray(A,[1,1]);
A=double(A);
size(A);
%Implementation of the equation in Fig.D
for i=1:size(A,1)-2
    for j=1:size(A,2)-2
       
        I(i,j)=sum(sum(F1.*A(i:i+2,j:j+2)));
       
    end
end

I=uint8(I);


subplot(2,2,3);imshow(I);title('Filtered Image');
%Sharpenend Image
%Refer Equation in Fig.F
B=I1-I;
subplot(2,2,4); imshow(B);title('Sharpened Image');
