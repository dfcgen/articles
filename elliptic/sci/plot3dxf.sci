// -*- scilab -*-
// $Id: plot3dxf.sci,v 1.1 2004-09-27 19:55:08 ralf Exp $
//
// Scilab 3D-plot into a XFig file
//
//
function plot3dxf(filename, xr,yr,f,teta,alpha,leg,flag,ebox)

driver('Fig');
xinit(filename);
fplot3d(xr,yr,f,teta,alpha,leg,flag,ebox);
xend();
unix("xfig -a -exportLanguage eps -paper_size A4 -rigid " + filename);

endfunction;
