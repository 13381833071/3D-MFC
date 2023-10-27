clc
clear
addpath('F:\code\spm1dmatlab-master')
addpath('F:\code\spm1dmatlab-master\+spm1d\+stats\+spm')
addpath('F:\code\spm1dmatlab-master\spm8')
maindir = 'G:\GAIT';
subdir =  dir( maindir );
SUBJ_cadence_all = [];
SUBJ_gait_cycle_timeLF_all = [];
SUBJ_gait_velocity_all = [];
SUBJ_step_width_all = [];
SUBJ_step_length_all = [];
SUBJ_swing_time_all = [];
SUBJ_MFC_all = [];
SUBJ_MFC = [];

for k=1:4
    cadence_all = [];
    gait_cycle_timeLF_all = [];
    gait_velocity_all = [];
    step_width_all = [];
    step_length_all = [];
    swing_time_all = [];
    MFC_all = [];
    min_all=[];
    max_all=[];
    Q1_all=[];
    Q2_all=[];
    Q3_all=[];
    IQR_all=[];
    S_all=[];
    K_all=[];
    STD_all=[];
    for i =4:length( subdir )

        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir ) || i==10
            continue;
        end

        filename_cadence= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'cadence.xls')) ;
        if(exist( filename_cadence)~=0)
            cadence_all = [cadence_all; (xlsread(filename_cadence))];%读取excel文件
            SUBJ_cadence_all=[SUBJ_cadence_all;zeros(1,1)+i-1];
        end

        filename_gait_cycle_timeLF= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'gait_cycle_timeLF.xls')) ;
        if(exist(filename_gait_cycle_timeLF)~=0)
            temp1=xlsread(filename_gait_cycle_timeLF);
            gait_cycle_timeLF_all = [gait_cycle_timeLF_all; temp1(1:50)];%读取excel文件
            SUBJ_gait_cycle_timeLF_all=[SUBJ_gait_cycle_timeLF_all;zeros(50,1)+i-1];
        end

        filename_LF_gait_velocity= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'LF_gait_velocity.xls')) ;
        if(exist(filename_LF_gait_velocity)~=0)
            temp2=xlsread(filename_LF_gait_velocity);
            gait_velocity_all = [gait_velocity_all; temp2(1:50)];%读取excel文件
            SUBJ_gait_velocity_all=[SUBJ_gait_velocity_all;zeros(50,1)+i-1];
        end

        filename_LF_step_width= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'step_width.xls')) ;
        if(exist(filename_LF_step_width)~=0)
            temp3=(xlsread(filename_LF_step_width))./1000;
            step_width_all = [step_width_all; temp3(1:50)];%读取excel文件
            SUBJ_step_width_all=[SUBJ_step_width_all;zeros(50,1)+i-1];
        end

        filename_LF_step_length= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'LF_step_length.xls')) ;
        if(exist(filename_LF_step_length)~=0)
            temp4=(xlsread(filename_LF_step_length))./1000;
            step_length_all = [step_length_all; temp4(1:50)];%读取excel文件
            SUBJ_step_length_all=[SUBJ_step_length_all;zeros(50,1)+i-1];
        end

        filename_swing_timeLF= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'swing_timeLF.xls')) ;
        if(exist(filename_swing_timeLF)~=0)
            temp5=(xlsread(filename_swing_timeLF));
            swing_time_all = [swing_time_all;temp5(1:50)];%读取excel文件
            SUBJ_swing_time_all=[SUBJ_swing_time_all;zeros(50,1)+i-1];
        end

        filename_MFC= fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k),'LMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls')) ;
        if(exist(filename_MFC)~=0)
            temp5=(xlsread(filename_MFC));
            mfc=temp5(:,1);
            min_mfc=min(mfc);
            max_mfc=max(mfc);
            Q1=prctile(mfc,25);
            Q2=prctile(mfc,50);
            Q3=prctile(mfc,75);
            IQR=(Q3-Q1);
            S=(skewness(mfc,[],1));
            K=(kurtosis(mfc,[],1));
            STD = std(mfc,[],1);
            min_all=[min_all;min_mfc];
            max_all=[max_all;max_mfc];
            Q1_all=[Q1_all;Q1];
            Q2_all=[Q2_all;Q2];
            Q3_all=[Q3_all;Q3];
            IQR_all=[IQR_all;IQR];
            S_all=[S_all;S];
            K_all=[K_all;K];
            STD_all=[STD_all;STD];
            MFC_all=[MFC_all;mfc];
            %             SUBJ_MFC=[SUBJ_MFC;zeros(150,1)+i-1];

        end
        SUBJ_MFC_all=[SUBJ_MFC_all;zeros(1,1)+i-1];
    end

    if ~isempty( STD_all)
        eval([['cadence_all',num2str(k)] ,'= cadence_all']);
        eval([['gait_cycle_timeLF_all',num2str(k)] ,'= gait_cycle_timeLF_all']);
        eval([['gait_velocity_all',num2str(k)] ,'= gait_velocity_all']);
        eval([['step_width_all',num2str(k)] ,'= step_width_all']);
        eval([['step_length_all',num2str(k)] ,'= step_length_all']);
        eval([['swing_time_all',num2str(k)] ,'= swing_time_all']);
        eval([['min_all',num2str(k)] ,'= min_all']);
        eval([['max_all',num2str(k)] ,'= max_all']);
        eval([['Q1_all',num2str(k)] ,'= Q1_all']);
        eval([['Q2_all',num2str(k)] ,'= Q2_all']);
        eval([['Q3_all',num2str(k)] ,'= Q3_all']);
        eval([['IQR_all',num2str(k)] ,'= IQR_all']);
        eval([['S_all',num2str(k)] ,'= S_all']);
        eval([['K_all',num2str(k)] ,'= K_all']);
        eval([['STD_all',num2str(k)] ,'= STD_all']);
        eval([['STD_all',num2str(k)] ,'= STD_all']);
        eval([['MFC_all',num2str(k)] ,'= MFC_all']);

    end
end

% [spm_bs]=plot_SPM(S_all1,S_all2,S_all3,S_all4,SUBJ_MFC_all);
% [spm_bs]=plot_SPM(K_all1,K_all2,K_all3,K_all4,SUBJ_MFC_all);
% [spm_bs]=plot_SPM(IQR_all1,IQR_all2,IQR_all3,IQR_all4,SUBJ_MFC_all);
% [spm_bs]=plot_SPM(STD_all1,STD_all2,STD_all3,STD_all4,SUBJ_MFC_all);
% [spm_bs]=plot_SPM(Q2_all1,Q2_all2,Q2_all3,Q2_all4,SUBJ_MFC_all);

% mfc_sta(gait_cycle_timeLF_all1,gait_cycle_timeLF_all2,gait_cycle_timeLF_all3,gait_cycle_timeLF_all4,7)
% mfc_sta(step_length_all1,step_length_all2,step_length_all3,step_length_all4,6)
% mfc_sta(K_all1,K_all2,K_all3,K_all4,5)
% mfc_sta(S_all1,S_all2,S_all3,S_all4,4)
% mfc_sta(STD_all1,STD_all2,STD_all3,STD_all4,3)
% mfc_sta(IQR_all1,IQR_all2,IQR_all3,IQR_all4,2)
% mfc_sta(Q2_all1,Q2_all2,Q2_all3,Q2_all4,1)
mfc_sta(min_all1,min_all2,min_all3,min_all4,8)

% barweb([mean(Q2_all1) ;mean(Q2_all2) ;mean(Q2_all3) ;mean(Q2_all4)],[std(Q2_all1) ;std(Q2_all2) ;std(Q2_all3) ;std(Q2_all4)],1,{'Flat','R21','R18.5','R16'},'Median MFC','Walking Condition','MFC (mm)',jet,'none','',2,'plot');
% boxplot([MFC_all1(1:5269),MFC_all2(1:5269),MFC_all3(1:5269),MFC_all4(1:5269)],'symbol','','Labels',{'Flat';'R21';'R18.5';'R16'});
% [spm_MFC_all]=plot_SPM(MFC_all1,MFC_all2,MFC_all3,MFC_all4,1,SUBJ_MFC);
% mean1=mean([min_all1 max_all1 Q1_all1 Q2_all1 Q3_all1 IQR_all1 S_all1 K_all1 STD_all1],2);
% mean2=mean([min_all2 max_all2 Q1_all1 Q2_all2 Q3_all1 IQR_all2 S_all1 K_all2 STD_all2],2);
% mean3=mean([min_all3 max_all3 Q1_all3 Q2_all3 Q3_all3 IQR_all3 S_all3 K_all3 STD_all3],2);
% mean4=mean([min_all4 max_all4 Q1_all4 Q2_all4 Q3_all4 IQR_all4 S_all4 K_all4 STD_all4],2);
% [spm_mean_all_all]=plot_SPM(mean1,mean2,mean3,mean4,1,SUBJ_MFC_all);
% [spm_LEFT_ANKLE_cadence_all]=plot_SPM(cadence_all1,cadence_all2,cadence_all3,cadence_all4,1,SUBJ_cadence_all);
% [spm_LEFT_ANKLE_gait_cycle_time_all]=plot_SPM(gait_cycle_timeLF_all1,gait_cycle_timeLF_all2,gait_cycle_timeLF_all3,gait_cycle_timeLF_all4,1,SUBJ_gait_cycle_timeLF_all);
% [spm_LEFT_ANKLE_velocity_all]=plot_SPM(gait_velocity_all1,gait_velocity_all2,gait_velocity_all3,gait_velocity_all4,1,SUBJ_gait_velocity_all);
% [spm_LEFT_ANKLE_step_width_all]=plot_SPM(step_width_all1,step_width_all2,step_width_all3,step_width_all4,1,SUBJ_step_width_all);
% [spm_step_length_all]=plot_SPM(step_length_all1,step_length_all2,step_length_all3,step_length_all4,1,SUBJ_step_length_all);
% [spm_swing_time_all]=plot_SPM(swing_time_all1,swing_time_all2,swing_time_all3,swing_time_all4,1,SUBJ_swing_time_all);
% [spm_min_all]=plot_SPM(min_all1,min_all2,min_all3,min_all4,1,SUBJ_MFC_all);
% [spm_max_all]=plot_SPM(max_all1,max_all2,max_all3,max_all4,1,SUBJ_MFC_all);
% [spm_Q1_all]=plot_SPM(Q1_all1,Q1_all2,Q1_all3,Q1_all4,1,SUBJ_MFC_all);
% [spm_Q2_all]=plot_SPM(Q2_all1,Q2_all2,Q2_all3,Q2_all4,1,SUBJ_MFC_all);
% [spm_Q3_all]=plot_SPM(Q3_all1,Q3_all2,Q3_all3,Q3_all4,1,SUBJ_MFC_all);
% [spm_IQR_all]=plot_SPM(IQR_all1,IQR_all2,IQR_all3,IQR_all4,1,SUBJ_MFC_all);
% [spm_S_all]=plot_SPM(S_all1,S_all2,S_all3,S_all4,1,SUBJ_MFC_all);
% [spm_K_all]=plot_SPM(K_all1,K_all2,K_all3,K_all4,1,SUBJ_MFC_all);
% [spm_STD_all]=plot_SPM(STD_all1,STD_all2,STD_all3,STD_all4,1,SUBJ_MFC_all);

function X = mfc_sta(Q2_all1,Q2_all2,Q2_all3,Q2_all4,var)
% if var==2
%     Q2_all1(2,:)=Q2_all1(3,:);
% end
X = categorical({'Flat','R21','R18.5','R16'});
X = reordercats(X,{'Flat','R21','R18.5','R16'});
b=bar(X,[mean(Q2_all1) ;mean(Q2_all2) ;mean(Q2_all3) ;mean(Q2_all4)],'c');  
b.CData(1,:) = [1 0 1];
b.CData(2,:) = [0 0 1];
b.CData(3,:) = [0 1 0];
b.CData(4,:) = [1 0 0];
b.FaceColor = 'flat';
hold on; 

errorbar([mean(Q2_all1) ;mean(Q2_all2) ;mean(Q2_all3) ;mean(Q2_all4)],[std(Q2_all1) ;std(Q2_all2) ;std(Q2_all3) ;std(Q2_all4)],'k','LineStyle','none');

if var==1
ylabel('MFC Median (mm)')
end

if var==2
ylabel('MFC IQR (mm)')
end

if var==3
ylabel('MFC SD (mm)')
end

if var==4
ylabel('MFC Skewness (mm)')
end

if var==5
ylabel('MFC Kurtosis (mm)')
end

if var==6
ylabel('Step Length (m)')
end

if var==7
ylabel('Gait cycle time (s)')
end

if var==8
ylabel('MFC Minimum (mm)')
end

box off;
xlabel('Walking Condition')
% ylabel('MFC (mm)')
end

function [spm_bs]=plot_SPM(var1, var2,var3,var4,SUBJ_left_ankle_angle)

mfc=[var1,var2,var3,var4];
mean_mfc=mean(mfc,1);
STD_mfc = std(mfc,1);

% Y=[var1;var2;var3;var4];
A1(1:size(var1),1)=0;
A2(1:size(var2),1)=1;
A3(1:size(var3),1)=2;
A4(1:size(var4),1)=3;
% A=[A1;A2;A3;A4];
A=[A2;A3];
Y=[var1;var2];
SUBJ=SUBJ_left_ankle_angle(1:30);
spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
spmi      = spm.inference(0.05);
spmi_bs      = spm_bs.inference(0.05);
disp([spmi.p, spmi_bs.p])

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


