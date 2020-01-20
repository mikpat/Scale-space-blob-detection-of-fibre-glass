function output_img = localMaxima(img, threshold)

    output_img = zeros(size(img));
    for i = 2:(size(img, 1)-1)
       for j = 2:(size(img, 2)-1)
           kernel = img(i-1:i+1, j-1:j+1);
           center = kernel(2,2);
           kernel = kernel(:);
           kernel(5) = [];
           if sum(~(center>kernel))==0 && threshold<center
               output_img(i, j) = 1;
           end
      end
    end
end