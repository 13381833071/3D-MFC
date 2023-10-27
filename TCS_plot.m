[spm_right_pelvic_angle]=plot_SPM(TCS_ankle1,TCS_ankle2,TCS_ankle3,TCS_ankle4,5,SUBJ);
% [spm_right_pelvic_angle]=plot_SPM(TCS_hip1,TCS_hip2,TCS_hip3,TCS_hip4,4,SUBJ);
% [spm_right_pelvic_angle]=plot_SPM(TCS_knee1,TCS_knee2,TCS_knee3,TCS_knee4,3,SUBJ);
% [spm_right_pelvic_angle]=plot_SPM(TCS_ankle1,TCS_ankle2,TCS_ankle3,TCS_ankle4,2,SUBJ);
% [spm_right_pelvic_angle]=plot_SPM(LTOE_all1,LTOE_all2,LTOE_all3,LTOE_all4,1,SUBJ);
% clc
% clear
addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')
maindir = 'G:\GAIT';
subdir =  dir( maindir );
SUBJ=[];
for k=1:4

    LTOE_all = [];
    TCS_ankle = [];
    TCS_hip = [];
    TCS_knee = [];
    TCS_sva = [];
    for i = [5 9 13 15 16 18]%4:length( subdir ) %i=[5 9 13 15 16 18]
        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir ) || i==10  || i==12   % 如果不是目录跳过
            continue;
        end
        subdir2 =  dir( fullfile( maindir, subdir( i).name,'Roll_Over_Shape','TCS'));
        subdir_LTOE_all= dir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(3).name,strcat('0', num2str(k),'*xls'))) ;
        subdir_TCS_ankle= dir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(4).name,strcat('0', num2str(k),'*xls'))) ;
        subdir_TCS_hip= dir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(5).name,strcat('0', num2str(k),'*xls'))) ;
        subdir_TCS_knee= dir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(6).name,strcat('0', num2str(k),'*xls'))) ;
        subdir_TCS_sva= dir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(7).name,strcat('0', num2str(k),'*xls'))) ;
        for j=1:length( subdir_LTOE_all )
            LTOE_all = [LTOE_all; (xlsread(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(3).name,subdir_LTOE_all(j).name)))];%读取excel文件
            TCS_ankle = [TCS_ankle; (xlsread(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(4).name,subdir_TCS_ankle(j).name)))];%读取excel文件
            TCS_hip = [TCS_hip; (xlsread(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(5).name,subdir_TCS_hip(j).name)))];%读取excel文件
            TCS_knee = [TCS_knee; (xlsread(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(6).name,subdir_TCS_knee(j).name)))];%读取excel文件
            TCS_sva = [TCS_sva; (xlsread(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','TCS',subdir2(7).name,subdir_TCS_sva(j).name)))];%读取excel文
            SUBJ=[SUBJ;zeros(1,1)+i-1];
        end
    end

    if ~isempty(LTOE_all)
        eval([['LTOE_all',num2str(k)] ,'= LTOE_all']);
        eval([['TCS_ankle',num2str(k)] ,'= TCS_ankle']);
        eval([['TCS_hip',num2str(k)] ,'= TCS_hip']);
        eval([['TCS_knee',num2str(k)] ,'= TCS_knee']);
        eval([['TCS_sva',num2str(k)] ,'= TCS_sva']);
    end
end

[b,a] = butter(2,6/(100/2),'low');
LTOE_all1 = filtfilt(b,a,double(LTOE_all1));
LTOE_all2 = filtfilt(b,a,double(LTOE_all2));
LTOE_all3 = filtfilt(b,a,double(LTOE_all3));
LTOE_all4 = filtfilt(b,a,double(LTOE_all4));
TCS_ankle1 = filtfilt(b,a,double(TCS_ankle1));
TCS_ankle2 = filtfilt(b,a,double(TCS_ankle2));
TCS_ankle3 = filtfilt(b,a,double(TCS_ankle3));
TCS_ankle4 = filtfilt(b,a,double(TCS_ankle4));
TCS_hip1 = filtfilt(b,a,double(TCS_hip1));
TCS_hip2 = filtfilt(b,a,double(TCS_hip2));
TCS_hip3 = filtfilt(b,a,double(TCS_hip3));
TCS_hip4 = filtfilt(b,a,double(TCS_hip4));
TCS_knee1 = filtfilt(b,a,double(TCS_knee1));
TCS_knee2 = filtfilt(b,a,double(TCS_knee2));
TCS_knee3 = filtfilt(b,a,double(TCS_knee3));
TCS_knee4 = filtfilt(b,a,double(TCS_knee4));
TCS_sva1 = filtfilt(b,a,double(TCS_sva1));
TCS_sva2 = filtfilt(b,a,double(TCS_sva2));
TCS_sva3 = filtfilt(b,a,double(TCS_sva3));
TCS_sva4 = filtfilt(b,a,double(TCS_sva4));


function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ_left_ankle_angle)
close all
figure('position', [0 0 1000 600])
%% plot mean and SD:
subplot(211)
if var==1
plot_mean(var1-86, 'color','k');
hold on
plot_mean(var2-86, 'color','b');
hold on
plot_mean(var3-86, 'color','g');
hold on
plot_mean(var4-86, 'color','r');
hold on;
line([29,29],[0,120],'color','k','linestyle','--')
ylim([0,120])
hold on
% text(14.5,108,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(14.5,108,'预摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([56,56],[0,120],'color','k','linestyle','--')
hold on
% text(42.5,108,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(42.5,108,'初始摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([92,92],[0,120],'color','k','linestyle','--')
hold on
% text(74,108,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(74,108,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
% text(96,108,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(96,108,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([0 70 70 0],[0 0 120 120],'b','facealpha',0.09,'LineStyle','none');
% ylabel('Vertical toe position (mm)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
ylabel('垂直脚趾位置 (mm)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
end

if var==2
plot_mean((normlity_percent(var1(1:end,1:89))), 'color','k');
hold on
plot_mean(var2(1:end,:), 'color','b');
hold on
plot_mean(var3(1:end,:), 'color','g');
hold on
plot_mean(var4(1:end,:), 'color','r');
hold on;
line([29,29],[0.5,3.5],'color','k','linestyle','--')
hold on
% text(14.5,3.25,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(14.5,3.25,'预摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([56,56],[0.5,3.5],'color','k','linestyle','--')
hold on
% text(42.5,3.25,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(42.5,3.25,'初始摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([92,92],[0.5,3.5],'color','k','linestyle','--')
hold on
% text(74,3.25,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(74,3.25,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
% text(96,3.25,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(96,3.25,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([8 37 37 8],[0.5 0.5 3.5 3.5],'b','facealpha',0.09,'LineStyle','none');
fill([59 100 100 59],[0.5 0.5 3.5 3.5],'b','facealpha',0.07,'LineStyle','none');
% title('Ankle','FontWeight','bold','FontName','Times New Roman','FontSize',9)
title('踝关节角度','FontWeight','bold','FontName','微软雅黑','FontSize',9)
% ylabel('Toe Clearance Sensitivity (mm/°)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
ylabel('脚趾间隙敏感度 (mm/°)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
% xlabel('Swing phase (%)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
end

if var==3
plot_mean(var1(1:end,:), 'color','k');
hold on
plot_mean(var2(1:end,:), 'color','b');
hold on
plot_mean(var3(1:end,:), 'color','g');
hold on
plot_mean(var4(1:end,:), 'color','r');
hold on;
line([29,29],[-6,6],'color','k','linestyle','--')
hold on
% text(14.5,5.3,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(14.5,5.3,'预摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([56,56],[-6,6],'color','k','linestyle','--')
hold on
% text(42.5,5.3,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(42.5,5.3,'初始摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([92,92],[-6,6],'color','k','linestyle','--')
hold on
% text(74,5.3,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(74,5.3,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
% text(96,5.3,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(96,5.3,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([21 35 35 21],[-6 -6 6 6],'b','facealpha',0.09,'LineStyle','none');
fill([98 100 100 98],[-6 -6 6 6],'b','facealpha',0.09,'LineStyle','none');
% title('Knee','FontWeight','bold','FontName','Times New Roman','FontSize',9)
title('膝关节角度','FontWeight','bold','FontName','微软雅黑','FontSize',9)
% ylabel('Toe Clearance Sensitivity (mm/°)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
ylabel('脚趾间隙敏感度 (mm/°)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
% xlabel('Swing phase (%)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
end

if var==4
plot_mean(var1(1:end,:), 'color','k');
hold on
plot_mean(var2(1:end,:), 'color','b');
hold on
plot_mean(var3(1:end,:), 'color','g');
hold on
plot_mean(var4(1:end,:), 'color','r');
hold on;
line([29,29],[-8,8],'color','k','linestyle','--')
hold on
% text(14.5,7.5,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(14.5,7.5,'预摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([56,56],[-8,8],'color','k','linestyle','--')
hold on
% text(42.5,7.5,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(42.5,7.5,'初始摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
ylim([-8,8])
line([92,92],[-8,8],'color','k','linestyle','--')
hold on
% text(74,7.5,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(74,7.5,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
% text(96,7.5,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(96,7.5,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([0 2 2 0],[-10 -10 10 10],'b','facealpha',0.09,'LineStyle','none');
fill([19 30 30 19],[-10 -10 10 10],'b','facealpha',0.09,'LineStyle','none');
fill([74 100 100 74],[-10 -10 10 10],'b','facealpha',0.09,'LineStyle','none');
% title('Hip','FontWeight','bold','FontName','Times New Roman','FontSize',9)
title('髋关节角度','FontWeight','bold','FontName','微软雅黑','FontSize',9)
% ylabel('Toe Clearance Sensitivity (mm/°)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
ylabel('脚趾间隙敏感度 (mm/°)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
end

if var==5
plot_mean(-(normlity_percent(var1(1:end,1:89))), 'color','k');
hold on
plot_mean(-var2(1:end,:), 'color','b');
hold on
plot_mean(-var3(1:end,:), 'color','g');
hold on
plot_mean(-var4(1:end,:), 'color','r');
hold on;
line([29,29],[-3.5,-0.5],'color','k','linestyle','--')
hold on
% text(14.5,-0.73,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(14.5,-0.73,'预摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([56,56],[-3.5,-0.5],'color','k','linestyle','--')
hold on
% text(42.5,-0.73,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(42.5,-0.73,'初始摆动','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([92,92],[-3.5,-0.5],'color','k','linestyle','--')
hold on
% text(74,-0.73,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(74,-0.73,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
% text(96,-0.73,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','Times New Roman','FontWeight','bold')
text(96,-0.73,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([9 36 36 9],[-3.5 -3.5 -0.5 -0.5],'b','facealpha',0.09,'LineStyle','none');
fill([59 100 100 59],[-3.5 -3.5 -0.5 -0.5],'b','facealpha',0.07,'LineStyle','none');
% title('SVA','FontWeight','bold','FontName','Times New Roman','FontSize',9)
title('足与垂直方向夹角','FontWeight','bold','FontName','微软雅黑','FontSize',9)
% ylabel('Toe Clearance Sensitivity (mm/°)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
ylabel('脚趾间隙敏感度 (mm/°)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
% xlabel('Swing phase (%)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
end

% xlabel('Swing phase (%)','FontWeight','bold','FontName','Times New Roman','FontSize',9);%(\circ)
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);%(\circ)
set(gca, 'box', 'off')
hl=legend('Flat','R21','R18.5','R16','Location','southwest','Orientation','horizontal','FontName','Times New Roman','FontSize',9);
set(hl,'Orientation','horizon')
set(gca, 'Box', 'off');
Y=[var1;var2;var3;var4];
A1(1:size(var1),1)=0;
A2(1:size(var2),1)=1;
A3(1:size(var3),1)=2;
A4(1:size(var4),1)=3;
A=[A1;A2;A3;A4];
SUBJ=SUBJ_left_ankle_angle;

spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
% spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
% spmi      = spm.inference(0.05);
spmi      = spm_bs.inference(0.05);
disp(spmi)
hold on
subplot(212)
% title('Main Effect','FontWeight','bold')
title('主效应','FontWeight','bold','FontName','微软雅黑','FontSize',9)
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% plot(spm_bs.z,'LineWidth',2,'Color','k')  %between-subjects model
% xlabel('Gait cycle (%)');
xlabel('摆动相 (%)','FontWeight','bold','FontName','微软雅黑','FontSize',9);
% ylabel('SPM','{F}');

figure('position', [0 0 1000 850])
subplot(6,1,1)
spm       = spm1d.stats.ttest2(var1,var2);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: Flat vs R21','FontSize',11,'FontWeight','bold','FontName','Times New Roman')
hold on
subplot(6,1,2)
spm       = spm1d.stats.ttest2(var1,var3);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: Flat vs R18.5','FontSize',11,'FontWeight','bold','FontName','Times New Roman')

hold on
subplot(6,1,3)
spm       = spm1d.stats.ttest2(var1,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: Flat vs R16','FontSize',11,'FontWeight','bold','FontName','Times New Roman')

hold on
subplot(6,1,4)
spm       = spm1d.stats.ttest2(var2,var3);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: R21 vs R18.5','FontSize',11,'FontWeight','bold','FontName','Times New Roman')

hold on
subplot(6,1,5)
spm       = spm1d.stats.ttest2(var2,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: R21 vs R16','FontSize',11,'FontWeight','bold','FontName','Times New Roman')
hold on
subplot(6,1,6)
spm       = spm1d.stats.ttest2(var3,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Main Effect: R18.5 vs R16','FontSize',11,'FontWeight','bold','FontName','Times New Roman')
xlabel('% Gait Cycle','FontName','Times New Roman','FontSize',11,'FontWeight','bold');

end


function  y_new=normlity_percent2(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end

function  Y_new=normlity_percent(Y)
for i=1:size(Y,1)
    y=Y(i,:);
    Y_new(i,:)=normlity_percent2(y);
end
end






