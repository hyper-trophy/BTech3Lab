[coloredImage, map] = imread('coloredImage.png'); % Read the image

figure;
imshow(coloredImage, map); % Show the image

grayscaledImage = rgb2gray(map); % Convert the image to grayscale

figure;
imshow(coloredImage,grayscaledImage); % Show the greyscaled image

J = entropy(grayscaledImage); % Calculate the entropy of the image
disp(['Entropy of grayscaled image is ' num2str(J)]) % Display the entropy