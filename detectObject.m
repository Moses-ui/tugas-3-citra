function detectedObjects = detectObject(edgeImage)
    % Measure properties for each object (connected component) in an image
    % properties: "Area", "Centroid", and "BoundingBox"
    % https://www.mathworks.com/help/images/ref/regionprops.html
    stats = regionprops(edgeImage);
    
    % Filter out small noise
    validObjects = stats([stats.Area] > 100);

    detectedObjects = zeros(size(edgeImage));
    for i = 2:length(validObjects)
        % BoundingBox: Position and size of the smallest box containing the region
        % bbox: (x, y, width, height)
        bbox = round(validObjects(i).BoundingBox); 

        % Create box for object
        detectedObjects(bbox(2):bbox(2)+bbox(4), bbox(1):bbox(1)+bbox(3)) = 1; 
    end
end