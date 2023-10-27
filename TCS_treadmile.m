clc;
clear;
maindir = 'G:\GAIT';
subdir =  dir( maindir );
Gait_data = c3dserver ;

for i = 4:length( subdir )  %3,12,13
    if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )    % 如果不是目录跳过
        continue;
    end
    subdirpath_c3d = fullfile( maindir, subdir( i ).name,'treadmile_data','*.c3d' );
    fiels_c3d = dir( subdirpath_c3d );
    for j = 1 : length( fiels_c3d )
        LTOE_all = [];
        TCS_ankle = [];
        TCS_knee = [];
        TCS_hip = [];
        TCS_sva = [];
        filename= fullfile( maindir, subdir( i ).name,'treadmile_data',fiels_c3d( j ).name) ;
        openc3d(Gait_data,1,filename);
        RFLE = get3dtarget(Gait_data, 'RFLE', false) ;
        RFAL = get3dtarget(Gait_data, 'RFAL', false) ;
        RFCC = get3dtarget(Gait_data, 'RFCC', false) ;
        RTOE = get3dtarget(Gait_data, 'RTOE', false) ;
        LFLE = get3dtarget(Gait_data, 'LFLE', false) ;
        LFAL = get3dtarget(Gait_data, 'LFAL', false) ;
        LFCC = get3dtarget(Gait_data, 'LFCC', false) ;
        LTOE = get3dtarget(Gait_data, 'LTOE', false) ;
        [pks_l,locs_l] = findpeaks(-LFCC(:,3),"MinPeakDistance",100);
        [pks_r,locs_r] = findpeaks(-RFCC(:,3),"MinPeakDistance",100);
        LIAS = get3dtarget(Gait_data, 'LIAS', false) ;
        RIAS = get3dtarget(Gait_data, 'RIAS', false) ;
        LIPS = get3dtarget(Gait_data, 'LIPS', false) ;
        RIPS = get3dtarget(Gait_data, 'RIPS', false) ;

        RTH1 = get3dtarget(Gait_data, 'RTH1', false) ;
        RTH2 = get3dtarget(Gait_data, 'RTH2', false) ;
        RTH3 = get3dtarget(Gait_data, 'RTH3', false) ;
        RTH4 = get3dtarget(Gait_data, 'RTH4', false) ;

        RFLE = get3dtarget(Gait_data, 'RFLE', false) ;
        RFME = get3dtarget(Gait_data, 'RFME', false) ;

        RSHK1 = get3dtarget(Gait_data, 'RSHK1', false) ;
        RSHK2 = get3dtarget(Gait_data, 'RSHK2', false) ;
        RSHK3 = get3dtarget(Gait_data, 'RSHK3', false) ;
        RSHK4 = get3dtarget(Gait_data, 'RSHK4', false) ;

        RFAL = get3dtarget(Gait_data, 'RFAL', false) ;
        RTAM = get3dtarget(Gait_data, 'RTAM', false) ;

        RFCC = get3dtarget(Gait_data, 'RFCC', false) ;
        R1MH = get3dtarget(Gait_data, 'R1MH', false) ;
        RTOE = get3dtarget(Gait_data, 'RTOE', false) ;
        R5MH = get3dtarget(Gait_data, 'R5MH', false) ;

        LTH1 = get3dtarget(Gait_data, 'LTH1', false) ;
        LTH2 = get3dtarget(Gait_data, 'LTH2', false) ;
        LTH3 = get3dtarget(Gait_data, 'LTH3', false) ;
        LTH4 = get3dtarget(Gait_data, 'LTH4', false) ;

        LFLE = get3dtarget(Gait_data, 'LFLE', false) ;
        LFME = get3dtarget(Gait_data, 'LFME', false) ;

        LSHK1 = get3dtarget(Gait_data, 'LSHK1', false) ;
        LSHK2 = get3dtarget(Gait_data, 'LSHK2', false) ;
        LSHK3 = get3dtarget(Gait_data, 'LSHK3', false) ;
        LSHK4 = get3dtarget(Gait_data, 'LSHK4', false) ;

        LFAL = get3dtarget(Gait_data, 'LFAL', false) ;
        LTAM = get3dtarget(Gait_data, 'LTAM', false) ;

        LFCC = get3dtarget(Gait_data, 'LFCC', false) ;
        L1MH = get3dtarget(Gait_data, 'L1MH', false) ;
        LTOE = get3dtarget(Gait_data, 'LTOE', false) ;
        L5MH = get3dtarget(Gait_data, 'L5MH', false) ;

        RKneeJC_all = RFME +((RFLE-RFME)/2);
        RAnkleJC_all = RTAM +((RFAL-RTAM)/2);
        LKneeJC_all = LFME +((LFLE-LFME)/2);
        LAnkleJC_all = LTAM +((LFAL-LTAM)/2);

        Frame_start=csvread(filename,13,0,[13 0 13 0]);

        Rheel_strike_time=roundn(csvread(filename,6,1,[6 1 6 1]),-2);
        Rheel_strike=round((Rheel_strike_time-Frame_start)/0.01+1);

        Rtoe_off_time=roundn(csvread(filename,8,1,[8 1 8 1]),-2);
        Rtoe_off=round((Rtoe_off_time-Frame_start)/0.01);

        Lheel_strike_time=roundn(csvread(filename,5,1,[5 1 5 1]),-2);
        Lheel_strike=round((Lheel_strike_time-Frame_start)/0.01+1);

        Ltoe_off_time=roundn(csvread(filename,7,1,[7 1 7 1]),-2);
        Ltoe_off=round((Ltoe_off_time-Frame_start)/0.01);

        Frame_number=csvread(filename,0,1,[0 1 0 1]);
        [pks_l,locs_l] = findpeaks(-LFCC(:,3),"MinPeakDistance",60);
        [pks_r,locs_r] = findpeaks(-RFCC(:,3),"MinPeakDistance",60);
        if locs_l(end)<=Lheel_strike
            locs_l=size(LFCC,1);
        end

        if locs_r<=Rheel_strike
            locs_r(end)=size(RFCC,1);
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%画踝关节对脚趾间隙的影响图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        d_knee_ankle=pdist([LAnkleJC_all(Ltoe_off,2:3);LKneeJC_all(Ltoe_off,2:3)],'euclidean');
        d_toe_ankle=pdist([LAnkleJC_all(Ltoe_off,2:3);LTOE(Ltoe_off,2:3)],'euclidean');
        d_toe_knee=pdist([LKneeJC_all(Ltoe_off,2:3);LTOE(Ltoe_off,2:3)],'euclidean');
        pos_knee_ankle_toe = (d_knee_ankle^2+d_toe_ankle^2-d_toe_knee^2)/(2*d_knee_ankle*d_toe_ankle);
        angle_knee_ankle_toe = acos(pos_knee_ankle_toe);
        realangle_knee_ankle_toe = angle_knee_ankle_toe*180/pi;

        d_heel_ankle=pdist([LAnkleJC_all(Ltoe_off,2:3);LFCC(Ltoe_off,2:3)],'euclidean');
        d_toe_heel=pdist([LFCC(Ltoe_off,2:3);LTOE(Ltoe_off,2:3)],'euclidean');
        pos_ankle_toe_heel = (d_toe_ankle^2+d_toe_heel^2-d_heel_ankle^2)/(2*d_toe_heel*d_toe_ankle);
        angle_ankle_toe_heel = acos(pos_ankle_toe_heel);
        realangle_ankle_toe_heel = angle_ankle_toe_heel*180/pi;
        CONSTANT=realangle_knee_ankle_toe-realangle_ankle_toe_heel-90;
        % %        FHA=CONSTANT+SVA;
        LTOE_all = normlity_percent2((LTOE(Ltoe_off:locs_l(end),3)));
        TCS_ankle = normlity_percent2(-(LTOE(Ltoe_off:locs_l(end),2)-LAnkleJC_all(Ltoe_off:locs_l(end),2))./57) ;
        TCS_knee = normlity_percent2((LTOE(Ltoe_off:locs_l(end),2)-LKneeJC_all(Ltoe_off:locs_l(end),2))./57);
        TCS_hip = normlity_percent2(-(LTOE(Ltoe_off:locs_l(end),2)-LIAS(Ltoe_off:locs_l(end),2))./57);
        TCS_sva = normlity_percent2(-(LTOE(Ltoe_off:locs_l(end),3)-LAnkleJC_all(Ltoe_off:locs_l(end),3))./57);

        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data'),'TCS');
        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data','TCS'),'LTOE_all');
        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data','TCS'),'TCS_ankle')
        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data','TCS'),'TCS_knee')
        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data','TCS'),'TCS_hip')
        mkdir(fullfile( maindir, subdir( i ).name ,'treadmile_data','TCS'),'TCS_sva')
        xlswrite(fullfile( maindir, subdir( i ).name,'treadmile_data','TCS','LTOE_all',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),LTOE_all);
        xlswrite(fullfile( maindir, subdir( i ).name,'treadmile_data','TCS','TCS_ankle',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),TCS_ankle);
        xlswrite(fullfile( maindir, subdir( i ).name,'treadmile_data','TCS','TCS_knee',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),TCS_knee);
        xlswrite(fullfile( maindir, subdir( i ).name,'treadmile_data','TCS','TCS_hip',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),TCS_hip);
        xlswrite(fullfile( maindir, subdir( i ).name,'treadmile_data','TCS','TCS_sva',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),TCS_sva);

    end
end

function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end



