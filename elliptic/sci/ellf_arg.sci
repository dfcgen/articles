// -*- scilab -*-
// $Id: ellf_arg.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
// Plot of integrand of F(phi;k) in range 0<x<4pi for k = 0.5
k=0.5;
x=-2*%pi:%pi/100:2*%pi;
y=1.0./sqrt(1.0-k*k*sin(x).*sin(x));
plot2d(x,y,1,"011","1/sqrt(1-k^2*sin^2(x))", [-2*%pi,0,2*%pi,1.5],[2,4,2,3]);
//plot2d(x,y);

