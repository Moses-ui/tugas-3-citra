function detectLines(image, p, q)
    % https://www.mathworks.com/help/images/ref/houghlines.html
    % Create Hough transform using edge image
    edgeImage = detectEdge(image, 'canny');
    if nargin < 3
        [H, T, R] = houghTransform(edgeImage);
    else
        [H, T, R] = houghTransform(edgeImage, p, q);
    end

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