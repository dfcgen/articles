// -*- scilab -*-
// $Id: chebyu.sci,v 1.1 2004-09-27 19:30:24 ralf Exp $
// Plot of Chebyshev functions of second kind U(x) in xfig file

filename="chebyu.fig";

xmax = 1.1;
xmin = -xmax;
ymax = 2;
ymin = -ymax;

deff('[y]=U(n, x)','y = real(sin((n+1)*acos(x))./sin(acos(x)))');

driver('Fig');
xinit(filename);

x = [xmin:(xmax - xmin)/400:xmax]';
xall = [x, x, x, x, x];
yall = [U(1, x), U(2, x), U(3, x), U(4, x), U(5, x)];
xset("use color", 0);
plot2d(xall, yall, [1, 2, 3, 4, 5],"011"," ", [xmin, ymin, xmax, ymax], [11,2,1,4]);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;




