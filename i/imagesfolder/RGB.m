img1 = imread('airplane.png');
img_r=img1;
img_r(:,:,2)=0;
img_r(:,:,3)=0;
#figure
imshow(img_r);

img_g=img1;
img_g(:,:,1)=0;
img_g(:,:,3)=0;
#figure(2)
imshow(img_g);

img_b=img1;
img_b(:,:,1)=0;
img_b(:,:,2)=0;
#figure(3)
imshow(img_b);