#load package of image
pkg load image;
#Take input image
img=imread("peppers.png");

#function to find edge using sobel filter
sobel = edge(img,'Sobel');
figure 1,
subplot(1,2,1)
imshow(img);
title('Original Image');
subplot(1,2,2)
imshow(sobel);
title("Edge detection using sobel filter");
#function to find edge using sobel filter
robert = edge(img,'Roberts');
prewitt = edge(img,'Prewitt');
figure 2,
subplot(1,2,1)
imshow(robert);
title('Edge detection using robert filter');
subplot(1,2,2)
imshow(prewitt);
title("Edge detection using prewitt filter");