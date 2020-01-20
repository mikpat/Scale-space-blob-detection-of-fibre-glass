function kernel = sec_der_gaussian_kernel(t)
    width = ceil(3*sqrt(t));
    kernel = [];
    for x = linspace(-width, width, (2*width+1))
        kernel = [kernel; t*(x*x-t)*exp(-(x*x)/(2*t)) / (t*t*sqrt(2*pi*t))];  
    end
end

