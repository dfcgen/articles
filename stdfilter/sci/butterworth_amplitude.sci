// -*- scilab -*-
// $Id: butterworth_amplitude.sci,v 1.2 2005-01-04 18:27:49 ralf Exp $
//
// Scilab plot of Butterwoth filter amplitude response
//
filename="butterworth_amplitude.fig";

segs=500;
d = 1.0;                                // delta

x_min = 0;
x_max = 4;
y_min = 0;
y_max = 1.2;

bound_rect=[x_min, y_min, x_max, y_max];
grid=[1, 4, 1, 6];

deff('[y]=butterworth(x, delta, n)','y = 1.0 ./ abs(1 + %i * delta * x^n)');

f = 0:x_max/segs:x_max;
x = [f; f; f; f]';
y = [ butterworth(f, d, 1);
      butterworth(f, d, 2);
      butterworth(f, d, 3);
      butterworth(f, d, 4);
    ]';

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
plot2d(x, y, rect=bound_rect, nax=grid);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

