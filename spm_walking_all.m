clc;
clear;
maindir = 'G:\GAIT';
subdir =  dir( maindir );   % 确定子文件夹
SUBJ_left_ankle_angle=[];
SUBJ_left_ankle_moment=[];
SUBJ_left_ankle_power=[];
SUBJ_left_hip_angle=[];
SUBJ_left_hip_moment=[];
SUBJ_left_knee_angle=[];
SUBJ_left_knee_moment=[];
SUBJ_left_knee_power=[];
SUBJ_left_pelvic_angle=[];
SUBJ_right_ankle_angle=[];
SUBJ_right_ankle_moment=[];
SUBJ_right_ankle_power=[];
SUBJ_right_hip_angle=[];
SUBJ_right_hip_moment=[];
SUBJ_right_knee_angle=[];
SUBJ_right_knee_moment=[];
SUBJ_right_knee_power=[];
SUBJ_right_pelvic_angle=[];
for k=1:4
    left_ankle_angle=[];
    left_ankle_moment=[];
    left_ankle_power=[];
    left_hip_angle=[];
    left_hip_moment=[];
    left_hip_power=[];
    left_knee_angle=[];
    left_knee_moment=[];
    left_knee_power=[];
    left_pelvic_angle=[];
    right_ankle_angle=[];
    right_ankle_moment=[];
    right_ankle_power=[];
    right_hip_angle=[];
    right_hip_moment=[];
    right_hip_power=[];
    right_knee_angle=[];
    right_knee_moment=[];
    right_knee_power=[];
    right_pelvic_angle=[];

    for i =1:length( subdir )

        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
            continue;
        end

        %         filename_left_ankle_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_ankle_angle_all.xls') ;
        %         if(exist( filename_left_ankle_angle)~=0)
        %             left_ankle_angle = [left_ankle_angle; normlity_percent(xlsread(filename_left_ankle_angle))];%读取excel文件
        %             SUBJ_left_ankle_angle=[SUBJ_left_ankle_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_ankle_angle2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_ankle_angle_all.xls') ;
        %         if(exist( filename_left_ankle_angle2)~=0)
        %             left_ankle_angle = [left_ankle_angle; normlity_percent(xlsread(filename_left_ankle_angle2))];%读取excel文件
        %             SUBJ_left_ankle_angle=[SUBJ_left_ankle_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_ankle_angle3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_ankle_angle_all.xls') ;
        %         if(exist( filename_left_ankle_angle3)~=0)
        %             left_ankle_angle = [left_ankle_angle; normlity_percent(xlsread(filename_left_ankle_angle3))];%读取excel文件
        %             SUBJ_left_ankle_angle=[SUBJ_left_ankle_angle;zeros(3,1)+i-1];
        %         end

        filename_left_ankle_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_ankle_moment_all.xls') ;
        if(exist( filename_left_ankle_moment)~=0)
            left_ankle_moment = [left_ankle_moment; normlity_percent(xlsread(filename_left_ankle_moment))];%读取excel文件
            SUBJ_left_ankle_moment=[SUBJ_left_ankle_moment;zeros(3,1)+i-1];
        end

        filename_left_ankle_moment2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_ankle_moment_all.xls') ;
        if(exist( filename_left_ankle_moment2)~=0)
            left_ankle_moment = [left_ankle_moment; normlity_percent(xlsread(filename_left_ankle_moment2))];%读取excel文件
            SUBJ_left_ankle_moment=[SUBJ_left_ankle_moment;zeros(3,1)+i-1];
        end

        filename_left_ankle_moment3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_ankle_moment_all.xls') ;
        if(exist( filename_left_ankle_moment3)~=0)
            left_ankle_moment = [left_ankle_moment; normlity_percent(xlsread(filename_left_ankle_moment3))];%读取excel文件
            SUBJ_left_ankle_moment=[SUBJ_left_ankle_moment;zeros(3,1)+i-1];
        end

        filename_left_ankle_power= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_ankle_power_all.xls') ;
        if(exist( filename_left_ankle_power)~=0)
            left_ankle_power = [left_ankle_power; normlity_percent(xlsread(filename_left_ankle_power))];%读取excel文件
            SUBJ_left_ankle_power=[SUBJ_left_ankle_power;zeros(3,1)+i-1];
        end

        filename_left_ankle_power2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_ankle_power_all.xls') ;
        if(exist( filename_left_ankle_power2)~=0)
            left_ankle_power = [left_ankle_power; normlity_percent(xlsread(filename_left_ankle_power2))];%读取excel文件
            SUBJ_left_ankle_power=[SUBJ_left_ankle_power;zeros(3,1)+i-1];
        end

        filename_left_ankle_power3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_ankle_power_all.xls') ;
        if(exist( filename_left_ankle_power3)~=0)
            left_ankle_power = [left_ankle_power; normlity_percent(xlsread(filename_left_ankle_power3))];%读取excel文件
            SUBJ_left_ankle_power=[SUBJ_left_ankle_power;zeros(3,1)+i-1];
        end
        %
        %         filename_left_knee_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_knee_angle_all.xls') ;
        %         if(exist( filename_left_knee_angle)~=0)
        %             left_knee_angle = [left_knee_angle; normlity_percent(xlsread(filename_left_knee_angle))];%读取excel文件
        %             SUBJ_left_knee_angle=[SUBJ_left_knee_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_knee_angle2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_knee_angle_all.xls') ;
        %         if(exist( filename_left_knee_angle2)~=0)
        %             left_knee_angle = [left_knee_angle; normlity_percent(xlsread(filename_left_knee_angle2))];%读取excel文件
        %             SUBJ_left_knee_angle=[SUBJ_left_knee_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_knee_angle3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_knee_angle_all.xls') ;
        %         if(exist( filename_left_knee_angle3)~=0)
        %             left_knee_angle = [left_knee_angle; normlity_percent(xlsread(filename_left_knee_angle3))];%读取excel文件
        %             SUBJ_left_knee_angle=[SUBJ_left_knee_angle;zeros(3,1)+i-1];
        %         end
        %
        filename_left_knee_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_knee_moment_all.xls') ;
        if(exist( filename_left_knee_moment)~=0)
            left_knee_moment = [left_knee_moment; normlity_percent(xlsread(filename_left_knee_moment))];%读取excel文件
            SUBJ_left_knee_moment=[SUBJ_left_knee_moment;zeros(3,1)+i-1];
        end

        filename_left_knee_moment2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_knee_moment_all.xls') ;
        if(exist( filename_left_knee_moment2)~=0)
            left_knee_moment = [left_knee_moment; normlity_percent(xlsread(filename_left_knee_moment2))];%读取excel文件
            SUBJ_left_knee_moment=[SUBJ_left_knee_moment;zeros(3,1)+i-1];
        end

        filename_left_knee_moment3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_knee_moment_all.xls') ;
        if(exist( filename_left_knee_moment3)~=0)
            left_knee_moment = [left_knee_moment; normlity_percent(xlsread(filename_left_knee_moment3))];%读取excel文件
            SUBJ_left_knee_moment=[SUBJ_left_knee_moment;zeros(3,1)+i-1];
        end

        filename_left_knee_power= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_knee_power_all.xls') ;
        if(exist( filename_left_knee_power)~=0)
            left_knee_power = [left_knee_power; normlity_percent(xlsread(filename_left_knee_power))];%读取excel文件
            SUBJ_left_knee_power=[SUBJ_left_knee_power;zeros(3,1)+i-1];
        end

        filename_left_knee_power2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_knee_power_all.xls') ;
        if(exist( filename_left_knee_power2)~=0)
            left_knee_power = [left_knee_power; normlity_percent(xlsread(filename_left_knee_power2))];%读取excel文件
            SUBJ_left_knee_power=[SUBJ_left_knee_power;zeros(3,1)+i-1];
        end

        filename_left_knee_power3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_knee_power_all.xls') ;
        if(exist( filename_left_knee_power3)~=0)
            left_knee_power = [left_knee_power; normlity_percent(xlsread(filename_left_knee_power3))];%读取excel文件
            SUBJ_left_knee_power=[SUBJ_left_knee_power;zeros(3,1)+i-1];
        end

        %         filename_left_hip_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_hip_angle_all.xls') ;
        %         if(exist( filename_left_hip_angle)~=0)
        %             left_hip_angle = [left_hip_angle; normlity_percent(xlsread(filename_left_hip_angle))];%读取excel文件
        %             SUBJ_left_hip_angle=[SUBJ_left_hip_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_hip_angle2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_hip_angle_all.xls') ;
        %         if(exist( filename_left_hip_angle2)~=0)
        %             left_hip_angle = [left_hip_angle; normlity_percent(xlsread(filename_left_hip_angle2))];%读取excel文件
        %             SUBJ_left_hip_angle=[SUBJ_left_hip_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_hip_angle3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_hip_angle_all.xls') ;
        %         if(exist( filename_left_hip_angle3)~=0)
        %             left_hip_angle = [left_hip_angle; normlity_percent(xlsread(filename_left_hip_angle3))];%读取excel文件
        %             SUBJ_left_hip_angle=[SUBJ_left_hip_angle;zeros(3,1)+i-1];
        %         end
        %
        %         filename_left_hip_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_hip_moment_all.xls') ;
        %         if(exist( filename_left_hip_moment)~=0)
        %             left_hip_moment = [left_hip_moment; normlity_percent(xlsread(filename_left_hip_moment))];%读取excel文件
        %             SUBJ_left_hip_moment=[SUBJ_left_hip_moment;zeros(3,1)+i-1];
        %         end
        %
        filename_left_hip_moment2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_hip_moment_all.xls') ;
        if(exist( filename_left_hip_moment2)~=0)
            left_hip_moment = [left_hip_moment; normlity_percent(xlsread(filename_left_hip_moment2))];%读取excel文件
            SUBJ_left_hip_moment=[SUBJ_left_hip_moment;zeros(3,1)+i-1];
        end

        filename_left_hip_moment3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_hip_moment_all.xls') ;
        if(exist( filename_left_hip_moment3)~=0)
            left_hip_moment = [left_hip_moment; normlity_percent(xlsread(filename_left_hip_moment3))];%读取excel文件
            SUBJ_left_hip_moment=[SUBJ_left_hip_moment;zeros(3,1)+i-1];
        end

        filename_left_pelvic_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','left_pelvic_angle_all.xls') ;
        if(exist( filename_left_pelvic_angle)~=0)
            left_pelvic_angle = [left_pelvic_angle; normlity_percent(xlsread(filename_left_pelvic_angle))];%读取excel文件
            SUBJ_left_pelvic_angle=[SUBJ_left_pelvic_angle;zeros(3,1)+i-1];
        end

        filename_left_pelvic_angle2= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'NORMAL','left_pelvic_angle_all.xls') ;
        if(exist( filename_left_pelvic_angle2)~=0)
            left_pelvic_angle = [left_pelvic_angle; normlity_percent(xlsread(filename_left_pelvic_angle2))];%读取excel文件
            SUBJ_left_pelvic_angle=[SUBJ_left_pelvic_angle;zeros(3,1)+i-1];
        end

        filename_left_pelvic_angle3= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'SLOW','left_pelvic_angle_all.xls') ;
        if(exist( filename_left_pelvic_angle3)~=0)
            left_pelvic_angle = [left_pelvic_angle; normlity_percent(xlsread(filename_left_pelvic_angle3))];%读取excel文件
            SUBJ_left_pelvic_angle=[SUBJ_left_pelvic_angle;zeros(3,1)+i-1];
        end

        %         filename_right_ankle_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_ankle_angle_all.xls') ;
        %         if(exist( filename_right_ankle_angle)~=0)
        %             right_ankle_angle = [right_ankle_angle; normlity_percent(xlsread(filename_right_ankle_angle))];%读取excel文件
        %             SUBJ_right_ankle_angle=[SUBJ_right_ankle_angle;zeros(3,1)+i-1];
        %         end
        %
        filename_right_ankle_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_ankle_moment_all.xls') ;
        if(exist( filename_right_ankle_moment)~=0)
            right_ankle_moment = [right_ankle_moment; normlity_percent(xlsread(filename_right_ankle_moment))];%读取excel文件
            SUBJ_right_ankle_moment=[SUBJ_right_ankle_moment;zeros(3,1)+i-1];
        end

        filename_right_ankle_power= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_ankle_power_all.xls') ;
        if(exist( filename_right_ankle_power)~=0)
            right_ankle_power = [right_ankle_power; normlity_percent(xlsread(filename_right_ankle_power))];%读取excel文件
            SUBJ_right_ankle_power=[SUBJ_right_ankle_power;zeros(3,1)+i-1];
        end
        %
        %         filename_right_knee_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_knee_angle_all.xls') ;
        %         if(exist( filename_right_knee_angle)~=0)
        %             right_knee_angle = [right_knee_angle; normlity_percent(xlsread(filename_right_knee_angle))];%读取excel文件
        %             SUBJ_right_knee_angle=[SUBJ_right_knee_angle;zeros(3,1)+i-1];
        %         end
        %
        filename_right_knee_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_knee_moment_all.xls') ;
        if(exist( filename_right_knee_moment)~=0)
            right_knee_moment = [right_knee_moment; normlity_percent(xlsread(filename_right_knee_moment))];%读取excel文件
            SUBJ_right_knee_moment=[SUBJ_right_knee_moment;zeros(3,1)+i-1];
        end

        filename_right_knee_power= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_knee_power_all.xls') ;
        if(exist( filename_right_knee_power)~=0)
            right_knee_power = [right_knee_power; normlity_percent(xlsread(filename_right_knee_power))];%读取excel文件
            SUBJ_right_knee_power=[SUBJ_right_knee_power;zeros(3,1)+i-1];
        end
        %
        %         filename_right_hip_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_hip_angle_all.xls') ;
        %         if(exist( filename_right_hip_angle)~=0)
        %             right_hip_angle = [right_hip_angle; normlity_percent(xlsread(filename_right_hip_angle))];%读取excel文件
        %             SUBJ_right_hip_angle=[SUBJ_right_hip_angle;zeros(3,1)+i-1];
        %         end
        %
        filename_right_hip_moment= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_hip_moment_all.xls') ;
        if(exist( filename_right_hip_moment)~=0)
            right_hip_moment = [right_hip_moment; normlity_percent(xlsread(filename_right_hip_moment))];%读取excel文件
            SUBJ_right_hip_moment=[SUBJ_right_hip_moment;zeros(3,1)+i-1];
        end
        %
        %         filename_right_hip_power= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_hip_power_all.xls') ;
        %         if(exist( filename_right_hip_power)~=0)
        %             right_hip_power = [right_hip_power; normlity_percent(xlsread(filename_right_hip_power))];%读取excel文件
        %             SUBJ_right_hip_power=[SUBJ_right_hip_power;zeros(3,1)+i-1];
        %         end
        %
        %         filename_right_pelvic_angle= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),'FAST','right_pelvic_angle_all.xls') ;
        %         if(exist( filename_right_pelvic_angle)~=0)
        %             right_pelvic_angle = [right_pelvic_angle; normlity_percent(xlsread(filename_right_pelvic_angle))];%读取excel文件
        %             SUBJ_right_pelvic_angle=[SUBJ_right_pelvic_angle;zeros(3,1)+i-1];
        %         end
        %

    end

    %     if ~isempty(left_ankle_angle)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_ankle_angle.xls')),left_ankle_angle);
    %         eval([['left_ankle_angle',num2str(k)] ,'= left_ankle_angle']);
    %     end

    if ~isempty(left_ankle_moment)
        %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_ankle_moment.xls')),left_ankle_moment);
        eval([['left_ankle_moment',num2str(k)] ,'= left_ankle_moment']);
    end

    if ~isempty(left_ankle_power)
        %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_ankle_moment.xls')),left_ankle_moment);
        eval([['left_ankle_power',num2str(k)] ,'= left_ankle_power']);
    end
    %     if ~isempty(left_hip_angle)
    %         %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_hip_angle.xls')),left_hip_angle);
    %         eval([['left_hip_angle',num2str(k)] ,'= left_hip_angle']);
    %     end
    %
    if ~isempty(left_hip_moment)
        %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_hip_moment.xls')),left_hip_moment);
        eval([['left_hip_moment',num2str(k)] ,'= left_hip_moment']);
    end

    if ~isempty(left_pelvic_angle)
        %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_pelvic_angle.xls')),left_pelvic_angle);
        eval([['left_pelvic_angle',num2str(k)] ,'= left_pelvic_angle']);
    end
    %
    %     if ~isempty(left_hip_power)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_hip_power.xls')),left_hip_power);
    %         eval([['left_hip_power',num2str(k)] ,'= left_hip_power']);
    %     end
    %
    %     if ~isempty(left_knee_angle)
    %         %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_knee_angle.xls')),left_knee_angle);
    %         eval([['left_knee_angle',num2str(k)] ,'= left_knee_angle']);
    %     end
    %
    if ~isempty(left_knee_moment)
        %             xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_knee_moment.xls')),left_knee_moment);
        eval([['left_knee_moment',num2str(k)] ,'= left_knee_moment']);
    end

    if ~isempty(left_knee_power)
        %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_knee_power.xls')),left_knee_power);
        eval([['left_knee_power',num2str(k)] ,'= left_knee_power']);
    end

    %     if ~isempty(left_pelvic_angle)
    %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'left_pelvic_angle.xls')),left_pelvic_angle);
    %         eval([['left_pelvic_angle',num2str(k)] ,'= left_pelvic_angle']);
    %     end
    %     %
    %     if ~isempty(right_ankle_angle)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_ankle_angle.xls')),right_ankle_angle);
    %         eval([['right_ankle_angle',num2str(k)] ,'= right_ankle_angle']);
    %     end
    %
    %     if ~isempty(right_ankle_moment)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_ankle_moment.xls')),right_ankle_moment);
    %         eval([['right_ankle_moment',num2str(k)] ,'= right_ankle_moment']);
    %     end
    %
    %     if ~isempty(right_ankle_power)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_ankle_power.xls')),right_ankle_power);
    %         eval([['right_ankle_power',num2str(k)] ,'= right_ankle_power']);
    %     end
    %
    %     if ~isempty(right_hip_angle)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_hip_angle.xls')),right_hip_angle);
    %         eval([['right_hip_angle',num2str(k)] ,'= right_hip_angle']);
    %     end
    %
    %     if ~isempty(right_hip_moment)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_hip_moment.xls')),right_hip_moment);
    %         eval([['right_hip_moment',num2str(k)] ,'= right_hip_moment']);
    %     end
    %
    %     if ~isempty(right_hip_power)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_hip_power.xls')),right_hip_power);
    %         eval([['right_hip_power',num2str(k)] ,'= right_hip_power']);
    %     end
    %
    %     if ~isempty(right_knee_angle)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_knee_angle.xls')),right_knee_angle);
    %         eval([['right_knee_angle',num2str(k)] ,'= right_knee_angle']);
    %     end
    %
    %     if ~isempty(right_knee_moment)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_knee_moment.xls')),right_knee_moment);
    %         eval([['right_knee_moment',num2str(k)] ,'= right_knee_moment']);
    %     end
    %
    %     if ~isempty(right_knee_power)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_knee_power.xls')),right_knee_power);
    %         eval([['right_knee_power',num2str(k)] ,'= right_knee_power']);
    %     end
    %
    %     if ~isempty(right_pelvic_angle)
    %         %         xlswrite(fullfile('G:\GAIT\total_results\SPM_BIO',strcat(num2str(k),'right_pelvic_angle.xls')),right_pelvic_angle);
    %         eval([['right_pelvic_angle',num2str(k)] ,'= right_pelvic_angle']);
    %     end
end

% [spm_left_ankle_angle]=plot_SPM(left_ankle_angle1,left_ankle_angle2,left_ankle_angle3,left_ankle_angle4,1,SUBJ_left_ankle_angle);
% [spm_left_ankle_moment]=plot_SPM(left_ankle_moment1,left_ankle_moment2,left_ankle_moment3,left_ankle_moment4,2,SUBJ_left_ankle_moment);
% [spm_left_ankle_power]=plot_SPM(left_ankle_power1,left_ankle_power2,left_ankle_power3,left_ankle_power4,3,SUBJ_left_ankle_power);
% [spm_left_hip_angle]=plot_SPM(left_hip_angle1,left_hip_angle2,left_hip_angle3,left_hip_angle4,4,SUBJ_left_hip_angle);
% [spm_left_hip_moment]=plot_SPM(left_hip_moment1,left_hip_moment2,left_hip_moment3,left_hip_moment4,5,SUBJ_left_hip_moment);
% [spm_left_hip_power]=plot_SPM(left_hip_power1,left_hip_power2,left_hip_power3,left_hip_power4,6,SUBJ_left_hip_power);
% [spm_left_knee_angle]=plot_SPM(left_knee_angle1,left_knee_angle2,left_knee_angle3,left_knee_angle4,7,SUBJ_left_knee_angle);
% [spm_left_knee_moment]=plot_SPM(left_knee_moment1,left_knee_moment2,left_knee_moment3,left_knee_moment4,8,SUBJ_left_knee_moment);
% [spm_left_knee_power]=plot_SPM(left_knee_power1,left_knee_power2,left_knee_power3,left_knee_power4,9,SUBJ_left_knee_moment);
% [spm_left_pelvic_angle]=plot_SPM(left_pelvic_angle1,left_pelvic_angle2,left_pelvic_angle3,left_pelvic_angle4,10,SUBJ_left_pelvic_angle);
% [spm_right_ankle_angle]=plot_SPM(right_ankle_angle1,right_ankle_angle2,right_ankle_angle3,right_ankle_angle4,1,SUBJ_right_ankle_angle);
% [spm_right_ankle_moment]=plot_SPM(right_ankle_moment1,right_ankle_moment2,right_ankle_moment3,right_ankle_moment4,2,SUBJ_right_ankle_moment);
% [spm_right_ankle_power]=plot_SPM(right_ankle_power1,right_ankle_power2,right_ankle_power3,right_ankle_power4,3,SUBJ_right_ankle_power);
% [spm_right_hip_angle]=plot_SPM(right_hip_angle1,right_hip_angle2,right_hip_angle3,right_hip_angle4,4,SUBJ_right_hip_angle);
% [spm_right_hip_moment]=plot_SPM(right_hip_moment1,right_hip_moment2,right_hip_moment3,right_hip_moment4,5,SUBJ_right_hip_moment);
% [spm_right_hip_power]=plot_SPM(right_hip_power1,right_hip_power2,right_hip_power3,right_hip_power4,6,SUBJ_right_hip_power);
% [spm_right_knee_angle]=plot_SPM(right_knee_angle1,right_knee_angle2,right_knee_angle3,right_knee_angle4,7,SUBJ_right_knee_angle);
% [spm_right_knee_moment]=plot_SPM(right_knee_moment1,right_knee_moment2,right_knee_moment3,right_knee_moment4,8,SUBJ_right_knee_moment);
% [spm_right_knee_power]=plot_SPM(right_knee_power1,right_knee_power2,right_knee_power3,right_knee_power4,9,SUBJ_right_knee_moment);
% [spm_right_pelvic_angle]=plot_SPM(right_pelvic_angle1,right_pelvic_angle2,right_pelvic_angle3,right_pelvic_angle4,10,SUBJ_right_pelvic_angle);


% for k=1:4
%     left_ankle_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_ankle_angle.xls')));
%     eval([['left_ankle_angle',num2str(k)] ,'= left_ankle_angle']);
%     left_ankle_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_ankle_moment.xls')));
%     eval([['left_ankle_angle',num2str(k)] ,'= left_ankle_moment']);
%     left_ankle_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_ankle_power.xls')));
%     eval([['left_ankle_power',num2str(k)] ,'= left_ankle_power']);
%
%     left_knee_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_knee_angle.xls')));
%     eval([['left_knee_angle',num2str(k)] ,'= left_knee_angle']);
%     left_knee_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_knee_moment.xls')));
%     eval([['left_knee_moment',num2str(k)] ,'= left_knee_moment']);
%     left_knee_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_knee_power.xls')));
%     eval([['left_knee_power',num2str(k)] ,'= left_knee_power']);
%
%     left_hip_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_hip_angle.xls')));
%     eval([['left_hip_angle',num2str(k)] ,'= left_hip_angle']);
%     left_hip_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_hip_moment.xls')));
%     eval([['left_hip_moment',num2str(k)] ,'= left_hip_moment']);
%     left_hip_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_hip_power.xls')));
%     eval([['left_hip_power',num2str(k)] ,'= left_hip_power']);
%
%     left_pelvic_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'left_pelvic_angle.xls')));
%     eval([['left_pelvic_angle',num2str(k)] ,'= left_pelvic_angle']);
%
%     right_ankle_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_ankle_angle.xls')));
%     eval([['right_ankle_angle',num2str(k)] ,'= right_ankle_angle']);
%     right_ankle_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_ankle_moment.xls')));
%     eval([['right_ankle_angle',num2str(k)] ,'= right_ankle_moment']);
%     right_ankle_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_ankle_power.xls')));
%     eval([['right_ankle_power',num2str(k)] ,'= right_ankle_power']);
%
%     right_knee_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_knee_angle.xls')));
%     eval([['right_knee_angle',num2str(k)] ,'= right_knee_angle']);
%     right_knee_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_knee_moment.xls')));
%     eval([['right_knee_moment',num2str(k)] ,'= right_knee_moment']);
%     right_knee_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_knee_power.xls')));
%     eval([['right_knee_power',num2str(k)] ,'= right_knee_power']);
%
%     right_hip_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_hip_angle.xls')));
%     eval([['right_hip_angle',num2str(k)] ,'= right_hip_angle']);
%     right_hip_moment= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_hip_moment.xls')));
%     eval([['right_hip_moment',num2str(k)] ,'= right_hip_moment']);
%     right_hip_power= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_hip_power.xls')));
%     eval([['right_hip_power',num2str(k)] ,'= right_hip_power']);
%
%     right_pelvic_angle= xlsread(fullfile(' G:\GAIT\total_results\SPM_BIO',strcat( num2str(k),'right_pelvic_angle.xls')));
%     eval([['right_pelvic_angle',num2str(k)] ,'= right_pelvic_angle']);
% end

addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')

function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ_left_ankle_angle)
close all
figure('position', [0 0 1000 300])
%% plot mean and SD:
subplot(211)
if var==1 || var==4 || var==7 || var==10
    spm1d.plot.plot_meanSD(var1, 'color','k');%mean(var1,1) .*1e6
    hold on
    spm1d.plot.plot_meanSD(var2, 'color','b');
    hold on
    spm1d.plot.plot_meanSD(var3, 'color','g');
    hold on
    spm1d.plot.plot_meanSD(var4, 'color','r');
end

if var==2|| var==5 || var==8
    spm1d.plot.plot_meanSD(var1./100, 'color','k');
    hold on
    spm1d.plot.plot_meanSD(var2./100, 'color','b');
    hold on
    spm1d.plot.plot_meanSD(var3./100, 'color','g');
    hold on
    spm1d.plot.plot_meanSD(var4./100, 'color','r');
end
if var==3 || var==6 || var==9
    spm1d.plot.plot_meanSD(var1./100, 'color','k');
    hold on
    spm1d.plot.plot_meanSD(var2./100, 'color','b');
    hold on
    spm1d.plot.plot_meanSD(var3./100, 'color','g');
    hold on
    spm1d.plot.plot_meanSD(var4./100, 'color','r');

end
if var==1
    title('Sagittal Ankle Angle','FontWeight','bold')
    ylabel('Degress');
end

if var==2
    title('Sagittal Ankle Moment','FontWeight','bold')
    ylabel('Nm/kg');
end

if var==3
    title('Sagittal Ankle Power','FontWeight','bold')
    ylabel('W/kg');
end

if var==4
    title('Sagittal Hip Angle','FontWeight','bold')
    ylabel('Degress');
end

if var==5
    title('Sagittal Hip Moment','FontWeight','bold')
    ylabel('Degress');
end

if var==6
    title('Sagittal Hip Power','FontWeight','bold')
    ylabel('Degress');
end

if var==7
    title('Sagittal Knee Angle','FontWeight','bold')
    ylabel('Degress');
end

if var==8
    title('Sagittal Knee Moment','FontWeight','bold')
    ylabel('Nm/kg');
end

if var==9
    title('Sagittal Knee Power','FontWeight','bold')
    ylabel('W/kg');
end

if var==10
    title('Sagittal Pelvic angle','FontWeight','bold')
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
%(1) Conduct SPM analysis:
spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
spmi      = spm.inference(0.05);
% spmi      = spm_bs.inference(0.05);
disp(spmi)
hold on
subplot(212)
title('Main Effect','FontWeight','bold')
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
% plot(spm_bs.z,'LineWidth',2,'Color','k')  %between-subjects model
xlabel('% Gait Cycle');
ylabel('SPM','{F}');
end

function  Y_new=normlity_percent(Y)

if size(Y,1)<3
    Y_back=zeros(3-size(Y,1),101);
    Y_new=cat(1,Y(1:size(Y,1),:),Y_back);
end

if size(Y,1)>=3
    Y_new=Y(1:3,:);
end
end


function  Y_new=indice_flat_same(indice_flat,right_ankle_angle1)
if size(right_ankle_angle1,1)<indice_flat
    Y_back=zeros(indice_flat-size(right_ankle_angle1,1),101);
    Y_new=cat(1,right_ankle_angle1,Y_back);
end
end


