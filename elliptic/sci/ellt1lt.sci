// -*- scilab -*-
// $Id: ellt1lt.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of first elliptic transformation from x=0 to x=1
//
filename="ellt1lt.fig";

segs=400;               // sample points in each (imag, real) direction

n = 7;                  // degree of polynomial
k = 1/sqrt(2);          // module k = 0.7071

mx = k*k;
Kx = %k(mx);            // real quarter period of sn(x;k)
Kx_inv = %k(1-mx);      // imag quarter period of sn(x;k)

i = 2:2:n-1;            // calculation of M, lambda
a = %sn(i*Kx/n, mx);
p = (1 - (a.^(-2)))./(1 - mx * a.^2);
M = prod(p);
lambda = real((M.^2) * k^n * (prod(a))^4);
my = lambda*lambda;

x_min = 0;                      // plot from x = 0
x_max = 1;                      // to 1
y_min = -1;                     // y bounds
y_max = 1;

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);

u = 0:Kx/segs:Kx;               //plot from x=0 to x=1
x = real(%sn(u, mx));
y = real(%sn(u/M, my));
plot2d(x, y, 1, "011", "1", bound_rect, [1, 2, 2, 2]);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;











