// -*- scilab -*-
// Plot of first elliptic transformation parametrized by u in interval [-K,+K]
// for modular functions of degree n=2,3,4,5

// filename="ellt1ltu24.fig";
filename="ellt1ltu35.fig";

k = 1.0 / sqrt(2.0);

m = k*k;
K = %k(m);                      // quarter x period (complete elliptic integral K)

segs = 400;

u = -K:2*K/segs:K;
x = real(%sn(u, m));
// y1 = real(%sn(2 * u + K, m));  // n = 2
y1 = real(%sn(3 * u, m));       // n = 3
// y2 = real(%sn(4 * u + K, m));  // n = 4
y2 = real(%sn(5 * u, m));       // n = 5

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);
plot2d([u;u;u]',[x;y1;y2]',1:3,"111","x=sn(u;k)@y=sn(u/M;l)",[-K,-1,K,1],[1,2,2,2])
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

exit();








