// -*- scilab -*-
// $Id: butterworth_amplitude.sci,v 1.1 2005-01-04 18:24:10 ralf Exp $
//
// Scilab plot of Chebyshev, type 1 lowpass (passband ripple) amplitude response
//
filename="cheby1_amplitude.fig";

segs=500;
n = 5;
d = 1.0/4;                                // delta

x_min = 0;
x_max = 4;
y_min = 0;
y_max = 1.2;

bound_rect=[x_min, y_min, x_max, y_max];
grid=[1, 4, 1, 6];
f = 0:x_max/segs:x_max;

//Chebyshev; ripple in the passband
sample=0:0.05:10;
y=cheb1mag(n, 1.0, delta, f);
plot(f, y,'frequencies','magnitude');

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
plot2d(x, y, rect=bound_rect, nax=grid);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

