// $Id: ellt1gtu.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of first (principal) elliptic transformation: M*lambda=K/n
// with y=f(u), x=f(u)
//
filename="ellt1gtu.fig";

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
u_max = Kx + Kx_inv + Kx;  // for three parts (ranges) of u
x_max = 10;
x_min = -x_max;
y_max = 50000;                 // best for n = 7
y_min = -y_max;                // plot calculation limits

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
xbasc();

// First segment: plot for real u from 0 to K
// x=sn(u;k)   y=sn(u/M;lambda)
// This corresponds to x=0..1, y=0..1
u = 0:Kx/segs:Kx;
x = real(%sn(u, mx));
y = real(%sn(u/M, my));
plot2d(u, x, 2, "011", "1", [u_min, x_min, u_max, x_max], [1, 3*n, 1, 10]);
plot2d(u, y, 1, "011", "1", [u_min, y_min, u_max, y_max], [1, 3*n, 1, 10]);

// Second segment: plot for complex u from K+j0 to K+jK'
// This corresponds to x=1..1/k, y=1..1/lambda
u = 0:Kx_inv/segs:Kx_inv;
x = real(%sn(Kx+%i*u, mx));
y = real(%sn((Kx+%i*u)/M, my));
u = u + Kx; // shift the plot right
plot2d(u, x, 2, "010", "2", [u_min, x_min, u_max, x_max]);
plot2d(u, y, 1, "010", "2", [u_min, y_min, u_max, y_max]);

// Third segment: plot for complex u from K+jK' backward to jK'
// This corresponds to x=1/k..INF, y=1/lambda..INF
u = Kx:-Kx/segs:0;
x = real(%sn(%i*Kx_inv + u, mx));
y = max(min(real(%sn((%i*Kx_inv + u)/M, my)), y_max), y_min);
u = Kx - u + Kx + Kx_inv;   // shift the plot right
plot2d(u, x, 2, "010", "3", [u_min, x_min, u_max, x_max]);
plot2d(u, y, 1, "010", "3", [u_min, y_min, u_max, y_max]);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);












