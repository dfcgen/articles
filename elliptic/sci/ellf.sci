// -*- scilab -*-
// $Id: ellf.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
// Plot of F(phi;k) in range 0<x<pi/2 for k=0.9
k=0.9;
K=%k(k*k)
phi=0:%pi/100:4*%pi;
ratio=floor(phi/%pi);
arg=phi-%pi*ratio;

if arg > %pi/2 then
    arg(i)=arg(i)-%pi;
    ratio(i)=ratio(i)+1;
end

ellf=real(delip(sin(arg),k))+2.0*ratio*K;
//plot2d(phi, ellf);
plot2d(phi,ellf,1,"111","F(x ;0.9)",[0,0,4*%pi,8*K],[2,4,2,4]);

