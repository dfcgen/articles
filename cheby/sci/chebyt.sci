// -*- scilab -*-
// $Id: chebyt.sci,v 1.1 2004-09-27 19:30:24 ralf Exp $
// Plot of Chebyshev polynomials in xfig file

filename="chebyt.fig";

xmax = 1.1;
xmin = -xmax;
ymax = 2;
ymin = -ymax;

deff('[y]=T(n, x)','y = real(cos(n*acos(x)))');

driver('Fig');
xinit(filename);

x = [xmin:(xmax - xmin)/400:xmax]';
xall = [x, x, x, x, x];
yall = [T(1, x), T(2, x), T(3, x), T(4, x), T(5, x)];
xset("use color", 0);
plot2d(xall, yall, [1, 2, 3, 4, 5],"011"," ", [xmin, ymin, xmax, ymax], [11,2,1,4]);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;




