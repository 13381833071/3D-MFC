clc;
clear;
addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')
maindir = 'G:\GAIT';
subdir =  dir( maindir );
SUBJ_ANGLE=[];
for k=1:4
    ANGLE =[];
    for i =1:length( subdir )
        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )  % 如果不是目录跳过
            continue;
        end
        if i==3 || i==12 || i==13
            continue;
        end

%         shoe_num=fullfile( maindir, subdir( i ).name,'treadmile_data','ANGLE','L_SVA',strcat(num2str(k),'\','*.xls'));
        shoe_num=fullfile( maindir, subdir( i ).name,'treadmile_data','ANGLE','L_SVA','*.xls');
        subdir_shoe_num =  dir( shoe_num );
        for j =1:length( subdir_shoe_num )
            if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )  % 如果不是目录跳过
                continue;
            end
            filename_angle=fullfile( maindir, subdir( i ).name,'treadmile_data','ANGLE','L_SVA',subdir_shoe_num(j).name);
            angle=normlity_percent(xlsread(filename_angle));
            ANGLE = [ANGLE;angle(1:100,:)];%读取excel文件
            SUBJ_ANGLE=[SUBJ_ANGLE;zeros(100,1)+i-1];
        end

    end
    eval([['FHA',num2str(k)] ,'= ANGLE']);
%     xlswrite(fullfile('G:\GAIT\total_results\FHA_L',strcat(num2str(k),'fha_angle.xls')),ANGLE);
%     [x y]=find(FHA2==max(max(FHA2)));
%     max(max(FHA2))
end

[spm_angle]=plot_SPM(FHA1,FHA2,FHA3,FHA4,2,SUBJ_ANGLE);

function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ_left_ankle_angle)
close all
figure('position', [0 0 1000 300])
% plot mean and SD:
subplot(211)
spm1d.plot.plot_meanSD(var1, 'color','k');
hold on
spm1d.plot.plot_meanSD(var2, 'color','b');
hold on
spm1d.plot.plot_meanSD(var3, 'color','g');
hold on
spm1d.plot.plot_meanSD(var4, 'color','r');


if var==1
    title('Foot-To-Horizontal Angle','FontWeight','bold')
    ylabel('Degress');
end

if var==2
    title('Foot-To-Vertical Angle','FontWeight','bold')
    ylabel('Degress');
end

hl=legend('Flat_m','Flat_S','R21_m','R21_S','R18.5_m','R18.5_S','R16_m','R16_S','Location','NorthWest');
set(hl,'Orientation','horizon','Box','off')
set(gca, 'Box', 'off');
Y=[var1;var2;var3;var4];
A1(1:size(var1),1)=0;
A2(1:size(var2),1)=1;
A3(1:size(var3),1)=2;
A4(1:size(var4),1)=3;
A=[A1;A2;A3;A4];
SUBJ=SUBJ_left_ankle_angle;
% (1) Conduct SPM analysis:
spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
spmi_within      = spm.inference(0.05);
spmi_between      = spm_bs.inference(0.05);

hold on
subplot(212)
title('Main Effect','FontWeight','bold')
% spmi_within.plot();
spmi_within.plot_threshold_label();
spmi_within.plot_p_values();
spmi_between.plot();

% plot(spmi_between.z,'Color','r')  %between-subjects model
xlabel('% Gait Cycle');
ylabel('SPM','{F}');
end

function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end



                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           �