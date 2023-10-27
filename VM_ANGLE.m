clc;
close all;
clear;
vm1=[-0.4840 42.3476 -394.7024];
vm2=[-0.4840 27.7575 -394.7024];
heel_vir=[-10.7880 42.3476 -677.7512];
toe_marker=[1.2137 0.2601 -395.9976];
met_marker=[-60.4167 18.8000 -480.1134];
heel_height=26.2623;
apex_position=[4.6680 67.6372 -507.5328];
apex_position_to_toe=[4.6680 67.6372 -393.7298];
shoe_thickness_point1=[4.6680 72.5006 -578.5382];
shoe_thickness_point2=[4.6680 46.2383 -578.5382];

rocker_angle_vm2=rad2deg(atan(pdist([vm2;apex_position_to_toe],'euclidean')./pdist([apex_position;apex_position_to_toe],'euclidean')));
rocker_angle_vm1=rad2deg(atan(pdist([vm1;apex_position_to_toe],'euclidean')./pdist([apex_position;apex_position_to_toe],'euclidean')));
angle_to_mm=pdist([vm2;vm1],'euclidean')./abs((rocker_angle_vm2-rocker_angle_vm1));

% rocker_angle1=rad2deg(atan(-27.7575+67.6372)./(507.5328-500));
% rocker_angle2=rad2deg(atan(-42.3476+67.6372)./(507.5328-500));%393.7298
% angle_to_mm=abs((rocker_angle2-rocker_angle1)./(42.3476-27.7575));

%% 计算heel_vir的垂直位移变化轨迹
d1_heel_vir=pdist([toe_marker;met_marker],'euclidean');
d2_heel_vir=pdist([met_marker;heel_vir],'euclidean');
d3_heel_vir=pdist([toe_marker;heel_vir],'euclidean');

%% 计算垂直间隙每增长1mm对MFC的影响，实质上是rocker angle对MFC的影响
%% 计算vm1的垂直位移变化轨迹
d1_vm1=pdist([toe_marker;met_marker],'euclidean');
d2_vm1=pdist([met_marker;vm1],'euclidean');
d3_vm1=pdist([toe_marker;vm1],'euclidean');
%% 计算vm2的垂直位移变化轨迹
d1_vm2=pdist([toe_marker;met_marker],'euclidean');
d2_vm2=pdist([met_marker;vm2],'euclidean');
d3_vm2=pdist([toe_marker;vm2],'euclidean');

%%  计算顶点位置每增长1mm对MFC的影响
%% 计算apex_position的垂直位移变化轨迹
d1_apex_position_to_toe=pdist([toe_marker;met_marker],'euclidean');
d2_apex_position_to_toe=pdist([met_marker;apex_position_to_toe],'euclidean');
d3_apex_position_to_toe=pdist([toe_marker;apex_position_to_toe],'euclidean');
%% 计算apex_position的垂直位移变化轨迹
d1_apex_position=pdist([toe_marker;met_marker],'euclidean');
d2_apex_position=pdist([met_marker;apex_position],'euclidean');
d3_apex_position=pdist([toe_marker;apex_position],'euclidean');

%% 计算鞋跟高度每增长1mm对MFC的影响
%% 计算shoe_thickness_point1的垂直位移变化轨迹
d1_shoe_thickness_point1=pdist([toe_marker;met_marker],'euclidean');
d2_shoe_thickness_point1=pdist([met_marker;shoe_thickness_point1],'euclidean');
d3_shoe_thickness_point1=pdist([toe_marker;shoe_thickness_point1],'euclidean');
%% 计算shoe_thickness_point2的垂直位移变化轨迹
d1_shoe_thickness_point2=pdist([toe_marker;met_marker],'euclidean');
d2_shoe_thickness_point2=pdist([met_marker;shoe_thickness_point2],'euclidean');
d3_shoe_thickness_point2=pdist([toe_marker;shoe_thickness_point2],'euclidean');

%% VM1几何建模
pos1_vm1 = (d1_vm1^2+d3_vm1^2-d2_vm1^2)/(2*d1_vm1*d3_vm1);    %//求出余弦值
angle1_vm1 = acos(pos1_vm1);         %//余弦值装换为弧度值
realangle1_vm1 = angle1_vm1*180/pi;   %//弧度值转换为角度值
%% VM2几何建模
pos1_vm2 = (d1_vm2^2+d3_vm2^2-d2_vm2^2)/(2*d1_vm2*d3_vm2);    %//求出余弦值
angle1_vm2 = acos(pos1_vm2);         %//余弦值装换为弧度值
realangle1_vm2 = angle1_vm2*180/pi;   %//弧度值转换为角度值

%% apex_position几何建模
pos1_apex_position = (d1_apex_position^2+d3_apex_position^2-d2_apex_position^2)/(2*d1_apex_position*d3_apex_position);    %//求出余弦值
angle1_apex_position = acos(pos1_apex_position);         %//余弦值装换为弧度值
realangle1_apex_position = angle1_apex_position*180/pi;   %//弧度值转换为角度值
%% aapex_position_to_toe几何建模
pos1_apex_position_to_toe = (d1_apex_position_to_toe^2+d3_apex_position_to_toe^2-d2_apex_position_to_toe^2)/ ...
    (2*d1_apex_position_to_toe*d3_apex_position_to_toe);    %//求出余弦值
angle1_apex_position_to_toe = acos(pos1_apex_position_to_toe);         %//余弦值装换为弧度值
realangle1_apex_position_to_toe = angle1_apex_position_to_toe*180/pi;   %//弧度值转换为角度值

%% shoe_thickness_point1几何建模
pos1_shoe_thickness_point1 = (d1_shoe_thickness_point1^2+d3_shoe_thickness_point1^2-d2_shoe_thickness_point1^2)/...
    (2*d1_shoe_thickness_point1*d3_shoe_thickness_point1);    %//求出余弦值
angle1_shoe_thickness_point1 = acos(pos1_shoe_thickness_point1);         %//余弦值装换为弧度值
realangle1_shoe_thickness_point1 = angle1_shoe_thickness_point1*180/pi;   %//弧度值转换为角度值
%% shoe_thickness_point2几何建模
pos1_shoe_thickness_point2 = (d1_shoe_thickness_point2^2+d3_shoe_thickness_point2^2-d2_shoe_thickness_point2^2)/...
    (2*d1_shoe_thickness_point2*d3_shoe_thickness_point2);    %//求出余弦值
angle1_shoe_thickness_point2 = acos(pos1_shoe_thickness_point2);         %//余弦值装换为弧度值
realangle1_shoe_thickness_point2 = angle1_shoe_thickness_point2*180/pi;   %//弧度值转换为角度值


gait_data=load('C:\Users\zzs\Desktop\文章\chenhao\10分钟帧数据仅步态数据\zhuyunchao_01.csv');
Y1=gait_data(:,3);
X1=gait_data(:,2);

Y2=gait_data(:,9);
X2=gait_data(:,8);

Y6=gait_data(:,18);
X6=gait_data(:,17);

Y_vm1=[];
Y_vm2=[];
X_vm1=[];
X_vm2=[];
Y_apex_position=[];
Y_apex_position_to_toe=[];
Y_shoe_thickness_point1=[];
Y_shoe_thickness_point2=[];

ANGLE=[];
D_temp_vertical=[];
D_temp_vertical_apex=[];
D_temp_vertical_thickness=[];

for i=1:size(X1,1)
    %% 以角度为单位计算d
    %     angle2_vm1=atan2(Y2(i)-Y1(i),X2(i)-X1(i));
    angle2_vm1=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_vm1 = -angle2_vm1*180/pi;   %//弧度值转换为角度值
    d_vm1=d3_vm1*sind(realangle1_vm1-realangle2_vm1);
    d_vm1_level=d3_vm1*cosd(realangle1_vm1-realangle2_vm1);
    y_vm1=Y1(i)-abs(d_vm1);
    x_vm1=Y1(i)-abs( d_vm1_level);
    Y_vm1=[Y_vm1;y_vm1];
    X_vm1=[X_vm1;x_vm1];

    angle2_vm2=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_vm2 = -angle2_vm2*180/pi;   %//弧度值转换为角度值
    d_vm2=d3_vm2*sind(realangle1_vm2-realangle2_vm2);
    d_vm2_level=d3_vm2*cosd(realangle1_vm2-realangle2_vm2);
    y_vm2=Y1(i)-abs(d_vm2);
    Y_vm2=[Y_vm2;y_vm2];
    x_vm2=X1(i)-abs( d_vm2_level);
    X_vm2=[X_vm2;x_vm2];

    angle2_apex_position=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_apex_position = -angle2_apex_position*180/pi;   %//弧度值转换为角度值
    d_apex_position=d3_apex_position*sind(realangle1_apex_position-realangle2_apex_position);
    y_apex_position=Y1(i)-abs(d_apex_position);
    Y_apex_position=[Y_apex_position;y_apex_position];

    angle2_apex_position_to_toe=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_apex_position_to_toe = -angle2_apex_position_to_toe*180/pi;   %//弧度值转换为角度值
    d_apex_position_to_toe=d3_apex_position_to_toe*sind(realangle1_apex_position_to_toe ...
        -realangle2_apex_position_to_toe);
    y_apex_position_to_toe=Y1(i)-abs(d_apex_position_to_toe);
    Y_apex_position_to_toe=[Y_apex_position_to_toe;y_apex_position_to_toe];

    angle2_shoe_thickness_point1=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_shoe_thickness_point1 = -angle2_shoe_thickness_point1*180/pi;   %//弧度值转换为角度值
    d_shoe_thickness_point1=d3_shoe_thickness_point1*sind(realangle1_shoe_thickness_point1 ...
        -realangle2_shoe_thickness_point1);
    y_shoe_thickness_point1=Y1(i)-abs(d_shoe_thickness_point1);
    Y_shoe_thickness_point1=[Y_shoe_thickness_point1;y_shoe_thickness_point1];

    angle2_shoe_thickness_point2=atan((Y2(i)-Y1(i))/(X2(i)-X1(i)));
    realangle2_shoe_thickness_point2 = -angle2_shoe_thickness_point2*180/pi;   %//弧度值转换为角度值
    d_shoe_thickness_point2=d3_shoe_thickness_point2*sind(realangle1_shoe_thickness_point2 ...
        -realangle2_shoe_thickness_point2);
    y_shoe_thickness_point2=Y1(i)-abs(d_shoe_thickness_point2);
    Y_shoe_thickness_point2=[Y_shoe_thickness_point2;y_shoe_thickness_point2];

    d_temp_vertical=y_vm2- y_vm1;
    D_temp_vertical=[D_temp_vertical;d_temp_vertical];
    d_temp_level= d_vm1_level-d_vm2_level;
    angle_heel_to_toe=atan( d_temp_vertical/d_temp_level);
    ANGLE=[ANGLE;angle_heel_to_toe];

    d_temp_vertical_apex=y_apex_position- y_apex_position_to_toe;
    D_temp_vertical_apex=[D_temp_vertical_apex;d_temp_vertical_apex];

    d_temp_vertical_thickness=y_shoe_thickness_point2- y_shoe_thickness_point1;
    D_temp_vertical_thickness=[D_temp_vertical_thickness;d_temp_vertical_thickness];

end
ANGLE=rad2deg(ANGLE);

% 绘图
figure(1)
subplot(2,1,1)
box off;
plot(normlity_percent(Y_vm1(75:118)-57+10),'k','LineWidth',1.5);
box off;
hold on;
plot(normlity_percent(Y_vm2(75:118)-57+10),'b','LineWidth',1.5);
% ylabel('Swing foot clearance (mm)','FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel('摆动足部离地间隙(mm)','FontSize',9,'FontName','黑体','FontWeight','bold');
legend(' VM1',' VM2','FontSize',9,'FontWeight','bold','Location','NorthWest','FontName','Times New Roman')
box off;
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
hold on;
subplot(2,1,2)
box off;
plot(normlity_percent(D_temp_vertical(75:118)./14.5901),'r','LineWidth',1.5);
% ylabel({'Effect of every 1 mm increase in VM ';'on swing foot clearance (mm)'},'FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel({'垂直边距每增加1mm对'; '摆动足部离地间隙的影响'},'FontSize',9,'FontName','Times New Roman','FontWeight','bold');
xlabel('% 摆动相','FontName','Times New Roman','FontSize',11,'FontWeight','bold');
% xlabel('% Swing phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');

set(get(gca,'YLabel'),'FontSize',11,'Vertical','middle');
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
box off;

% 绘图
figure(2)
subplot(2,1,1)
box off;
plot(0:1:100,normlity_percent(Y_vm1(75:118)-57+10),'k','LineWidth',1.5);
hold on;
plot(0:1:100,normlity_percent(Y_vm2(75:118)-57+10),'b','LineWidth',1.5);
% ylabel('Swing foot clearance (mm)','FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel('摆动足部离地间隙(mm)','FontSize',9,'FontName','黑体','FontWeight','bold');
legend(' VM1',' VM2','FontSize',9,'FontWeight','bold','Location','NorthWest','FontName','Times New Roman')
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
hold on;
box off;
subplot(2,1,2)
box off;
plot(0:1:100,normlity_percent((D_temp_vertical(75:118)./14.5901).*angle_to_mm),'r','LineWidth',1.5);
% ylabel({'Effect of every 1° increase'; 'in rocker angle'; 'on swing foot clearance (mm)'},'FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel({'摇摆角度每增加1°对'; '摆动足部离地间隙的影响'},'FontSize',9,'FontName','黑体','FontWeight','bold');
% xlabel('% Swing phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');
xlabel('% 摆动相','FontName','黑体','FontSize',9,'FontWeight','bold');

set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
set(get(gca,'YLabel'),'FontSize',9,'Vertical','middle');
box off;

figure(3)
box off;
angle2_foot_VM1=atan((Y6(1:size(X1,1),1)-Y_vm1)./(X6(1:size(X1,1),1)-X_vm1));
angle2_foot_VM2=atan((Y6(1:size(X1,1),1)-Y_vm2)./(X6(1:size(X1,1),1)-X_vm2));
subplot(2,1,1)
a_plot=90;
A_plot=repmat(a_plot,28,1);
Anum=A_plot-abs(ANGLE(71:98));
A_plot1=repmat(a_plot,23,1);
Anum1=-(A_plot1-abs(ANGLE(98:120)));
Anum0=ones(69,1);
angle_plot=[Anum0 ;Anum; Anum1];
plot(0:1:100,normlity_percent(angle2_foot_VM1(75:118)*180/pi),'k','LineWidth',1.5);
hold on;
plot(0:1:100,normlity_percent(angle2_foot_VM2(75:118)*180/pi),'b','LineWidth',1.5);
% plot(normlity_percent(angle_plot(75:118)),'k','LineWidth',1.5);
% ylabel('Swing foot angle (\circ)','FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel('摆动足角度 (\circ)','FontSize',9,'FontName','黑体','FontWeight','bold');
box off;
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
legend(' VM1',' VM2','FontSize',9,'FontWeight','bold','Location','NorthEast','FontName','Times New Roman')
hold on
subplot(2,1,2)
h=plot(0:1:100,normlity_percent((angle2_foot_VM2(75:118)-angle2_foot_VM1(74:117))./14.5901*180/pi),'r','LineWidth',1.5);
% h=plot(normlity_percent((angle_plot(75:118)-angle_plot(74:117))./14.5901),'k','LineWidth',1.5);
% ylabel({'The effect of each 1mm increase in VM'; 'on the angle of adjacent swing foot (mm) '},'FontSize',11,'FontName','黑体','FontWeight','bold');
ylabel({'垂直边距每增加1mm对'; '摆动足角度的影响 '},'FontSize',9,'FontName','黑体','FontWeight','bold');
% xlabel('% Swing phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');
xlabel('% 摆动相','FontName','黑体','FontSize',9,'FontWeight','bold');

set(get(gca,'YLabel'),'FontSize',9,'Vertical','middle');
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
box off;

figure(4)
box off;
subplot(2,1,1)
plot(0:1:100,normlity_percent(Y_apex_position(75:118)+36+10),'k','LineWidth',1.5);
hold on;
plot(0:1:100,normlity_percent(Y_apex_position_to_toe(75:118)+36+10),'b','LineWidth',1.5);
% ylabel('Swing foot clearance (mm)','FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel('摆动足部离地间隙 (mm)','FontWeight','bold','FontSize',9,'FontName','黑体','FontWeight','bold');
legend(' A1',' A2','FontSize',9,'FontWeight','bold','Location','NorthWest','FontName','Times New Roman')
box off;
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
hold on;
subplot(2,1,2)
set(gca,'XTick',(75:5:118));
plot(0:1:100,normlity_percent(D_temp_vertical_apex(75:118)./ 113.8030),'r','LineWidth',1.5)
% ylabel({'Effect of each 1 mm movement';'of the vertex position';'to the toe position ';'on swing foot clearance (mm)'},'FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel({'顶点位置每前移1mm对';'摆动足部离地间隙的影响'},'FontSize',9,'FontName','黑体','FontWeight','bold');
% xlabel('% Swing phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');
xlabel('% 摆动相','FontName','黑体','FontSize',9,'FontWeight','bold');

set(get(gca,'YLabel'),'FontSize',9,'Vertical','middle');
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
box off;

figure(5)
box off;
subplot(2,1,1)
plot(0:1:100,normlity_percent(Y_shoe_thickness_point1(75:118)+98.1+10),'k','LineWidth',1.5);
hold on;
plot(0:1:100,normlity_percent(Y_shoe_thickness_point2(75:118)+98.1+10),'b','LineWidth',1.5);
% ylabel('Swing foot clearance (mm)','FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel('摆动足部离地间隙 (mm)','FontSize',9,'FontName','黑体','FontWeight','bold');
% legend(' H1',' H2','FontSize',10,'FontWeight','bold','Location','NorthWest')
legend(' T1',' T2','FontSize',9,'FontWeight','bold','Location','NorthWest','FontName','Times New Roman')
hold on;
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
box off;
subplot(2,1,2)
plot(0:1:100,normlity_percent(D_temp_vertical_thickness(75:118)./26.2623),'r','LineWidth',1.5)
figure_FontSize=8;
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
% ylabel({'Effect of each 1 mm';'increase in heel thickness ';'on swing foot clearance (mm)'},'FontSize',11,'FontName','Times New Roman','FontWeight','bold');
ylabel({'鞋跟厚度每增加 1 mm';'对摆动足部离地间隙的影响'},'FontSize',9,'FontName','黑体','FontWeight','bold');
% xlabel('% Swing phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');
xlabel('% 摆动相','FontName','黑体','FontSize',9,'FontWeight','bold');
set(get(gca,'XLabel'),'FontSize',9);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',9);
box off;

function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'spline');
end




