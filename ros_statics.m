% clc;
% clear;
% close all;
% maindir = 'G:\GAIT\total_results\spm_ROS_speed\normal';
% subdir =  dir( maindir );
% left_ros_normal = [];
% XC_F = [];
% YC_F = [];
% R_F=[];
% A_F=[];
% XC_AF = [];
% YC_AF = [];
% R_AF=[];
% A_AF=[];
% XC_KAF = [];
% YC_KAF = [];
% R_KAF=[];
% A_KAF=[];
% SUBJ=[];
% 
% for i =3:length( subdir )
%     if i==1 || i==2
%         continue;
%     end
%     normal_l=fullfile( maindir, subdir( i ).name);
%     left_ros_normal = [left_ros_normal; xlsread(normal_l)];
%     SUBJ=[SUBJ;repelem((1:1:14),3).'];
% end
% 
% 
% XC_F = left_ros_normal(:,1);
% YC_F = left_ros_normal(:,2);
% R_F=left_ros_normal(:,3);
% XC_AF = left_ros_normal(:,4);
% YC_AF = left_ros_normal(:,5);
% R_AF=left_ros_normal(:,6);
% XC_KAF = left_ros_normal(:,7);
% YC_KAF = left_ros_normal(:,8);
% R_KAF=left_ros_normal(:,9);
% XC_F = reshape(XC_F,[42,4]);
% YC_F = reshape(YC_F,[42,4]);
% R_F = reshape(R_F,[42,4]);
% XC_AF = reshape(XC_AF,[42,4]);
% YC_AF = reshape(YC_AF,[42,4]);
% R_AF = reshape(R_AF,[42,4]);
% XC_KAF = reshape(XC_KAF,[42,4]);
% YC_KAF = reshape(YC_KAF,[42,4]);
% R_KAF = reshape(R_KAF,[42,4]);
% % [spm_LEFT_PELVIC_ANGLE_rom_all]=plot_SPM(XC_F(:,1),XC_F(:,2),XC_F(:,3),XC_F(:,4),1,SUBJ);

% figure('position', [0 0 1000 880])
% subplot(331)
XC_F = reshape(XC_F,[42,4]);
boxplot([XC_F(:,1),XC_F(:,2),XC_F(:,3),XC_F(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('水平前移 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
title('足翻滚特征','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% title('(a)','position',[-4,38],'FontSize',16);
set(gca,'FontSize',16)


% subplot(334)
YC_F = reshape(YC_F,[42,4]);
boxplot([YC_F(:,1),YC_F(:,2),YC_F(:,3),YC_F(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('垂直定位 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% title('(d)','position',[-4,38],'FontSize',16);
set(gca,'FontSize',16)

% title('Foot','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on;
subplot(337)
R_F = reshape(R_F,[42,4]);
boxplot([R_F(:,1),R_F(:,2),R_F(:,3),R_F(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('拟和半径 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on;
% title('(g)','position',[-4,38],'FontSize',16);
set(gca,'FontSize',16)

% title('Foot','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%ANKLE FOOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% subplot(332)
XC_AF = reshape(XC_AF,[42,4]);
boxplot([XC_AF(:,1),XC_AF(:,2),XC_AF(:,3),XC_AF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('水平前移 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
title('踝-足翻滚特征','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
set(gca,'FontSize',16)
% title('(b)','position',[-4,38],'FontSize',16);
% hold on;
% subplot(335)
YC_AF = reshape(YC_AF,[42,4]);
boxplot([YC_AF(:,1),YC_AF(:,2),YC_AF(:,3),YC_AF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('垂直定位 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
set(gca,'FontSize',16)
% title('(e)','position',[-4,38],'FontSize',16);

% title('Foot','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on;
% subplot(338)
R_AF = reshape(R_AF,[42,4]);
boxplot([R_AF(:,1),R_AF(:,2),R_AF(:,3),R_AF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'})
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
title('(h)','position',[-4,38],'FontSize',16);
ylabel('拟和半径 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
set(gca,'FontSize',16)
% hold on;
% title('Foot','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%KNEE ANKLE FOOT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% subplot(333)
XC_KAF = reshape(XC_KAF,[42,4]);
boxplot([XC_KAF(:,1),XC_KAF(:,2),XC_KAF(:,3),XC_KAF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('水平前移 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
title('膝-踝-足翻滚特征','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
set(gca,'FontSize',16)
% title('(c)','position',[-4,38],'FontSize',16);


% hold on;
% subplot(336)
YC_KAF = reshape(YC_KAF,[42,4]);
boxplot([YC_KAF(:,1),YC_KAF(:,2),YC_KAF(:,3),YC_KAF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('垂直定位 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
set(gca,'FontSize',16)
% title('(f)','position',[-4,38],'FontSize',16);

% title('Foot','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on;
% subplot(339)
R_KAF = reshape(R_KAF,[42,4]);
boxplot([R_KAF(:,1),R_KAF(:,2),R_KAF(:,3),R_KAF(:,4)],'symbol','','Labels',{'Flat','R21','R18.5','R16'});
xlabel('摇摆半径','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
ylabel('拟和半径 (mm) ','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
title('(i)','position',[-4,38],'FontSize',16);
set(gca,'FontSize',16)


addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')
function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ_left_ankle_angle)
MEAN = mean([var1,var2,var3,var4]);
STD = std([var1,var2,var3,var4]);
for j=1:3
    Y=[var1(:,j);var2(:,j);var3(:,j);var4(:,j)];
    SUBJ=SUBJ_left_ankle_angle;
    A1(1:size(var1(:,j)),1)=0;
    A2(1:size(var2(:,j)),1)=1;
    A3(1:size(var3(:,j)),1)=2;
    A4(1:size(var4(:,j)),1)=3;
    A=[A1;A2;A3;A4];
    spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
    spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
    spmi      = spm.inference(0.05);
    spmi_bs      = spm_bs.inference(0.05);
    disp([spmi.p,spmi_bs.p])
    hold on
end

% figure('position', [0 0 1000 800])
% subplot(6,1,1)
% spm       = spm1d.stats.ttest2(var1,var2);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p1=spmi.p)
% title('Main Effect: Flat vs R21','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on
% subplot(6,1,2)
% spm       = spm1d.stats.ttest2(var1,var3);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p2=spmi.p)
% title('Main Effect: Flat vs R18.5','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% 
% hold on
% subplot(6,1,3)
% spm       = spm1d.stats.ttest2(var1,var4);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p3=spmi.p)
% title('Main Effect: Flat vs R16','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% 
% hold on
% subplot(6,1,4)
% spm       = spm1d.stats.ttest2(var2,var3);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p4=spmi.p)
% title('Main Effect: R21 vs R18.5','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% 
% hold on
% subplot(6,1,5)
% spm       = spm1d.stats.ttest2(var2,var4);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p5=spmi.p)
% title('Main Effect: R21 vs R16','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% hold on
% subplot(6,1,6)
% spm       = spm1d.stats.ttest2(var3,var4);
% spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
% spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
% disp(p6=spmi.p)
% title('Main Effect: R18.5 vs R16','FontSize',16,'FontWeight','bold','FontName','微软雅黑')
% xlabel('% Gait Cycle','FontName','微软雅黑','FontSize',16,'FontWeight','bold');
end



