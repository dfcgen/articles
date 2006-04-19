// Plot of Cauer bandpass
//
// $Id: bp_tol_scheme.sci,v 1.2 2006-04-19 20:51:13 ralf Exp $
//

filename="bp_tol_scheme.fig";
driver('Fig');                          // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);

epsilon=1.0;A=60;                       //ripple parameters
n=4;omegac=1;
m=find_freq(epsilon,A,n);
omegar=omegac/sqrt(m);
Q=2.0;                                  // quality
[z,p,g]=zpell(epsilon,A,omegac,omegar);

//lowpass transfer function calculation
num=real(poly(z,'s'));
den=real(poly(p,'s'));
x=-100:1/1000:100;
lp=-20/log(10)*log(g*abs(freq(num,den,%i*x)));

// transformation of frequency axis (bandpass)
fm=x ./ (2.0 * Q);
sqrtF=sqrt(fm .* fm + 1.0);
f1=fm + sqrtF;
f2=fm - sqrtF;

plot2d(f1,lp,logflag="ln",axesflag=1,frameflag=1,rect=[1/10,0,10,80],nax=[4,4,4,4]);
plot2d(f2,lp,logflag="ln",axesflag=0,frameflag=0);
xend();

