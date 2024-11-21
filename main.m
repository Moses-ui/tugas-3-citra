imagePaths = ["something-something.jpg" "the_herta.png" "Gregorius Moses Marevson.JPG" "yoshida_saki.jpg"];
type = ["laplace" "log" "sobel" "prewitt" "roberts" "canny"];

for i=1:length(type)
    image = imread("images\" + imagePaths(4));
    edge = edgeDetection(image, type(i));
    figure; imshow(edge);
end