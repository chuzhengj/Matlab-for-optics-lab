% wavelengh is 523 nm, wave number is calculated by 2 pi/ wavelengh
k = 2*pi/532e-9; 
 % sample thickness is 2mm
L = 2e-3;       
%rotated angle in radians, radian=degree*pi/180, ranging from -5 degree to
%5 degree
theta = linspace(-0.02, 0.02, 1e6)*pi/180;
x = k.*abs(theta).*L;
Correlation = (x./sinh(x)).^2;
Correlation(theta==0)=1;

plot(theta, Correlation)
xlabel('θ (radians)')
ylabel('Correlation')
title('Plot of Correlation against θ')
saveas(gcf,'optics_image.png')
