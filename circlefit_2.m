function [xc,yc,R,a]=circlefit_2(x,y)
% CIRCLEFIT fits a circle in x,y plane
% (x-a)^2 + (y-b)^2 = R^2
% x^2+y^2+a(1)*x+a(2)*y+a(3)=0

n=length(x);
xx=x.*x;
yy=y.*y;
xy=x.*y;

A=[sum(x) sum(y) n;sum(xy) sum(yy) sum(y);sum(xx) sum(xy) sum(x)];
B=[-sum(xx+yy);-sum(xx.*y+yy.*y);-sum(xx.*x+xy.*y)];
a=A\B;
xc = -0.5*a(1);
yc = -0.5*a(2);
R = sqrt(-(a(3)-xc^2-yc^2));

x2 = xc-R:0.01*R:xc+R;
y1_h = sqrt(R.^2 - (x2 - xc).^2) + yc;
y2_h = -sqrt(R.^2 - (x2 - xc).^2) + yc;
plot(x2,y1_h,'b')
hold on
plot(x2,y2_h','b')
plot(x,y,'*r')
end

