function [parameter, theta, rho] = houghTransform(edgeImage, p, q)
    % input : edgeImage with size m x n
    % output: parameter with size p x q, theta, rho
    % p : size of theta
    % q : size of r
    [m, n] = size(edgeImage);
    parameter = zeros(p, q);

    % -phi/2 <= theta <= phi/2
    theta = linspace(-90, 90, p);
    sin = sind(theta);
    cos = cosd(theta);

    sqrtd = ceil(sqrt(m^2 + n^2));
    rho = linspace(-sqrtd, sqrtd, q);

    [x, y] = find(edgeImage);
    for t=1:length(x)
        i = x(t) - 1;
        j = y(t) - 1;

        for k=1:p
            r = i*sin(k) + j*cos(k);
            [~, r] = min(abs(rho - r));
            parameter(k, r) = parameter(k, r) + 1;
        end
    end
end