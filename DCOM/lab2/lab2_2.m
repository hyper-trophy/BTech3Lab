[coloredImage, map] = imread('coloredImage.png');

figure;
imshow(coloredImage, map);

grayscaledImage = rgb2gray(map);

figure;
imshow(coloredImage,grayscaledImage);

J = entropy(grayscaledImage);
disp(['Entropy of grayscaled image is ' num2str(J)])