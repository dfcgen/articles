// -*- scilab -*-
// $Id: cheby2_amplitude.sci,v 1.1 2005-01-05 18:40:27 ralf Exp $
//
// Scilab plot of Chebyshev, type II lowpass (inverse) amplitude response
//
filename="cheby2_amplitude.fig";

segs=500;
n = 6;

x_min = 0.0001;
x_max = 6;
y_min = -6;
y_max = 1;

x = x_min:x_max/segs:x_max;

//Chebyshev; ripple in the stopband
omegar = 1;
A = 1/0.1;

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);

y=cheb2mag(n, omegar, A, x);
plot2d(x, log(y)/log(10), rect=bound_rect)
//Plotting of frequency edges
plot2d([omegar;omegar],[y_min; y_max],[2],"000");
//Computation of the attenuation in dB at the stopband edge
attenuation=-log(A*A)/log(10);
plot2d(x', attenuation*ones(x)',[5],"000")

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;
