// -*- scilab -*-
// plot of landen transformation as a function of parameter u for K < u < K+jK'
// modular function is M*L'=K'
filename="landen2.fig";

k = 1.0 / sqrt(2.0);
m = k*k;
k1 = sqrt(1.0 - m);
l = (1 - k1)/(1 + k1);
L = %k(l*l);
K = %k(m); // complete elliptic integral
K1 = %k(k1*k1);
M = K / L / 2;

segs = 400;

u = 0:K/segs:K1;
x = real(%sn(K + %i * u, m));
y = -imag(%sn((K + %i * u)/M, l*l));

driver('Fig');              // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);
plot2d([u;u]',[x;y]',[2,1],"111","x=nd(u;k'')@y=-j*sc(u/M;l'')",[0,-10,K1,2],[1,2,2,6])
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

exit();

