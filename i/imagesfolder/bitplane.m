pkg load image;
g = imread("doller.png");
g = rgb2gray(g);
#Getting the bit at specified position#
g1 = bitget(g,1);
g2 = bitget(g,2);
g3 = bitget(g,3);
g5 = bitget(g,5);
g6 = bitget(g,6);
g7 = bitget(g,7);
g8 = bitget(g,8);

g5=im2double(g5);
g6=im2double(g6);
g7=im2double(g7);
g8=im2double(g8);
g78=bitand(g5,g6,g7,g8);
#g5=g5*2^4;
#g6=g6*2^5;
#g7=g7*2^6;
#g8=g8*2^7;

#g78=g5+g6+g7+g8
#g78=g7+g8;
#Displaying the output#
figure(1);
subplot(2,2,1)
imshow(g);
title("Original Image");
subplot(2,2,2)
imshow(logical(g1));
title('Bit 1');
subplot(2,2,3)
imshow(logical(g2));
title("Bit 2");
subplot(2,2,4)
imshow(logical(g3));
title('Bit 3');

figure(2);
subplot(2,2,1)
imshow(logical(g5));
title("Bit 5");

subplot(2,2,2)
imshow(logical(g6));
title('Bit 6');
subplot(2,2,3)
imshow(logical(g7));
title("Bit 7");
subplot(2,2,4)
imshow(logical(g8));
title('Bit 8');


figure(3);
imshow(g78);
title('Bit5 and 8');