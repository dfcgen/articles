// -*- scilab -*-
// $Id: ellt2gt_odd.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of second (principal) elliptic transformation for
// odd degree: M*L'=K'/n
//
filename="ellt2gt_odd.fig"; // n = odd
segs=400;               // sample points in each (imag, real) direction
n = 5;                  // degree of polynomial (must be odd)
k = 1/sqrt(2);          // module k = 0.7071

// Derived variables
mx = k*k;
Kx = %k(mx);            // real quarter period of sn(x;k)
Kxc = %k(1-mx);         // imag quarter period of sn(x;k)

// definition of cn(x, m)
deff('[y]=%cn(x,m)', 's=%sn(x, m); y=sqrt(1 - s.*s);');

i = 2:2:n-1;                    // calculation of even coefficients a[i]
arg = i * (Kxc/n);
a = %sn(arg, 1-mx) ./ %cn(arg, 1-mx);
p = (1 + (a.^(-2))) ./ (1 + mx * a.^2);

M = prod(p);
lambda = M^2 * k^n * (prod(a))^4;
my = lambda*lambda;             // y = sn(u/M; lambda)

x_min = 0;                      // plot from x= 0
x_max = 10;
y_min = 0;                      // plot calculation limits
y_max = 2;

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);

// First segment: plot for real u from 0 to K
// x=sn(u;k)   y=sn(u/M;lambda)
// This corresponds to x=0..1, y=0..1
u = 0:Kx/segs:Kx;
x = real(%sn(u, mx));
y = real(%sn(u/M, my));
plot2d(x, y, 1, "011", "1", bound_rect, [1, 10, 2, 2]);

// Second segment: plot for complex u from K+j0 to K+jK'
// x=nd(Im{u}; k')    y=nd(Im{u}/M;lambda')
// This corresponds to x=1..1/k, y=1..1/lambda
u = 0:Kxc/segs:Kxc;
x = real(%sn(Kx+%i*u, mx));
y = real(%sn((Kx+%i*u)/M, my));
plot2d(x, y, 1, "000", "2", bound_rect);

// Third segment: plot for complex u from K+jK' backward to jK'
// x=1/k*ns(Re{u}; k)    y=1/lambda*ns(Re{u}/M;lambda)
// This corresponds to x=1/k..INF, y=1/lambda..INF
u = Kx/segs:Kx/segs:Kx;
x = real(%sn(%i*Kxc + u, mx));
y = max(min(real(%sn((%i*Kxc + u)/M, my)), 1e6), -1e6);
plot2d(x, y, 1, "000", "3", bound_rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
// exit;

