imagePath = "images\road.jpg";
image = imread(imagePath);
% edgeImage = detectEdge(image, "canny");
detectLines(image, true);