// -*- scilab -*-
// $Id: ellf_pi2.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
// Plot of F(phi;k) in range 0<x<pi/2 for k=0.7
phi=0:%pi/400:%pi/2;
K=%k(0.9*0.9);
ellf1=real(delip(sin(phi),0.9));
ellf2=real(delip(sin(phi),0.5));
ellf3=real(delip(sin(phi),0.1));
plot2d([phi;phi;phi]',[ellf1;ellf2;ellf3]',[1,2,3],"111","F(x ;0.9)@F(x; 0.5)@F(x; 0.1)",[0,0,%pi/2,K],[4,2,4,2]);


