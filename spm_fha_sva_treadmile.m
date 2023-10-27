% clc;
% clear;
% addpath('F:\code\spm1dmatlab-master')
% addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
% addpath('F:\code\spm1dmatlab-master\spm8')
% maindir = 'G:\GAIT';
% subdir =  dir( maindir );
% SUBJ_ANGLE=[];
% for b=1:4
%     ANGLE =[];
%     for i =1:length( subdir )
%         if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir ) || i ==10 || i == 3 || i==12 % 如果不是目录跳过
%             continue;
%         end
% %         if i==9 || i==11 || i==13
% %             continue;
% %         end
%         shoe_num=fullfile( maindir, subdir( i ).name,'treadmile_data','ANGLE','L_SVA','*.xls');
%         subdir_shoe_num =  dir( shoe_num );
%         filename_angle = fullfile( maindir, subdir( i ).name,'treadmile_data','ANGLE','L_SVA',subdir_shoe_num(b).name);
%         ANGLE = [ANGLE;normlity_percent(xlsread(filename_angle))];%读取excel文件
%         SUBJ_ANGLE=[SUBJ_ANGLE;zeros(100,1)+i-1];
%     end
%     eval([['SVA',num2str(b)] ,'= ANGLE']);
%     %     xlswrite(fullfile('G:\GAIT\total_results\FHA_L',strcat(num2str(b),'fha_angle.xls')),ANGLE);
%     %     [x y]=find(FHA2==max(max(FHA2)));
%     %     max(max(FHA2))
% end

% [spm_angle1]=plot_SPM(FHA1,FHA2,FHA3,FHA4,1,SUBJ_ANGLE);
[spm_angle2]=plot_SPM(SVA1,SVA2,SVA3,SVA4,2,SUBJ_ANGLE);

function [spm]=plot_SPM(var1, var2,var3,var4,var,SUBJ_ANGLE)
SUBJ=SUBJ_ANGLE;

close all
figure('position', [0 0 1000 600])
%% plot mean and SD: FHA
% subplot(3,3,[1:6])
% spm1d.plot.plot_meanSD(var1, 'color','k');
% hold on
% spm1d.plot.plot_meanSD(var2, 'color','b');
% hold on
% spm1d.plot.plot_meanSD(var3, 'color','g');
% hold on
% spm1d.plot.plot_meanSD(var4, 'color','r');
% hold on
% line([20,20],[-40,40],'color','k','linestyle','-')
% hold on
% text(9,35,'负荷反应期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(9,35,'Loading Response','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% line([40,40],[-40,40],'color','k','linestyle','-')
% hold on
% text(30,35,'站立中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(30,35,'Midstannce','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% line([60,60],[-40,40],'color','k','linestyle','-')
% hold on
% text(50,35,'站立末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(50,35,'Terminal Stance','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% line([75,75],[-40,40],'color','k','linestyle','-')
% hold on
% text(67.5,35,'摆动前期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(67.5,35,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% line([85,85],[-40,40],'color','k','linestyle','-')
% hold on
% text(80,35,'摆动初期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(80,35,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% line([93,93],[-40,40],'color','k','linestyle','-')
% hold on
% text(89,35,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% text(89,35,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% text(96.5,35,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
% % text(96.5,35,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8,'FontName','微软雅黑','FontWeight','bold')
% hold on
% fill([0 20 20 0],[-40 -40 40 40],'b','facealpha',0.07,'LineStyle','none');
% fill([63 78 78 63],[-40 -40 40 40],'b','facealpha',0.07,'LineStyle','none');
% fill([97 100 100 97],[-40 -40 40 40],'b','facealpha',0.07,'LineStyle','none');
% 
% hl=legend('Flat','','R21','','R18.5','','R16','Location','southeast','Orientation','horizontal','FontName','微软雅黑','FontSize',9);
% set(hl,'Orientation','horizon')
% if var==1
%     title('足与水平方向夹角','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
% %     title('Foot-to-Horizontal-angle','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
%     ylabel('角度(°)','FontSize',11,'FontWeight','bold','FontName','微软雅黑');
% %     ylabel('Degress','FontSize',11,'FontWeight','bold','FontName','微软雅黑');
% end
% 
% if var==2
% %     title('足与垂直方向夹角','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
%     title('Shank-to-Vertical angle','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
%     ylabel('Degress','FontSize',11,'FontWeight','bold','FontName','微软雅黑');
% end
% set(gca, 'Box', 'off');
% Y=[var1;var2;var3;var4];
% A1(1:size(var1),1)=0;
% A2(1:size(var2),1)=1;
% A3(1:size(var3),1)=2;
% A4(1:size(var4),1)=3;
% A=[A1;A2;A3;A4];
% %(1) Conduct SPM analysis:
% spm_bs_angle    = spm1d.stats.anova1(Y, A);
% % spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
% spmi      = spm_bs_angle.inference(0.05);
% % spmi      = spm.inference(0.05);
% disp(spmi)
% hold on
% subplot(3,3,[7:9])
% title('主效应','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
% % title('Main Effect','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
% spmi.plot();
% % spmi.plot_threshold_label();
% % spmi.plot_p_values();
% xlabel('% 步态周期','FontName','微软雅黑','FontSize',11,'FontWeight','bold');
% % xlabel('% Gait Cycle','FontName','微软雅黑','FontSize',11,'FontWeight','bold');
% ylabel("SPM (F)",'FontName','微软雅黑','FontSize',11,'FontWeight','bold');
% line([20,20],[0,100],'color','k','linestyle','-')
% hold on
% line([40,40],[0,100],'color','k','linestyle','-')
% hold on
% line([60,60],[0,100],'color','k','linestyle','-')
% hold on
% line([75,75],[0,100],'color','k','linestyle','-')
% hold on
% line([85,85],[0,100],'color','k','linestyle','-')
% hold on
% line([93,93],[0,100],'color','k','linestyle','-')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% plot mean and SD: SVA

subplot(3,3,[1:6])
spm1d.plot.plot_meanSD(var1, 'color','k');
hold on
spm1d.plot.plot_meanSD(var2, 'color','b');
hold on
spm1d.plot.plot_meanSD(var3, 'color','g');
hold on
spm1d.plot.plot_meanSD(var4, 'color','r');
hold on
line([20,20],[-40,60],'color','k','linestyle','-')
hold on
text(9,55,'负荷反应期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([40,40],[-40,60],'color','k','linestyle','-')
hold on
text(30,55,'站立中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([60,60],[-40,60],'color','k','linestyle','-')
hold on
text(50,55,'站立末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([75,75],[-40,60],'color','k','linestyle','-')
hold on
text(67.5,55,'摆动前期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([85,85],[-40,60],'color','k','linestyle','-')
hold on
text(80,55,'摆动初期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
line([93,93],[-40,60],'color','k','linestyle','-')
hold on
text(89,55,'摆动中期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
text(96.5,55,'摆动末期','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',9,'FontName','微软雅黑','FontWeight','bold')
hold on
fill([0 20 20 0],[-40 -40 60 60],'b','facealpha',0.07,'LineStyle','none');
fill([60 85 85 60],[-40 -40 60 60],'b','facealpha',0.07,'LineStyle','none');
fill([94 100 100 94],[-40 -40 60 60],'b','facealpha',0.07,'LineStyle','none');
% fill([50 90 90 50],[-40 -40 40 40],'b','facealpha',0.2,'LineStyle','none');
% title('Sagittal Ankle Angle','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
% ylabel('Degress','FontName','微软雅黑','FontSize',11,'FontWeight','bold');
hl=legend('Flat','','R21','','R18.5','','R16','Location','southeast','Orientation','horizontal','FontName','微软雅黑','FontSize',9);
set(hl,'Orientation','horizon')
if var==1
    title('Foot-To-Horizontal Angle','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
    ylabel('Degress','FontSize',11,'FontWeight','bold','FontName','微软雅黑');
end

if var==2
    title('足与垂直方向夹角','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
    ylabel('角度(°)','FontSize',11,'FontWeight','bold','FontName','微软雅黑');
end
set(gca, 'Box', 'off');
Y=[var1;var2;var3;var4];
A1(1:size(var1),1)=0;
A2(1:size(var2),1)=1;
A3(1:size(var3),1)=2;
A4(1:size(var4),1)=3;
A=[A1;A2;A3;A4];
%(1) Conduct SPM analysis:
spm_bs_angle    = spm1d.stats.anova1(Y, A);
spmi      = spm_bs_angle.inference(0.05);
disp(spmi)
hold on
subplot(3,3,[7:9])
title('主效应','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
spmi.plot();
% spmi.plot_threshold_label();
% spmi.plot_p_values();
xlabel('% 步态周期','FontName','微软雅黑','FontSize',11,'FontWeight','bold');
ylabel("SPM (F)",'FontName','微软雅黑','FontSize',11,'FontWeight','bold');
hold on
line([20,20],[0,100],'color','k','linestyle','-')
hold on
line([40,40],[0,100],'color','k','linestyle','-')
hold on
line([60,60],[0,100],'color','k','linestyle','-')
hold on
line([75,75],[0,100],'color','k','linestyle','-')
hold on
line([85,85],[0,100],'color','k','linestyle','-')
hold on
line([93,93],[0,100],'color','k','linestyle','-')


figure('position', [0 0 1000 850])
subplot(6,1,1)
spm       = spm1d.stats.ttest2(var1,var2);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: Flat vs R21','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: Flat vs R21','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
hold on
subplot(6,1,2)
spm       = spm1d.stats.ttest2(var1,var3);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: Flat vs R18.5','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: Flat vs R18.5','FontSize',11,'FontWeight','bold','FontName','微软雅黑')

hold on
subplot(6,1,3)
spm       = spm1d.stats.ttest2(var1,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: Flat vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: Flat vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')

hold on
subplot(6,1,4)
spm       = spm1d.stats.ttest2(var2,var3);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: R21 vs R18.5','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: R21 vs R18.5','FontSize',11,'FontWeight','bold','FontName','微软雅黑')

hold on
subplot(6,1,5)
spm       = spm1d.stats.ttest2(var2,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: R21 vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: R21 vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
hold on
subplot(6,1,6)
spm       = spm1d.stats.ttest2(var3,var4);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% title('主效应: R18.5 vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
title('Main Effect: R18.5 vs R16','FontSize',11,'FontWeight','bold','FontName','微软雅黑')
% xlabel('% 步态周期','FontName','微软雅黑','FontSize',11,'FontWeight','bold');
xlabel('% Gait Cycle','FontName','微软雅黑','FontSize',11,'FontWeight','bold');

end

function  y_new=normlity_percent(y)
y_new = y(1:100,:);
end



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           �