// -*- scilab -*-
// $Id: dn3d_real.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of real(dn(z;k)) for complex arguments in a single period rectangle
//
//
filename = "dn3d_real.fig";

k=1/sqrt(2);    // module k = 0.7071
m=k*k;
segs = 50;      // lines on the surface
K=%k(m);        // half period
K_inv=%k(1-m);

x_min=0;        // bounds
x_max=2.0*K;
y_min=0;
y_max=4.0*K_inv;
z_min=-1.0;
z_max=1.0;

// dn expressed by sn
deff('[z]=dnr(x, y)','z=max(min(real((-1)^floor((y/K_inv+1)/2)*sqrt(1.0 - m*%sn(x+%i*y,m)^2)), 6*z_max), 6*z_min)');

x=x_min:(x_max - x_min)/segs:x_max; // real part range
y=y_min:(y_max - y_min)/segs:y_max; // imag part range

getf('plot3dxf.sci', 'n');
plot3dxf("dn3d_real.fig", x,y,dnr,220,50,'x@y@dn(x+jy; k)',[12,1,4], [x_min, x_max, y_min, y_max, z_min, z_max]);

exit;







