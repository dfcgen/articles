// Plot of Cauer highpass
//
// $Id: hp_tol_scheme.sci,v 1.1 2006-04-17 12:47:51 ralf Exp $
//

filename="hp_tol_scheme.fig";
driver('Fig');                          // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);

epsilon=3.0;A=60;                       //ripple parameters
n=4;omegac=1;
m=find_freq(epsilon,A,n);
omegar=omegac/sqrt(m);
[z,p,g]=zpell(epsilon,A,omegac,omegar);

hz=omegac ./ z;                         // Highpass poles/zeroes conversion
hp=omegac ./ p;

hpnum=real(poly(hz,'s'));               //transfer function calculation
hpden=real(poly(hp,'s'));

//plot
x=10/1000:10/1000:100;
hp=-20/log(10)*log(abs(freq(hpnum,hpden,%i*x)));
plot2d(x,hp,logflag="ln",axesflag=1,frameflag=1,rect=[0.1,-10,100,60],nax=[4,4,4,4])

xend();

