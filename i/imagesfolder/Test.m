pkg load image
m=[0:9];
A=ones(1,10);
im=m'*A;
figure
imshow(im,[])
im=im';
figure
imshow(im,[])
imwrite(im, 'shades.png')
