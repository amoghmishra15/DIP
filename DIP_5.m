clc; clear; close all;

% Original
subplot(3, 3, 1);
original = imread('StraightOutta.jpg');
imshow(original);

% Gray
subplot(3, 3, 2);
original = rgb2gray(original);
imshow(original);

% Noise
subplot(3, 3, 3);
salted = imnoise(original, 'salt & pepper', 0.05);
imshow(salted);

% Gaussian
subplot(3, 3, 4);
gauss = imnoise(original, 'gaussian', 0, 0.01);
%                      mean deviation ^  ^ standard dvt
imshow(gauss);

% Speckle
subplot(3, 3, 5);
spec = imnoise(original, 'speckle', 0.5);
imshow(spec);

% Periodic distortion
subplot(3, 3, 6);
[height, width] = size(original);
[x, y] = meshgrid(1:width, 1:height);
pNoise = 15 * sin(2*pi*x/12 + 2*pi*y/12);
imshow(original + uint8(pNoise));