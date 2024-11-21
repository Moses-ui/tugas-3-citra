function edgeResult = edgeDetection(image, type)
    switch type
        case 'laplace'
            mask = [0 1 0; 1 -4 1; 0 1 0];
            edgeResult = uint8(convn(double(image), mask));
        case 'log'
            kernelSize = 5;
            sigma = 1;
            lin = round(linspace(-floor(kernelSize/2),floor(kernelSize/2),kernelSize));
            [X,Y] = meshgrid(lin,lin);
            hg = exp(-(X.^2 + Y.^2)/(2*(sigma^2)));
            
            kernel_t = hg.*(X.^2 + Y.^2-2*sigma^2)/(sigma^4*sum(hg(:)));
            mask = kernel_t - sum(kernel_t(:))/kernelSize^2;
            % mask = fspecial("log", 5, 1);
            edgeResult = uint8(convn(double(image), mask));
        case 'sobel'
            Sx = [-1 0 1; -2 0 2; -1 0 1];
            Sy = [1 2 1; 0 0 0; -1 -2 -1];
            Jx = convn(double(image), double(Sx), 'same');
            Jy = convn(double(image), double(Sy), 'same');
            Jedge = sqrt(Jx.^2 + Jy.^2);
            edgeResult = uint8(Jedge);
        case 'prewitt'
            Px = [-1 0 1; -1 0 1; -1 0 1];
            Py = [-1 -1 -1; 0 0 0; 1 1 1];
            Jx = convn(double(image), double(Px), 'same');
            Jy = convn(double(image), double(Py), 'same');
            Jedge = sqrt(Jx.^2 + Jy.^2);
            edgeResult = uint8(Jedge);
        case 'roberts'
            Rx = [1 0; 0 -1];
            Ry = [0 1; -1 0];
            Jx = convn(double(image), double(Rx), 'same');
            Jy = convn(double(image), double(Ry), 'same');
            Jedge = sqrt(Jx.^2 + Jy.^2);
            edgeResult = uint8(Jedge);
        case 'canny'
            kernelSize = 5;
            sigma = 1;
            lin = round(linspace(-floor(kernelSize/2),floor(kernelSize/2),kernelSize));
            [X,Y] = meshgrid(lin,lin);
            hg = exp(-(X.^2 + Y.^2)/(2*(sigma^2)));
            mask = hg ./ sum(hg(:));
            smoothedImage = uint8(convn(double(image), mask));
            edgeResult = edgeDetection(smoothedImage, 'sobel');
    end
    
end