clc; clear; close all;

% Load

orig = imread('Group.jpg');
subplot(3,3,1);
imshow(orig);
title('Original');

% Logical

bw = im2bw(orig);
subplot(3,3,2);
imshow(bw);
title('Logical at 100% threshold');

% Logical - 90%

bw1 = im2bw(orig, 0.9);
subplot(3,3,3);
imshow(bw1);
title('Logical at 90% threshold');

% Grayscale

gray = rgb2gray(orig);
subplot(3,3,4);
imshow(gray);
title('Grayscale');

% Histogram

subplot(3,3,5);
imhist(gray);
title('Histogram of grayscale');

% Histogram sliding

gSlide = gray-100;
subplot(3,3,6);
imhist(gSlide);
title('Histogram after sliding by 100');
subplot(3,3,7);
imshow(gSlide);
title('Grayscale after sliding by 100');

% Histogram equalization

[eq,T] = histeq(gray);
subplot(3,3,8);
imhist(orig);
title('Histogram after equalization');
subplot(3,3,9);
imshow(orig);
title('Image after equalization');
