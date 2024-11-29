function image = inverseHough(edge, parameter)
    % input : edge with size m x n
    %         parameter with size p x q
    % output: image with straight line
    [m, n] = size(edge);
    [p, q] = size(parameter);
    image = zeros(m, n);

    sin = sind(linspace(-90, 90, p));
    cos = cosd(linspace(-90, 90, p));
    sqrtd = sqrt(m^2 + n^2);
    
    for i=1:p
        for j=1:q
            y = 0;
            if parameter(i, j)
                for k=1:m
                    r = j*(2*sqrtd)/(m-1) - sqrtd;
                    if sin(i) == 0
                        y = y + 1;
                    else
                        y = (r - k * cos(i))/sin(i);
                    end
                    y = y + 1;
                    l = floor(y);
                    if (l >= 1 && l <= n)
                        if edge(k, l)
                            image(k, l) = image(k, l) + 1;
                        end
                    end
                end
            end
        end
    end
end