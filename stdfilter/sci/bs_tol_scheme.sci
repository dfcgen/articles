// Plot of Cauer bandstop
//
// $Id: bs_tol_scheme.sci,v 1.1 2006-04-19 20:50:24 ralf Exp $
//

filename="bs_tol_scheme.fig";
driver('Fig');                          // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);

epsilon=1.0;A=60;                       //ripple parameters
n=4;omegac=1;
m=find_freq(epsilon,A,n);
omegar=omegac/sqrt(m);
Q=2.0;                                   // quality
[z,p,g]=zpell(epsilon,A,omegac,omegar);

//lowpass transfer function calculation
num=real(poly(z,'s'));
den=real(poly(p,'s'));
x=-100:1/100:100;
lp=-20/log(10)*log(g*abs(freq(num,den,%i*x)));

// transformation of frequency axis (bandpass)
fm=1.0 ./ (2.0 * Q * x);
sqrtF=sqrt(fm .* fm + 1.0);
f1=fm + sqrtF;
f2=fm - sqrtF;

plot2d(f1,lp,logflag="ln",axesflag=1,frameflag=1,rect=[1/10,0,10,60],nax=[4,4,4,4]);
plot2d(f2,lp,logflag="ln",axesflag=0,frameflag=0);
xend();

