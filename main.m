imagePath = "images\road.jpg";
image = imread(imagePath);
edgeImage = detectEdge(image, "canny");
[parameter, theta, rho] = houghTransform(edgeImage, 50, 50);
% detectedLines = detectLines(edgeImage);

% detectedObjects = detectObject(edgeImage, image);
% figure; imshow(image);
% figure; imshow(detectedObjects);