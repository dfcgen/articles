// -*- scilab -*-
// $Id: sn3d_imag_contour.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of imag(sn(z;k)) for complex arguments with countour
//
filename="sn3d_imag_contour.fig";

k=1/sqrt(2);   // module k = 0.7071
segs=40;       // lines on the surface

m=k*k;
K=%k(m);       // quarter period
K_inv=%k(1-m);

theta=225;     // the angles in spherical coordinates are
alpha=75;

x_min=0;
x_max=2.0*K;
y_min=0;
y_max=2.0*K_inv;
z_max=1.0;
z_min=-1.0;

rect=[x_min, x_max, y_min, y_max, z_min, z_max];

deff('[z]=sni(x, y)','z=max(min(imag(%sn(x+%i*y,m)), 5*z_max), 5*z_min)');

x=0:x_max/segs:x_max; // real part
y=0:y_max/segs:y_max; // imag part
z=feval(x, y, sni);   // calculate result vector sn

// do the plot directly into the .fig-file
driver('Fig');
xinit(filename);

xset ("fpf","%.1f"); // contour scale numbers format
contour(x, y, z, [-1, -0.5, -0.2, 0, 0.2, 0.5, 1], theta, alpha, '@@', [1, 1, 0],  rect, -1.0);
plot3d(x,y,z,theta,alpha,'x@y@sn(x+jy; k)',[12,0,4], rect);

xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit();



