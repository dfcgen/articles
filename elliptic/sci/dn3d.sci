// $Id: dn3d.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab plot of abs(dn(z;k)) for complex arguments
//
//
theta=245; // the angles in spherical coordinates are
alpha=85;

k=0.5; // the module
m=k*k;
mc=1-m; // complement module
K=%k(m); // real half period
Kc=%k(mc); // imaginary half period

xmax=4*K; // max. real argument
ymax=4*Kc; // max. imag argument
zmax=2.5; // clipping boundary (z-axis)

rect=[0, xmax, 0, ymax, 0, 1.0];

deff('[z]=dn(x,y)','z=min(abs(sqrt(1-m*%sn(x+%i*y,m)^2)), zmax)'); // dn expressed by sn for complex arguments

x=0:xmax/40:xmax; // real part
y=0:ymax/40:ymax; // imag part
z=feval(x, y, dn); // calculate result vector dn

contour(x, y, z, [0.2, 0.4, 0.6, 0.8], theta, alpha, '@@', [1, 1, 0],  rect, 0);
plot3d(x,y,z,theta,alpha,'x@y@dn(x+jy; k)',[2,0,4], rect);

