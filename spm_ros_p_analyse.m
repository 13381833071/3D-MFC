clc
clear
addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')
maindir = 'G:\GAIT';
subdir =  dir( maindir );
SUBJ_LEFT_ANKLE_ANGLE_heel_strike_all=[];
for k=1:4
    LEFT_ANKLE_ANGLE_heel_strike_all=[];
  
    for i =4:length( subdir )

        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
            continue;
        end
        subdir2 =  dir( fullfile( maindir, subdir( i).name,'treadmile_data',strcat('0',num2str(k),'_force')) );
        for m=3:length( subdir2 )
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ankle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            filename_LEFT_ANKLE_ANGLE_heel_strike= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),subdir2(m).name,'X_kinematics','LEFT_ANKLE_ANGLE_heel_strike.xls') ;
            if(exist( filename_LEFT_ANKLE_ANGLE_heel_strike )~=0)
                LEFT_ANKLE_ANGLE_heel_strike_all = [LEFT_ANKLE_ANGLE_heel_strike_all; (xlsread(filename_LEFT_ANKLE_ANGLE_heel_strike))];%读取excel文件
                SUBJ_LEFT_ANKLE_ANGLE_heel_strike_all=[SUBJ_LEFT_ANKLE_ANGLE_heel_strike_all;zeros(3,1)+i-1];
            end

 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%knee%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            filename_LEFT_KNEE_ANGLE_heel_strike= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),subdir2(m).name,'X_kinematics','LEFT_KNEE_ANGLE_heel_strike.xls') ;
            if(exist( filename_LEFT_KNEE_ANGLE_heel_strike )~=0)
                LEFT_KNEE_ANGLE_heel_strike_all = [LEFT_KNEE_ANGLE_heel_strike_all; (xlsread(filename_LEFT_KNEE_ANGLE_heel_strike))];%读取excel文件
                SUBJ_LEFT_KNEE_ANGLE_heel_strike_all=[SUBJ_LEFT_KNEE_ANGLE_heel_strike_all;zeros(3,1)+i-1];
            end

           
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%hip%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            filename_LEFT_HIP_ANGLE_heel_strike= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),subdir2(m).name,'X_kinematics','LEFT_HIP_ANGLE_heel_strike.xls') ;
            if(exist( filename_LEFT_HIP_ANGLE_heel_strike )~=0)
                LEFT_HIP_ANGLE_heel_strike_all = [LEFT_HIP_ANGLE_heel_strike_all; (xlsread(filename_LEFT_HIP_ANGLE_heel_strike))];%读取excel文件
                SUBJ_LEFT_HIP_ANGLE_heel_strike_all=[SUBJ_LEFT_HIP_ANGLE_heel_strike_all;zeros(3,1)+i-1];
            end

         

          


            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%pelvic%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            filename_LEFT_PELVIC_ANGLE_heel_strike= fullfile( maindir, subdir( i ).name,'treadmile_data',strcat('0', num2str(k),'_force'),subdir2(m).name,'X_kinematics','LEFT_PELVIC_ANGLE_heel_strike.xls') ;
            if(exist( filename_LEFT_HIP_ANGLE_heel_strike )~=0)
                LEFT_PELVIC_ANGLE_heel_strike_all = [LEFT_PELVIC_ANGLE_heel_strike_all; (xlsread(filename_LEFT_PELVIC_ANGLE_heel_strike))];%读取excel文件
                SUBJ_LEFT_PELVIC_ANGLE_heel_strike_all=[SUBJ_LEFT_PELVIC_ANGLE_heel_strike_all;zeros(3,1)+i-1];
            end

            
        end
    end

    if ~isempty(LEFT_ANKLE_ANGLE_heel_strike_all)

        eval([['LEFT_ANKLE_ANGLE_heel_strike_all',num2str(k)] ,'= LEFT_ANKLE_ANGLE_heel_strike_all']);
        

    end

    if ~isempty(LEFT_ANKLE_ANGLE_heel_strike_all)

        eval([['LEFT_KNEE_ANGLE_heel_strike_all',num2str(k)] ,'= LEFT_KNEE_ANGLE_heel_strike_all']);
        

    end

    if ~isempty(LEFT_ANKLE_ANGLE_heel_strike_all)

        eval([['LEFT_HIP_ANGLE_heel_strike_all',num2str(k)] ,'= LEFT_HIP_ANGLE_heel_strike_all']);
        
    end

    if ~isempty(LEFT_ANKLE_ANGLE_heel_strike_all)

        eval([['LEFT_PELVIC_ANGLE_heel_strike_all',num2str(k)] ,'= LEFT_PELVIC_ANGLE_heel_strike_all']);
       

    end

end

[spm_LEFT_ANKLE_ANGLE_heel_strike_all]=plot_SPM(LEFT_ANKLE_ANGLE_heel_strike_all1,LEFT_ANKLE_ANGLE_heel_strike_all2,LEFT_ANKLE_ANGLE_heel_strike_all3,LEFT_ANKLE_ANGLE_heel_strike_all4,1,SUBJ_LEFT_ANKLE_ANGLE_heel_strike_all);

function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ_left_ankle_angle)

MEAN1= mean(var1);
STD1 = std(var1);
MEAN2= mean(var2);
STD2 = std(var2);
MEAN3= mean(var3);
STD3 = std(var3);
MEAN4= mean(var4);
STD4 = std(var4);

for j=1:3
    Y=[var1(:,j);var2(:,j);var3(:,j);var4(:,j)];
    A1(1:size(var1(:,j)),1)=0;
    A2(1:size(var2(:,j)),1)=1;
    A3(1:size(var3(:,j)),1)=2;
    A4(1:size(var4(:,j)),1)=3;
    A=[A1;A2;A3;A4];
    SUBJ=SUBJ_left_ankle_angle;
    spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
    spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
    spmi      = spm.inference(0.05);
    spmi_bs      = spm_bs.inference(0.05);
    disp([spmi.p, spmi_bs.p])
    hold on
end
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


