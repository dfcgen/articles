// Modulus transformation (Descending Landen-Transformation)
// k=(1-k')/(1+k')

x=0:0.001:1;
k=sqrt(1-x.*x);
y=(1-k)./(1+k);
plot(x,y,'k','k1');

