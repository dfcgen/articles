// -*- scilab -*-
// plot of landen transformation as a function of parameter u for K+jK' < u < 2K+jK'
// modular function is 2*M*L=K
filename="landen3.fig";

k = 1.0 / sqrt(2.0);
m = k*k;
k1 = sqrt(1.0 - m);
l = (1 - k1)/(1 + k1);
L = %k(l*l);
K = %k(m); // complete elliptic integral
K1 = %k(k1*k1);
M = K / L / 2;

segs = 400;

u = 0:K/segs:K;
x = real(%sn(K + %i * K1 + u, m));
y = real(%sn((K + %i * K1 + u)/M, l*l));

driver('Fig');
xinit(filename);
xset("use color", 0);
plot2d([u;u]',[x;y]',[2,1],"111","x=sn(u;k)@y=sn(u/M;l)",[0,-20,K,20],[1,2,2,2])
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

exit();

