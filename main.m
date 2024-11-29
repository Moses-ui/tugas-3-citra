imagePath = "images\coins.bmp";
image = imread(imagePath);
edgeImage = detectEdge(image, "canny");
detectedObjects = detectObject(edgeImage, image);
figure; imshow(image);
figure; imshow(detectedObjects);