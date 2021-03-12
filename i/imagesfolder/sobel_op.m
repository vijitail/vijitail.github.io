clear all;
A=imread('peppers.png');
figure,
subplot(1,2,1); imshow(A); title('Original');
C=double(A);
size(C)

for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((C(i+2,j)+2*C(i+2,j+1)+C(i+2,j+2))-(C(i,j)+2*C(i,j+1)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((C(i,j+2)+2*C(i+1,j+2)+C(i+2,j+2))-(C(i,j)+2*C(i+1,j)+C(i+2,j)));
     
        %The gradient of the image        
        A(i,j)=sqrt(Gx.^2+Gy.^2);
     
    end
end


subplot(1,2,2); imshow(A); title('Sobel gradient');
