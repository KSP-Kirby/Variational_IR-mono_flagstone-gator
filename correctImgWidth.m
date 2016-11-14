function [ imgOut ] = correctImgWidth( img )
% Corrects the image width caused by using left image as reference

img = imcrop(img,[64, 1, 511, 480]);

A = [640/512, 0 , 0 ; 0, 1, 0 ; 0, 0, 1];

    try
        tform = affine2d(A);
        imgOut = imwarp(img, tform);
        imtool(imgOut)
    catch
        disp('Requires MATLABE 2013b or later')
        imgOut = 0;
    end
end

