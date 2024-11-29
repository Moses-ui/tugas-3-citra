function parameter = houghTransform(edgeImage, p, q)
    % input : edgeImage with size m x n
    % output: parameter with size p x q
    % p : size of theta
    % q : size of r
    [m, n] = size(edgeImage);
    parameter = zeros(p, q);

    % -phi/2 <= theta <= phi/2
    sin = sind(linspace(-90, 90, p));
    cos = cosd(linspace(-90, 90, p));
    sqrtd = sqrt(m^2 + n^2);

    for i=1:m
        for j=1:n
            if edgeImage(i, j)
                for k=1:p
                    r = i*sin(k) + j*cos(k);
                    r = ((r + sqrtd)/(2*sqrtd))*(q-1) + 1;
                    r = floor(r);
                    parameter(k, r) = parameter(k, r) + 1;
                end
            end
        end
    end
end