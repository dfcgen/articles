// $Id: landen.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of Landen transformation from x=0 to x=1
//
filename="landen.fig";
segs=400;               // sample points in each (imag, real) direction
k = 1/sqrt(2);          // module k = 0.7071
k_inv = sqrt(1 - k*k);

// derived variables
mx = k*k;
Kx = %k(mx);            // real quarter period of sn(x;k)
Kx_inv = %k(1-mx);      // imag quarter period of sn(x;k)

deff('[y]=landen(x)', 'y=(1 + k_inv)*x.*sqrt((1.0 - x.*x)./(1.0 - k*k*x.*x));');

x_min = -4;                      // plot from x = 0
x_max = 4;
y_min = -10;                     // y bounds
y_max = 10;

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);

x = x_min:(x_max - x_min)/segs:x_max;
yr = max(min(real(landen(x)), y_max), y_min);
yi = max(min(imag(landen(x)), y_max), y_min);

//plot2d(x, y, 1, "011", "1", bound_rect, [1, 1, 1, 1]);
//plot2d(x, y, 1, "161", "1", bound_rect, [1, 1, 1, 1]);
plot2d([x;x]', [yr;yi]', [2, 4], "111", "Re{y}@Im{y}", bound_rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

exit();




















