function [parameter, theta, rho] = houghTransform(edgeImage, p, q)
    % input : edgeImage with size m x n
    % output: parameter with size p x q, theta, rho
    % p : size of theta
    % q : size of r
    [m, n] = size(edgeImage);
    sqrtd = sqrt(m^2 + n^2);

    if nargin < 3
       p = min(180, 2 * ceil(max(m, n) * sqrt(2)));
       q = 2 * floor(sqrtd) - 1;
    end
    parameter = zeros(p, q);

    % -phi/2 <= theta <= phi/2
    theta = linspace(-90, 90, p);
    sin = sind(theta);
    cos = cosd(theta);

    rho = linspace(-sqrtd, sqrtd, q);

    [x, y] = find(edgeImage);
    for t=1:length(x)
        i = x(t) - 1;
        j = y(t) - 1;

        for k=1:p
            r = i*sin(k) + j*cos(k);
            [~, ri] = min(abs(rho - r));
            parameter(k, ri) = parameter(k, ri) + 1;
        end
    end
    parameter = parameter';
end