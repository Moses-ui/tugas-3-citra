function detectLines(image, useInBuilt)
    % https://www.mathworks.com/help/images/ref/houghlines.html
    % Create Hough transform using edge image
    edgeImage = detectEdge(image, 'canny');
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
    figure, imshow(image), hold on
    for k = 1:length(lines)
        % Extract line endpoints
        xy = [lines(k).point1; lines(k).point2];
        
        % Plot line segments
        plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
    end
    
    title('Detected Road Lines')
    hold off
end