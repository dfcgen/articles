// -*- scilab -*-
// $Id: ellt2_surface.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of y(u) and x(u) of second principal elliptic transformation
//
filename="ellt2_surface.fig";
n = 3;
// filename="ellt2_even_surface.fig";
// n = 4;

k=1/sqrt(2);   // module k = 0.7071
segs=50;       // lines on the surface

m=k*k;
K=%k(m);       // quarter period
K_inv=%k(1-m);

theta=215;     // the angles in spherical coordinates are
alpha=60;

x_min=0;
x_max=2.0*K;
y_min=0;
y_max=2*K_inv;
z_max=1.0;
z_min=-1.0;

rect=[x_min, x_max, y_min, y_max, z_min, z_max];

deff('[z]=sni(x, y)','z=max(min(real(%sn(x+%i*y,m)), 5*z_max), 5*z_min)');

xr=0:x_max/segs:x_max; // real part
xi=0:y_max/segs:y_max; // imag part
yr=0:x_max/segs:x_max; // real part
yi=0:y_max/segs:y_max; // imag part

zx=feval(xr, xi, sni);   // calculate result vector sn
zy=feval(yr, yi .* n, sni) + 5.0;   // calculate result vector sn

// do the plot directly into the .fig-file
driver('Fig');
xinit(filename);

xset ("fpf","%.1f"); // contour scale numbers format

plot3d(xr,xi,zx,theta,alpha,'xr@xi@sn(xr+jxi; k)',[12,1,4], rect);
plot3d(yr,yi,zy,theta,alpha,'yr@yi@sn(yr+jyi; k)',[7,0,4], rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit();




