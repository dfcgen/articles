//plot of Cauer lowpass transfer function
epsilon=1.0;A=20; //ripple parameters
m1=epsilon*epsilon/(A*A-1);
n=4;omegac=6;
m=find_freq(epsilon,A,n);
omegar=omegac/sqrt(m);
[z,p,g]=zpell(epsilon,A,omegac,omegar);

//transfer function calculation
num=real(poly(z,'s')); den=real(poly(p,'s'));
transfer=g*num/den;

//plot
sample=0:20/2000:20;
att=-20/log(10)*log(abs(freq(g*num,den,%i*sample)));
plot2d(sample,att,1,"012","A",[0,0,20,50],[4,4,4,4])

