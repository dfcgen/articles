// -*- scilab -*-
//plot of dn(u;k), cn(u;k) and sn(u;k) in range 0<x<4K

filename="sncndn4k.fig";

k = 1.0 / sqrt(2.0);
m = k*k;
k1 = sqrt(1.0 - m);
K = %k(m); // complete elliptic integral (quarter period of dn)
segs = 400;
x = -2*K:4*K/segs:2*K;
sn = real(%sn(x,m));
dn = real(sqrt(1.0 - m * sn .* sn)); // dn expressed by sn
cosn = real(%sn(x - K, m));
cn = -k1 * cosn ./ sqrt(1.0 - m * cosn .* cosn);      // correct sign with: cn(u+K; k) = -k' * sd(u; k)

driver('Fig');              // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);
plot2d([x;x;x]',[sn;cn;dn]',[1,2,3],"111","y=sn(x;0.7)@y=cn(x;0.7)@y=dn(x;0.7)",[-2*K,-1,2*K,1],[1,4,1,4])
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

exit();




