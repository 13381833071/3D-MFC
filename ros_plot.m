clc;
clear;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\01qudaopeng normal 03L.xls';
data = xlsread(file);
x1 = data(:,1)./1800;
y1 = data(:,2)./1800;
% figure('position', [0 0 1000 800])
% subplot(1,3,1)
figure(1)
plot(-x1(2:end),y1(2:end),'k','LineWidth',2,'Marker','s','MarkerEdgeColor','k','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\02QUDAOPENG WALKING NORMAL04L.xls';
data = xlsread(file);
x2 = data(:,1)./1800;
y2 = data(:,2)./1800;
plot(-x2(2:end),y2(2:end),'k','LineWidth',2,'Marker','d','MarkerEdgeColor','b','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\03QUDAOPENG NORMAL03L.xls';
data = xlsread(file);
x3 = data(:,1)./1800;
y3 = data(:,2)./1800;
plot(-x3(2:end),y3(2:end),'k','LineWidth',2,'Marker','^','MarkerEdgeColor','g','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\04QUDAOPENG WALKKING NORMAL03L.xls';
data = xlsread(file);
x4 = data(:,1)./1800;
y4 = data(:,2)./1800;
plot(-x4(2:end),y4(2:end),'k','LineWidth',2,'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','w','LineStyle','-');
% title('Foot-shoe roll-over shape','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
% title('Foot roll-over shape','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
title('足翻滚形状','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
figure_FontSize=9;
set(gca, 'Fontname','微软雅黑','Fontsize', 9);
xlabel('水平前移(X)/身高','fontsi',9,'FontWeight','bold','Fontname','微软雅黑');
ylabel ('垂直定位(Z)/身高','Fontname','微软雅黑','fontsi',9,'FontWeight','bold');%,'posit

set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',9),'FontSize',figure_FontSize,'Fontname','微软雅黑');
set(gca, 'Box', 'off');
saveas(gca,'figure.emf')
hold on;
% plot(0,0,'k','Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',9);
scatter(0,0,80,'k','filled','o','MarkerEdgeColor','k','MarkerEdgeAlpha',1,'AlphaData',0.8,'MarkerFaceColor','k','MarkerFaceAlpha',0.4)
legend('Flat','R21','R18.5','R16','Orientation','vertical','FontName','Times New Roman','Fontsize',9,'Location','NorthWest');
% lgd.Position = [0.95  0.87  0  0];  % 左右 上下 宽度  高度
% 


file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\01qudaopeng normal 03L.xls';
data = xlsread(file);
x11 = data(:,3)./1800;
y11 = data(:,4)./1800;
% subplot(1,3,2)
figure(2)
plot(x11(2:end),y11(2:end),'k','LineWidth',2,'Marker','s','MarkerEdgeColor','k','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\02QUDAOPENG WALKING NORMAL04L.xls';
data = xlsread(file);
x22 = data(:,3)./1800;
y22 = data(:,4)./1800;
plot(x22(2:end),y22(2:end),'k','LineWidth',2,'Marker','d','MarkerEdgeColor','b','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\03QUDAOPENG NORMAL03L.xls';
data = xlsread(file);
x33 = data(:,3)./1800;
y33 = data(:,4)./1800;
plot(x33(2:end),y33(2:end),'k','LineWidth',2,'Marker','^','MarkerEdgeColor','g','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\04QUDAOPENG WALKKING NORMAL03L.xls';
data = xlsread(file);
x44 = data(:,3)./1800;
y44 = data(:,4)./1800;
plot(x44(2:end),y44(2:end),'k','LineWidth',2,'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','w','LineStyle','-');
% title('Ankle-foot roll-over shape','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
title('踝-足翻滚形状','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
figure_FontSize=9;
set(gca, 'Fontname','微软雅黑','Fontsize', 9);
xlabel('水平前移(X)/身高','fontsi',9,'FontWeight','bold','Fontname','微软雅黑');
ylabel ('垂直定位(Z)/身高','Fontname','微软雅黑','fontsi',9,'FontWeight','bold');%,'posit

set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',9),'FontSize',figure_FontSize,'Fontname','微软雅黑');
set(gca, 'Box', 'off');
scatter(0,0,80,'k','filled','o','MarkerEdgeColor','k','MarkerEdgeAlpha',1,'AlphaData',0.8,'MarkerFaceColor','k','MarkerFaceAlpha',0.4)
legend('Flat','R21','R18.5','R16','Orientation','vertical','FontName','Times New Roman','Fontsize',9,'Location','NorthWest');



file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\01qudaopeng normal 03L.xls';
data = xlsread(file);
x111 = data(:,5)./1800;
y111 = data(:,6)./1800;
% subplot(1,3,3)
figure(3)
plot(x111(2:end),y111(2:end),'k','LineWidth',2,'Marker','s','MarkerEdgeColor','k','MarkerFaceColor','w','LineStyle','-');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\02QUDAOPENG WALKING NORMAL04L.xls';
data = xlsread(file);
x222 = data(:,5)./1800;
y222 = data(:,6)./1800;
plot(x222(2:end),y222(2:end),'k','LineWidth',2,'Marker','d','MarkerEdgeColor','b','MarkerFaceColor','w','LineStyle','-');
% plot(x,y,'b','LineWidth',2,'Marker','d');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\03QUDAOPENG NORMAL03L.xls';
data = xlsread(file);
x333 = data(:,5)./1800;
y333 = data(:,6)./1800;
plot(x333(2:end),y333(2:end),'k','LineWidth',2,'Marker','^','MarkerEdgeColor','g','MarkerFaceColor','w','LineStyle','-');
% plot(x,y,'g','LineWidth',2,'Marker','^');
hold on;
file = 'G:\GAIT\qudaopeng\Roll_Over_Shape2\04QUDAOPENG WALKKING NORMAL03L.xls';
data = xlsread(file);
x444 = data(:,5)./1800;
y444 = data(:,6)./1800;
plot(x444(2:end),y444(2:end),'k','LineWidth',2,'Marker','o','MarkerEdgeColor','r','MarkerFaceColor','w','LineStyle','-');
% plot(x,y,'r','LineWidth',2,'Marker','o');
% title('Knee-ankle-foot roll-over shape','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
title('膝-踝-足翻滚形状','Fontsize',9,'FontWeight','bold','Fontname','微软雅黑')%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
figure_FontSize=9;
set(gca, 'Fontname','微软雅黑','Fontsize', 9);
xlabel('水平前移(X)/身高','fontsi',9,'FontWeight','bold','Fontname','微软雅黑');
ylabel ('垂直定位(Z)/身高','Fontname','微软雅黑','fontsi',9,'FontWeight','bold');%,'posit
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',9),'FontSize',figure_FontSize,'Fontname','微软雅黑');
set(gca, 'Box', 'off');
scatter(0,0,80,'k','filled','o','MarkerEdgeColor','k','MarkerEdgeAlpha',1,'AlphaData',0.8,'MarkerFaceColor','k','MarkerFaceAlpha',0.4)
legend('Flat','R21','R18.5','R16','Orientation','horizontal','FontName','Times New Roman','Fontsize',9,'Location','NorthWest');




