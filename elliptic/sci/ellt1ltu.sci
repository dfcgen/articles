// -*- scilab -*-
// $Id: ellt1ltu.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of first (principal) elliptic transformation: M*lambda=K/n
// with y=f(u), x=f(u) in range 0 < u < K(k)
//
filename="ellt1ltu.fig";

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

// plot ranges
u_min = 0;
u_max = Kx;
x_max = 1;
x_min = -x_max;
y_max = 1;
y_min = -y_max;


driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
xbasc();

// Plot for real u from 0 to K
// x=sn(u;k)   y=sn(u/M;lambda)
// This corresponds to x=0..1, y=0..1
u = 0:Kx/segs:Kx;
x = real(%sn(u, mx));
y = real(%sn(u/M, my));
plot2d(u, x, 2, "011", "x", [u_min, x_min, u_max, x_max], [1, n, 2, 4]);
plot2d(u, y, 1, "011", "y", [u_min, y_min, u_max, y_max], [1, n, 2, 4]);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);












