// -*- scilab -*-
// $Id: sn3d_real.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of real(sn(z;k)) for complex arguments in a single period rectangle
//
//
k=1/sqrt(2);   // module k = 0.7071
segs=40;       // lines on the surface
m=k*k;
K=%k(m); // quarter period
K_inv=%k(1-m);

x_min=0;
x_max=4.0*K;
y_min=0;
y_max=2.0*K_inv;
z_max=1.0;
z_min=-1.0;

deff('[z]=snr(x, y)','z=max(min(real(%sn(x+%i*y,m)), 6*z_max), 6*z_min)');

x=0:x_max/segs:x_max; // real part
y=0:y_max/segs:y_max; // imag part

// do the plot directly into the .fig-file
getf('plot3dxf.sci', 'n');
plot3dxf('sn3d_real.fig',x,y,snr,225,60,'x@y@sn(x+jy; k)',[12,1,4], [x_min, x_max, y_min, y_max, z_min, z_max]);
exit;

