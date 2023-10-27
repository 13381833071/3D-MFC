function [x0,y0,R]=circlefit(x,y)
xdata = x;
ydata = y;

k0 = ones(1,3);
F = @(k)(xdata-k(1)).^2+(ydata-k(2)).^2-k(3)^2;
[k,resnorm] = lsqnonlin(F,k0);

%k(1)是圆心的x坐标
%k(2)是圆心的y坐标
%k(3)的绝对值是圆的半径

r0 = [k(1),k(2)];
x0=k(1);
y0=k(2);
R = abs(k(3));
xx = k(1)-R:0.01*R:k(1)+R;
y1_h = sqrt(R.^2 - (xx - r0(1)).^2) + r0(2);
y2_h = -sqrt(R.^2 - (xx - r0(1)).^2) + r0(2);
% plot(xx,y1_h,'b')
% hold on
% plot(xx,y2_h','b')
% plot(xdata,ydata,'*r')
end