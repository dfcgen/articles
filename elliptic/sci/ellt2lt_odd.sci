// $Id: ellt2lt_odd.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of second principal elliptic transformation for odd degree
// from x=0 to x=1

filename="ellt2lt_odd.fig";
segs=400;               // sample points in each (imag, real) direction
n = 7;                  // degree of polynomial
k = 1/sqrt(2);          // module k = 0.7071

// derived variables
mx = k*k;
Kx = %k(mx);            // real quarter period of sn(x;k)
Kxc = %k(1-mx);      // imag quarter period of sn(x;k)

deff('[y]=%cn(x,m)', 's=%sn(x, m); y=sqrt(1 - s.*s);');

i = 2:2:n-1;                    // calculation of even coefficients a[i]
arg = i * (Kxc/n);
a = %sn(arg, 1-mx) ./ %cn(arg, 1-mx);
p = (1 + (a.^(-2))) ./ (1 + mx * a.^2);

M = prod(p);
lambda = M^2 * k^n * (prod(a))^4;
my = lambda*lambda;             // y = sn(u/M; lambda)

x_min = 1;                      // plot from x = 0
x_max = 1/k;                    // to 1/k
y_min = 1;                      // y bounds
y_max = real(1/lambda);

bound_rect=[x_min, y_min, x_max, y_max];

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);


// Second segment: plot for complex u from K+j0 to K+jK'
// x=nd(Im{u}; k')    y=nd(Im{u}/M;lambda')
// This corresponds to x=1..1/k, y=1..1/lambda
u = 0:Kxc/segs:Kxc;
x = real(%sn(Kx+%i*u, mx));
y = real(%sn((Kx+%i*u)/M, my));
plot2d(x, y, 1, "011", "1", bound_rect, [1, 1, 1, 1]);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;
