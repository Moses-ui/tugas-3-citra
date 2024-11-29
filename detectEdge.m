function edgeImage = detectEdge(image, type)
    image = im2gray(image);
    if type == "canny"
        edgeImage = edge(image, 'canny');
        return
    end

    image = double(image);
    switch type
        case 'laplace'
            mask = [0 1 0; 1 -4 1; 0 1 0];
            edgeImage = conv2(image, mask, 'same');
        case 'log'
            mask = fspecial('log');
            edgeImage = conv2(image, mask, 'same');
        case {'sobel', 'prewitt', 'roberts'}
            edgeImage = doGradientBasedEdgeDetection(image, type);
    end
    edgeImage = uint8(edgeImage);
    edgeImage = im2double(edgeImage) > graythresh(edgeImage);
end

function edgeImage = doGradientBasedEdgeDetection(image, type)
    switch type
        case 'sobel'
            Gx = [-1 0 1; -2 0 2; -1 0 1];
            Gy = [1 2 1; 0 0 0; -1 -2 -1];
        case 'prewitt'
            Gx = [-1 0 1; -1 0 1; -1 0 1];
            Gy = [1 1 1; 0 0 0; -1 -1 -1];
        case 'roberts'
            Gx = [1 0; 0 -1];
            Gy = [0 1; -1 0];
    end
    Jx = conv2(image, Gx, 'same');
    Jy = conv2(image, Gy, 'same');
    edgeImage = sqrt(Jx.^2 + Jy.^2);
end