// -*- scilab -*-
// $Id: ellt1gt_odd.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of first (principal) elliptic transformation: M*lambda=K/n
//
filename="ellt1gt_odd.fig";

segs=400;               // sample points in each (imag, real) direction

n = 7;                  // degree of polynomial (must be odd)
k = 1/sqrt(2);          // module k = 0.7071

// Derived variables
mx = k*k;
Kx = %k(mx);            // real quarter period of sn(x;k)
Kx_inv = %k(1-mx);      // imag quarter period of sn(x;k)

// calculation of coefficients a[i]
i = 2:2:n-1;            // calculation of M, lambda
a = %sn(i*Kx/n, mx)
p = (1 - (a.^(-2))) ./ (1 - mx * a.^2);
M = prod(p)
lambda = M^2 * k^n * (prod(a))^4
my = lambda*lambda;

u_max = Kx/n;                   // real part of u value that produces x_max

x_min = 0;                      // plot from x= 0
x_max = 1/(k*real(%sn(u_max, mx))); // not up to infinity
//y_min = -5000;                // plot calculation limits (else crash)
//y_max = 5000;                 // best for n = 5
y_min = -1e5;                 // plot calculation limits (else crash)
y_max = 1e5;                  // best for n = 7

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);

// First segment: plot for real u from 0 to K
// x=sn(u;k)   y=sn(u/M;lambda)
// This corresponds to x=0..1, y=0..1
u = 0:Kx/segs:Kx;
x = real(%sn(u, mx));
y = real(%sn(u/M, my));
plot2d(x, y, 1, "011", "1", bound_rect, [1, x_max, 1, 10]);

// Second segment: plot for complex u from K+j0 to K+jK'
// This corresponds to x=1..1/k, y=1..1/lambda
u = 0:Kx_inv/segs:Kx_inv;       //plot from x=1 to x=1/k
x = real(%sn(Kx+%i*u, mx));
y = real(%sn((Kx+%i*u)/M, my));
plot2d(x, y, 1, "000", "2", bound_rect);

// Third segment: plot for complex u from K+jK' backward to jK'
// This corresponds to x=1/k..INF, y=1/lambda..INF
u = u_max:Kx/segs:Kx;
x = real(%sn(%i*Kx_inv + u, mx));
y = max(min(real(%sn((%i*Kx_inv + u)/M, my)), 1e6), -1e6);
plot2d(x, y, 1, "000", "3", bound_rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);












