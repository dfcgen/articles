// -*- scilab -*-
// $Id: bessel_amplitude.sci,v 1.1 2005-01-08 16:50:40 ralf Exp $
//
// Scilab plot of Bessel filter amplitude response for n=4
//
filename="bessel_amplitude.fig";

segs=500;

x_min = 0; // min. frequency
x_max = 1; // max. frequency
y_min = 0;
y_max = 1.2;

bound_rect=[x_min, y_min, x_max, y_max];
grid=[1, 4, 1, 6];

deff('[y]=bessel4(x)','y = 105 ./ (105 + 2*%pi*105*%i.*x - 45*(2*%pi*x)^2 + 10*%i.*(2*%pi*x)^3 + (2*%pi*x)^4)');

x = 0:x_max/segs:x_max;
y = abs(bessel4(x));

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
plot2d(x, y, rect=bound_rect, nax=grid);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;
