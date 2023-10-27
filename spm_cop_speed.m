% clc;
% clear;
% maindir = 'G:\GAIT';
% subdir =  dir( maindir );
% Gait_data = c3dserver ;
% 
% for k=1:3
%     Rcop_x_all = [];
%     Lcop_x_all = [];
%     for i =4:length( subdir )
%         if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
%             continue;
%         end
%         subdirpath = fullfile( maindir, subdir( i ).name,'walking_all','4',num2str(k),'*.csv' );
%         subdirpath_c3d = fullfile( maindir, subdir( i ).name,'walking_all','4',num2str(k),'*.c3d' );
%         fiels = dir( subdirpath );
%         fiels_c3d = dir( subdirpath_c3d );
% 
%         for j =1 : length( fiels )
%             filename2= fullfile( maindir, subdir( i ).name, 'walking_all','4',num2str(k), fiels( j ).name) ;
%             Frame_start=csvread(filename2,13,0,[13 0 13 0]);
%             Rheel_strike_time=roundn(csvread(filename2,6,1,[6 1 6 1]),-2);
%             Rheel_strike=round((Rheel_strike_time-Frame_start)/0.01+1);
%             Rtoe_off_time=roundn(csvread(filename2,8,1,[8 1 8 1]),-2);
%             Rtoe_off=round((Rtoe_off_time-Frame_start)/0.01);
%             Lheel_strike_time=roundn(csvread(filename2,5,1,[5 1 5 1]),-2);
%             Lheel_strike=round((Lheel_strike_time-Frame_start)/0.01+1);
%             Ltoe_off_time=roundn(csvread(filename2,7,1,[7 1 7 1]),-2);
%             Ltoe_off=round((Ltoe_off_time-Frame_start)/0.01);
%             Frame_number=csvread(filename2,0,1,[0 1 0 1]);
%             Lcop_x=csvread(filename2,Frame_number+17,7,[Frame_number+17 7 2*Frame_number+16 7]);
%             Rcop_x=csvread(filename2,Frame_number+17,19,[Frame_number+17 19 2*Frame_number+16 19]);
%             Rcop_x_all = [Rcop_x_all;normlity_percent(Rcop_x(Rheel_strike:Rtoe_off))];
%             Lcop_x_all = [Lcop_x_all;normlity_percent(Lcop_x(Lheel_strike:Ltoe_off))];
%         end
%     end
%     eval([['Lcop_x_all',num2str(k)] ,'= Lcop_x_all']);
%     eval([['Rcop_x_all',num2str(k)] ,'= Rcop_x_all']);
% end

% [spm_left_hip_angle]=plot_SPM(Rcop_x_all1,Rcop_x_all2,Rcop_x_all3,1);
[spm_left_hip_angle]=plot_SPM(Lcop_x_all1,Lcop_x_all2,Lcop_x_all3,1);

function [spm_bs]=plot_SPM(var1, var2,var3,var)
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
    hl=legend('Fast','','Normal','','Slow','Location','southeast','Orientation','horizontal','FontName','Times New Roman','FontSize',9);
    set(hl,'Orientation','horizon')
    set(gca, 'Box', 'off');
    Y=[var1-72;var2-72;var3-72];
    A1(1:size(var1),1)=0;
    A2(1:size(var2),1)=1;
    A3(1:size(var3),1)=2;
    
    A=[A1;A2;A3];
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
    xlabel('% Stance Phase','FontName','Times New Roman','FontSize',10,'FontWeight','bold');
    ylabel("SPM (F)",'FontName','Times New Roman','FontSize',10,'FontWeight','bold');
    hold on
    %     ylim([270,450])

    figure('position', [0 0 1000 850])
    subplot(3,1,1)
    spm       = spm1d.stats.ttest2(var1,var2);
    spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
    spmi.plot();
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    title('Main Effect: Flat vs R21','FontSize',11,'FontWeight','bold','FontName','Times New Roman')
    hold on
    subplot(3,1,2)
    spm       = spm1d.stats.ttest2(var1,var3);
    spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
    spmi.plot();
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    title('Main Effect: Flat vs R18.5','FontSize',11,'FontWeight','bold','FontName','Times New Roman')

    hold on
    subplot(3,1,3)
    spm       = spm1d.stats.ttest2(var2,var3);
    spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
    spmi.plot();
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    title('Main Effect: Flat vs R16','FontSize',11,'FontWeight','bold','FontName','Times New Roman')
    xlabel('% Stance Phase','FontName','Times New Roman','FontSize',11,'FontWeight','bold');


end
end


function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end



