// -*- scilab -*-
// $Id: bessel_phase.sci,v 1.1 2005-01-08 16:50:40 ralf Exp $
//
// Scilab plot of Bessel filter phase for n=4
//
filename="bessel_phase.fig";

segs=500;

x_min = 0;   // min. frequency
x_max = 1.0; // max. frequency

s = poly(0,'s');

// define continuous system in Laplace domain
h = syslin('c',105/(s^4 + 10*s^3 + 45*s^2 + 105*s + 105));

// now get frequency points and (associated) complex magnitude response values
[f, tjw]= repfreq(h, x_min, x_max, (x_max - x_min)/segs);

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
plot2d(f', phasemag(tjw)');
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;
