// -*- scilab -*-
// $Id: ellk.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//plot of K, K', K/K' in range 0<k<1

filename="ellk.fig";

k=[2.0/400:1.0/400:398.0/400]';
ellk = %k(k .* k);
ellkc = %k(1.0 - k .* k);
ellkr = ellk./ellkc;

driver('Fig');                  // do the plot directly into the .fig-file
xinit(filename);
xset("use color", 0);
plot2d([k,k,k],[ellk, ellkc, ellkr],[1, 2, 3],"111","K@K''@K/K''",[0,0,1,2*%pi],[1,4,2,2]);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);
exit;




