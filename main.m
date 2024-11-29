% imagePaths = ["something-something.jpg" "the_herta.png" "Gregorius Moses Marevson.JPG" "yoshida_saki.jpg" "banana.jpeg"];
% type = ["laplace" "log" "sobel" "prewitt" "roberts" "canny"];
% 
% for i=1:length(type)
%     image = imread("images\" + imagePaths(5));
%     edgeImage = detectEdge(image, type(i), true);
%     figure; imshow(edgeImage);
% end

imagePath = "images\banana.jpeg";
image = imread(imagePath);
edgeImage = detectEdge(image, "sobel", true);
parameter = houghTransform(edgeImage, 1000, 10);
% imshow(parameter);