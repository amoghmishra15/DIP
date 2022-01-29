clc; clear; close all;


% Original
orig = imread('rice.jpg');
subplot(4, 3, 1);
imshow(orig);
title('Original');

% Threshold grayscale
subplot(4, 3, 2);
midLevel = graythresh(orig);
bw = im2bw(orig, midLevel);
imshow(bw);
title('Midlevel threshold');

% Counting objects (N4)
[~, countN4] = bwlabel(bw, 4);
disp(countN4);

% Counting objects (N8)
[~, countN8] = bwlabel(bw, 8);
disp(countN8);

% ----- Distance from 1 -------
% Artificial image
img = zeros(4, 4);
img(3, 3) = 1;
disp(img);

% Distances
distEu = bwdist(img, "euclidean")
distCh = bwdist(img, "chessboard")
distCb = bwdist(img, "cityblock")

% Power law transform
% S = C * (R_max)^gamma
% S -> Max pixel after transform
% C and gamma -> constants for transform
% R_max -> Max pixel allowable before transform

R_max = 0: 10: 250;
C1 = 255 / 255^0.4;
C2 = 255 / 255^2.5;

S1 = C1 * R_max.^0.4;
S2 = C2 * R_max.^2.5;

subplot(2,1,1);
stem(R_max, S1);
subplot(2,1,2);
stem(R_max, S2);