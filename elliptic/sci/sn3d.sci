// -*- scilab -*-
// $Id: sn3d.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of abs(sn(z;k)) for complex arguments
//
filename="sn3d.fig";

k=1/sqrt(2);   // module k = 0.7071
segs=40;       // lines on the surface

m=k*k;
K=%k(m);       // quarter period
K_inv=%k(1-m);

theta=245;     // the angles in spherical coordinates are
alpha=85;

x_min=0;
x_max=4.0*K;
y_min=0;
y_max=4.0*K_inv;
z_max=1.0;
z_min=0;

rect=[x_min, x_max, y_min, y_max, z_min, z_max];

deff('[z]=sn(x, y)','z=max(min(abs(%sn(x+%i*y,m)), 6*z_max), 6*z_min)');

x=0:x_max/segs:x_max; // real part
y=0:y_max/segs:y_max; // imag part
z=feval(x, y, sn);    // calculate result vector sn

// do the plot directly into the .fig-file
driver('Fig');
xinit(filename);

contour(x, y, z, [0.2, 0.4, 0.6, 0.8], theta, alpha, '@@', [1, 1, 0],  rect, 0);
plot3d(x,y,z,theta,alpha,'x@y@sn(x+jy; k)',[12,0,4], rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit();



