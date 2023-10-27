opengl('save', 'software')% %% 一、以二进制按字节读取数据
profile on
fp = fopen('C:\Users\zzs\Desktop\chenhao\摇椅鞋\MU JU_02_标记点1 68_001.stl','rb');
src = fread(fp,'uint8=>uint8');
fclose(fp);

%% 二、提取有效信息
% 提取数据长度信息（四字节无符号整形）
len = typecast(src(81:84),'uint32');

% 提取三角片信息（[48有效字节+2填充字节]*len）
data = reshape(src(85:end),[50,len]);
data(end-1:end,:) = [];

% 类型转换(float*12*len)
dataf = typecast(data(:),'single');
dataf = reshape(dataf,[12,len]);

%% 三、获取v、f、n
% 获取v,f,n（注意MATLAB是列优先的，所以必须按下列方式写）
n = dataf(1:3,:)';
v = reshape(dataf(4:end,:),[3,len*3])';
f = reshape((1:len*3)',[3,len])';

% 去除重复顶点
[v, ~, indexn] =  unique(v, 'rows');
f = indexn(f);
figure
subplot(2,1,1)
view(3)
% subplot(2,1,1)
hold on
patch('vertices',v,'faces',f,'edgecolor','k',...
    'facecolor','k','facelighting','gouraud')
grid on
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')


light
axis equal
hold on

for pointCount =69
    x =v(:,1);
    y =v(:,2);
    z =v(:,3);

    [sphereCenter, radius] = min_enclosing_sphere0(x, y, z, pointCount);
    
%     figure('color', 'w')
    subplot(2,1,2)
    draw_sphere(sphereCenter, radius)
    hold on
%     plot3(x, y, z,'r')
view(3)
% subplot(2,1,1)
hold on
patch('vertices',v,'faces',f,'edgecolor','k',...
    'facecolor','k','facelighting','gouraud')
grid on
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')

figure_FontSize=12;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',12),'FontSize',figure_FontSize);
legend('拟合标记点','实体标记点') 
legend('FontName','宋体','FontSize',12,'LineWidth',1.5);

light
axis equal


    
    axis equal tight
    
    if sum(sqrt((x - sphereCenter(1)).^2 + (y - sphereCenter(2)).^2 + (z - sphereCenter(3)).^2) > radius + 0.0001) > 0
       disp('至少有一个点在球面以外')
    end
end

%{
Function: draw_sphere
Description: 画球面
Input: 球心sphereCenter，球半径radius
Output: 无
Author: Marc Pony(marc_pony@163.com)
%}
function draw_sphere(sphereCenter, radius)
[x,y,z] = sphere(200);
x = x * radius + sphereCenter(1);
y = y * radius + sphereCenter(2);
z = z * radius + sphereCenter(3);
h = surf(x, y, z);
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')
set(h, 'FaceAlpha', 0.3, 'MarkerEdgeColor', 'w')
shading interp
end
%{
Function: get_circle_center_3D
Description: 求空间三点确定的圆周的圆心
Input: 空间三个点a,b,c
Output: 空间圆周圆心center
Author: Marc Pony(marc_pony@163.com)
%}
function center = get_circle_center_3D(a, b, c)
x1 = a(1);
y1 = a(2);
z1 = a(3);
x2 = b(1);
y2 = b(2);
z2 = b(3);
x3 = c(1);
y3 = c(2);
z3 = c(3);
x4 = 0.5 * (x1 + x2);
y4 = 0.5 * (y1 + y2);
z4 = 0.5 * (z1 + z2);

x5 = 0.5 * (x2 + x3);
y5 = 0.5 * (y2 + y3);
z5 = 0.5 * (z2 + z3);

a11 = x2 - x1;
a12 = y2 - y1;
a13 = z2 - z1;
b1 = x4 * a11 + y4 * a12 + z4 * a13;

a21 = x3 - x2;
a22 = y3 - y2;
a23 = z3 - z2;
b2 = x5 * a21 + y5 * a22 + z5 * a23;

a31 = (y1 - y2) * (z2 - z3) - (y2 - y3) * (z1 - z2);
a32 = (x2 - x3) * (z1 - z2) - (x1 - x2) * (z2 - z3);
a33 = (x1 - x2) * (y2 - y3) - (x2 - x3) * (y1 - y2);
b3 = x3 * a31 + y3 * a32 + z3 * a33;

center = zeros(3, 1);
temp = a11 * (a22 * a33 - a23 * a32) + a12 * (a23 * a31 - a21 * a33) + a13 * (a21 * a32 - a22 * a31);
center(1) = ((a12 * a23 - a13 * a22) * b3 + (a13 * a32 - a12 * a33) * b2 + (a22 * a33 - a23 * a32) * b1) / temp;
center(2) = -((a11 * a23 - a13 * a21) * b3 + (a13 * a31 - a11 * a33) * b2 + (a21 * a33 - a23 * a31) * b1) / temp;
center(3) = ((a11 * a22 - a12 * a21) * b3 + (a12 * a31 - a11 * a32) * b2 + (a21 * a32 - a22 * a31) * b1) / temp;
end
%{
Function: get_distance_square_3D
Description: 求空间两点之间距离的平方
Input: 空间两点a，b
Output: 空间两点之间距离的平方
Author: Marc Pony(marc_pony@163.com)
%}
function distanceSquare = get_distance_square_3D(a, b)
distanceSquare = (a(1) - b(1))^2 + (a(2) - b(2))^2 + (a(3) - b(3))^2;
end
%{
Function: get_sign
Description: 求实数x的符号
Input: 实数x
Output: 实数x的符号y
Author: Marc Pony(marc_pony@163.com)
%}
function y = get_sign(x)
if abs(x) < 1.0e-8
    y = 0;
else
    if x < 0.0
        y = -1;
    else
        y = 1;
    end
end
end
%{
Function: get_sphere_center
Description: 求四面体外接球的球心
Input: 空间不共面四个点A,B,C,D
Output: 球面球心sphereCenter
Author: Marc Pony(marc_pony@163.com)
%}
function sphereCenter = get_sphere_center(A, B, C, D)
x1 = A(1);
y1 = A(2);
z1 = A(3);
x2 = B(1);
y2 = B(2);
z2 = B(3);
x3 = C(1);
y3 = C(2);
z3 = C(3);
x4 = D(1);
y4 = D(2);
z4 = D(3);

a11 = x2 - x1;
a12 = y2 - y1;
a13 = z2 - z1;
b1 = 0.5 * ((x2 - x1) * (x2 + x1) + (y2 - y1) * (y2 + y1) + (z2 - z1) * (z2 + z1));

a21 = x3 - x1;
a22 = y3 - y1;
a23 = z3 - z1;
b2 = 0.5 * ((x3 - x1) * (x3 + x1) + (y3 - y1) * (y3 + y1) + (z3 - z1) * (z3 + z1));

a31 = x4 - x1;
a32 = y4 - y1;
a33 = z4 - z1;
b3 = 0.5 * ((x4 - x1) * (x4 + x1) + (y4 - y1) * (y4 + y1) + (z4 - z1) * (z4 + z1));

temp = a11 * (a22 * a33 - a23 * a32) + a12 * (a23 * a31 - a21 * a33) + a13 * (a21 * a32 - a22 * a31);
x0 = ((a12 * a23 - a13 * a22) * b3 + (a13 * a32 - a12 * a33) * b2 + (a22 * a33 - a23 * a32) * b1) / temp;
y0 = -((a11 * a23 - a13 * a21) * b3 + (a13 * a31 - a11 * a33) * b2 + (a21 * a33 - a23 * a31) * b1) / temp;
z0 = ((a11 * a22 - a12 * a21) * b3 + (a12 * a31 - a11 * a32) * b2 + (a21 * a32 - a22 * a31) * b1) / temp;
sphereCenter = [x0; y0; z0];
end
%{
Function: min_enclosing_sphere
Description: 求三维空间pointCount个点的最小包围球
Input: 空间pointCount个点的坐标(x,y,z)，点个数pointCount
Output: 空间pointCount个点的最小包围球球心sphereCenter，半径radius
Author: Marc Pony(marc_pony@163.com)
%}
function [sphereCenter, radius] = min_enclosing_sphere0(x, y, z, pointCount)
p = [x(:)'; y(:)'; z(:)'];
p = p(:, randperm(pointCount)); %随机打乱数据
sphereCenter = p(:, 1);
radiusSquare = 0.0;
for i = 2 : pointCount
    if get_sign(get_distance_square_3D(p(:, i), sphereCenter) - radiusSquare) > 0
        sphereCenter = p(:, i);
        radiusSquare = 0.0;
        for j = 1 : i
            if get_sign(get_distance_square_3D(p(:, j), sphereCenter) - radiusSquare) > 0
                sphereCenter = 0.5 * (p(:, i) + p(:, j));
                radiusSquare = get_distance_square_3D(p(:, j), sphereCenter);
                for k = 1 : j
                    if get_sign(get_distance_square_3D(p(:, k), sphereCenter) - radiusSquare) > 0
                        sphereCenter = get_circle_center_3D(p(:, i), p(:, j), p(:, k));
                        radiusSquare = get_distance_square_3D(p(:, i), sphereCenter);
                        for m = 1 : k
                            if get_sign(get_distance_square_3D(p(:, m), sphereCenter) - radiusSquare) > 0
                                sphereCenter = get_sphere_center(p(:, i), p(:, j), p(:, k), p(:, m));
                                radiusSquare = get_distance_square_3D(p(:, i), sphereCenter);
                            end
                        end
                    end
                end
            end
        end
    end
end
radius = sqrt(radiusSquare);
end
