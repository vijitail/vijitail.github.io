org_im=imread("imagesfolder/circle.png");
subplot(2,3,1);

imshow(org_im);title("Original image");

binary=im2bw(org_im);
subplot(2,3,2);
imshow(binary);
title("binary image");

se=strel('disk',2,0);
dialate=imdilate(binary,se);
subplot(2,3,3),imshow(dialate);
title("Dialated image");

erod=imerode(binary,se);
subplot(2,3,4),
imshow(erod);
title("Errosion");

internal=dialate&~erod;
subplot(2,3,5),
imshow(internal);
title("Internal boundary");

external=dialate&~binary;
subplot(2,3,6)
imshow(external,[]);
title("Exernal boundary");
