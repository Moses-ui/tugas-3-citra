function detectLines(image, useInBuilt, type, axesHandle)
    % https://www.mathworks.com/help/images/ref/houghlines.html
    % Create Hough transform using edge image
    edgeImage = detectEdge(image, type);
    if useInBuilt
        houghFn = @hough;
    else
        houghFn = @houghTransform;
    end
    [H, T, R] = houghFn(edgeImage);

    % Find peaks in the Hough transform
    P = houghpeaks(H, 5, 'Threshold', ceil(0.3*max(H(:))));

    % Fine lines and plot them
    lines = houghlines(edgeImage, T, R, P);

    if nargin < 4
        imshow(image), hold on
    else
        imshow(image, 'Parent', axesHandle), hold(axesHandle, "on")
    end

    for k = 1:length(lines)
        % Extract line endpoints
        xy = [lines(k).point1; lines(k).point2];
        
        % Plot line segments
        if nargin < 4
            plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
        else
            plot(axesHandle, xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
        end
        
    end

    if nargin < 4
        hold off
    else
        hold(axesHandle, "off")
    end
end