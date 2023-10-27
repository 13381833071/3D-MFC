clc;
clear;
maindir = 'G:\GAIT';
subdir =  dir( maindir );
Gait_data = c3dserver ;
SUBJ=[];
for k=1:4
    foot_roll_over_shape=[];
    ankle_foot_roll_over_shape=[];
    ankle_foot_roll_over_shape=[];
    
    for i =4:length( subdir )
        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
            continue;
        end
        subdirpath = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape2',num2str(k),'*.csv' );

        fiels = dir( subdirpath );

        for j =1 : length( fiels )
            filename2= fullfile( maindir, subdir( i ).name, 'Roll_Over_Shape2',num2str(k), fiels( j ).name) ;
            filename_left_ankle_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_shoe'),strcat( num2str(k),'left_ankle_angle.xls')) ;
            if(exist( filename_left_ankle_angle)~=0)
                left_ankle_angle = [left_ankle_angle; normlity_percent(xlsread(filename_left_ankle_angle))];%读取excel文件
                SUBJ=[SUBJ;zeros(100,1)+i-1];
            end

        end
    end
    eval([['Lcop_x_all',num2str(k)] ,'= Lcop_x_all']);
    eval([['Rcop_x_all',num2str(k)] ,'= Rcop_x_all']);
end

% [spm_left_hip_angle]=plot_SPM(Rcop_x_all1,Rcop_x_all2,Rcop_x_all3,Rcop_x_all4,1);
[spm_left_hip_angle]=plot_SPM(Lcop_x_all1,Lcop_x_all2,Lcop_x_all3,Lcop_x_all4,1);

function [spm_bs]=plot_SPM(var1, var2,var3,var4,var)
close all
if var==1
    figure('position', [0 0 1000 600])
    %     subplot(211)
    subplot(3,3,[1:6])
    spm1d.plot.plot_meanSD(var1, 'color','k');
    hold on
    spm1d.plot.plot_meanSD(var2, 'color','b');
    hold on
    spm1d.plot.plot_meanSD(var3, 'color','g');
    hold on
    spm1d.plot.plot_meanSD(var4, 'color','r');
    hold on
    line([20,20],[250,450],'color','k','linestyle','-')
    hold on
    text(10,430,'Load','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    line([40,40],[250,450],'color','k','linestyle','-')
    hold on
    text(30,430,'Midstance','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    line([60,60],[250,450],'color','k','linestyle','-')
    hold on
    text(50,430,'Terminal Stance','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    line([73,73],[250,450],'color','k','linestyle','-')
    hold on
    text(66.5,430,'Pre-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    line([84,84],[250,450],'color','k','linestyle','-')
    hold on
    text(78.5,430,'Inititial Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    line([92,92],[250,450],'color','k','linestyle','-')
    hold on
    text(88,430,'Midswing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    text(96,430,'Ter-Swing','HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',10,'FontName','Times New Roman','FontWeight','bold')
    hold on
    % fill([50 90 90 50],[-20 -20 40 40],'k','facealpha',0.2,'LineStyle','none');
    title('Trajectory of mediolateral COP','FontSize',10,'FontWeight','bold','FontName','Times New Roman')
    ylabel('Displacement (mm)','FontName','Times New Roman','FontSize',10,'FontWeight','bold');
    hl=legend('Flat','','R21','','R18.5','','R16','Location','southeast','Orientation','horizontal','FontName','Times New Roman','FontSize',9);
    set(hl,'Orientation','horizon')
    set(gca, 'Box', 'off');
    Y=[var1-72;var2-72;var3-72;var4-72];
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
    % subplot(3,3,[7:9])
    %     subplot(212)
    subplot(3,3,[7:9])
    title('Main Effect','FontSize',10,'FontWeight','bold','FontName','Times New Roman')
    spmi.plot();
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    xlabel('% Gait Cycle','FontName','Times New Roman','FontSize',10,'FontWeight','bold');
    ylabel("SPM (F)",'FontName','Times New Roman','FontSize',10,'FontWeight','bold');
    hold on
    %     ylim([270,450])
end
end


function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end



