function kernel = gaussian_kernel(t)
    width = ceil(3*sqrt(t));
    kernel = [];
    for x = linspace(-width, width, (2*width+1))
        kernel = [kernel; (1/(sqrt(2*pi*t)))*exp(-(x*x)/(2*t))];  
    end
end

