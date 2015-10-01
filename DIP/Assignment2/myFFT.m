function [ fimg ] = myFFT( simg )
fimg=log(1+abs(fftshift(fft2(simg))));
fimg=fimg/max(fimg(:));
end

