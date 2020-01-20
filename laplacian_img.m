function L = laplacian_img(img, t)
    kernel_lap = sec_der_gaussian_kernel(t);

    L_x = imfilter(img, kernel_lap', 'symmetric');
    L_y = imfilter(img, kernel_lap, 'symmetric');
    L = t*(L_x+L_y);

end