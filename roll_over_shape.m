clc;
clear;
maindir = 'G:\GAIT';
subdir =  dir( maindir );
Gait_data = c3dserver ;
ANGLE_SVA=[];
ANGLE_FHA=[];
ANGLE_SVA_R=[];
ANGLE_FHA_R=[];
for i =19%:length( subdir )
    if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
        continue;
    end
    subdirpath = fullfile( maindir, subdir( i ).name,'*.csv' );
    subdirpath_c3d = fullfile( maindir, subdir( i ).name,'*.c3d' );
    fiels = dir( subdirpath );
    fiels_c3d = dir( subdirpath_c3d );
    mkdir(fullfile( maindir, subdir( i ).name),'Roll_Over_Shape');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape'),'force');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force'),'X');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force'),'Y');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force'),'Z');

    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape'),'moment');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment'),'X');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment'),'Y');
    mkdir(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment'),'Z');

    for j =1 : length( fiels )

        L_force_x=[];
        L_force_y=[];
        L_force_z=[];
        R_force_x=[];
        R_force_y=[];
        R_force_z=[];
        filename2= fullfile( maindir, subdir( i ).name, fiels( j ).name) ;
        filename = strrep(filename2,'.csv','');
        filename1= fullfile( strcat(filename,'.c3d')) ;

        openc3d(Gait_data,1,filename1);
        %         LIAS = get3dtarget(Gait_data, 'LIAS', false) ;
        %         RIAS = get3dtarget(Gait_data, 'RIAS', false) ;
        %         LIPS = get3dtarget(Gait_data, 'LIPS', false) ;
        %         RIPS = get3dtarget(Gait_data, 'RIPS', false) ;
        %
        %         RTH1 = get3dtarget(Gait_data, 'RTH1', false) ;
        %         RTH2 = get3dtarget(Gait_data, 'RTH2', false) ;
        %         RTH3 = get3dtarget(Gait_data, 'RTH3', false) ;
        %         RTH4 = get3dtarget(Gait_data, 'RTH4', false) ;

        RFLE = get3dtarget(Gait_data, 'RFLE', false) ;
        %         RFME = get3dtarget(Gait_data, 'RFME', false) ;

        %         RSHK1 = get3dtarget(Gait_data, 'RSHK1', false) ;
        %         RSHK2 = get3dtarget(Gait_data, 'RSHK2', false) ;
        %         RSHK3 = get3dtarget(Gait_data, 'RSHK3', false) ;
        %         RSHK4 = get3dtarget(Gait_data, 'RSHK4', false) ;

        RFAL = get3dtarget(Gait_data, 'RFAL', false) ;
        %         RTAM = get3dtarget(Gait_data, 'RTAM', false) ;

        RFCC = get3dtarget(Gait_data, 'RFCC', false) ;
        %         R1MH = get3dtarget(Gait_data, 'R1MH', false) ;
        RTOE = get3dtarget(Gait_data, 'RTOE', false) ;
        %         R5MH = get3dtarget(Gait_data, 'R5MH', false) ;

        %         LTH1 = get3dtarget(Gait_data, 'LTH1', false) ;
        %         LTH2 = get3dtarget(Gait_data, 'LTH2', false) ;
        %         LTH3 = get3dtarget(Gait_data, 'LTH3', false) ;
        %         LTH4 = get3dtarget(Gait_data, 'LTH4', false) ;

        LFLE = get3dtarget(Gait_data, 'LFLE', false) ;
        %         LFME = get3dtarget(Gait_data, 'LFME', false) ;

        %         LSHK1 = get3dtarget(Gait_data, 'LSHK1', false) ;
        %         LSHK2 = get3dtarget(Gait_data, 'LSHK2', false) ;
        %         LSHK3 = get3dtarget(Gait_data, 'LSHK3', false) ;
        %         LSHK4 = get3dtarget(Gait_data, 'LSHK4', false) ;

        LFAL = get3dtarget(Gait_data, 'LFAL', false) ;
        %         LTAM = get3dtarget(Gait_data, 'LTAM', false) ;

        LFCC = get3dtarget(Gait_data, 'LFCC', false) ;
        %         L1MH = get3dtarget(Gait_data, 'L1MH', false) ;
        LTOE = get3dtarget(Gait_data, 'LTOE', false) ;
        %         L5MH = get3dtarget(Gait_data, 'L5MH', false) ;

        %         RKneeJC_all = RFME +((RFLE-RFME)/2);                                                        %膝关节中心
        %         RAnkleJC_all = RTAM +((RFAL-RTAM)/2);                                                       %踝关节中心
        %         LKneeJC_all = LFME +((LFLE-LFME)/2);                                                        %膝关节中心
        %         LAnkleJC_all = LTAM +((LFAL-LTAM)/2);                                                       %踝关节中心

        Frame_start=csvread(filename2,13,0,[13 0 13 0]);

        Rheel_strike_time=roundn(csvread(filename2,6,1,[6 1 6 1]),-2);
        Rheel_strike=round((Rheel_strike_time-Frame_start)/0.01+1);

        Rtoe_off_time=roundn(csvread(filename2,8,1,[8 1 8 1]),-2);
        Rtoe_off=round((Rtoe_off_time-Frame_start)/0.01);

        Lheel_strike_time=roundn(csvread(filename2,5,1,[5 1 5 1]),-2);
        Lheel_strike=round((Lheel_strike_time-Frame_start)/0.01+1);

        Ltoe_off_time=roundn(csvread(filename2,7,1,[7 1 7 1]),-2);
        Ltoe_off=round((Ltoe_off_time-Frame_start)/0.01);

        Frame_number=csvread(filename2,0,1,[0 1 0 1]);
        [pks_l,locs_l] = findpeaks(-LFCC(:,3),"MinPeakDistance",60);
        [pks_r,locs_r] = findpeaks(-RFCC(:,3),"MinPeakDistance",60);
   
        L_force_x=(csvread(filename2,Frame_number+17,1,[Frame_number+17 1 2*Frame_number+16 1])./1000).';
        L_force_y=(-csvread(filename2,Frame_number+17,2,[Frame_number+17 2 2*Frame_number+16 2])./1000).';
        L_force_z=(csvread(filename2,Frame_number+17,3,[Frame_number+17 3 2*Frame_number+16 3])./1000).';
        R_force_x=(csvread(filename2,Frame_number+17,13,[Frame_number+17 13 2*Frame_number+16 13])./1000).';
        R_force_y=(-csvread(filename2,Frame_number+17,14,[Frame_number+17 14 2*Frame_number+16 14])./1000).';
        R_force_z=(csvread(filename2,Frame_number+17,15,[Frame_number+17 15 2*Frame_number+16 15])./1000).';
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','X',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_force_x(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','Y',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_force_y(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','Z',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_force_z(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','X',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_force_x(Rheel_strike:Rtoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','Y',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_force_y(Rheel_strike:Rtoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','force','Z',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_force_z(Rheel_strike:Rtoe_off)));

        L_moment_x=(csvread(filename2,Frame_number+17,4,[Frame_number+17 4 2*Frame_number+16 4])./1000).';
        L_moment_y=(-csvread(filename2,Frame_number+17,5,[Frame_number+17 5 2*Frame_number+16 5])./1000).';
        L_moment_z=(csvread(filename2,Frame_number+17,6,[Frame_number+17 6 2*Frame_number+16 6])./1000).';
        R_moment_x=(csvread(filename2,Frame_number+17,16,[Frame_number+17 16 2*Frame_number+16 16])./1000).';
        R_moment_y=(-csvread(filename2,Frame_number+17,17,[Frame_number+17 17 2*Frame_number+16 17])./1000).';
        R_moment_z=(csvread(filename2,Frame_number+17,18,[Frame_number+17 18 2*Frame_number+16 18])./1000).';
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','X',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_moment_x(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','Y',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_moment_y(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','Z',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(L_moment_z(Lheel_strike:Ltoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','X',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_moment_x(Rheel_strike:Rtoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','Y',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_moment_y(Rheel_strike:Rtoe_off)));
        xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','moment','Z',strcat(strrep(fiels( j ).name,'.csv',''),'.xls')),normlity_percent(R_moment_z(Rheel_strike:Rtoe_off)));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%求FHA与SVA角度%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %         if locs_l(end)<=Lheel_strike
        %             locs_l=size(LFCC,1);
        %         end
        %
        %         if locs_r<=Rheel_strike
        %             locs_r(end)=size(RFCC,1);
        %         end
        %         angle_SVA= normlity_percent(atan2((LFLE(Lheel_strike:locs_l(end),3)-LFAL(Lheel_strike:locs_l(end),3)),(LFLE(Lheel_strike:locs_l(end),2)-LFAL(Lheel_strike:locs_l(end),2))).*180/pi-90);
        %         angle_FHA= normlity_percent(atan2((LFLE(Lheel_strike:locs_l(end),3)-LTOE(Lheel_strike:locs_l(end),3)),(LFLE(Lheel_strike:locs_l(end),2)-LTOE(Lheel_strike:locs_l(end),2))).*180/pi-90);
        %         ANGLE_SVA=[ANGLE_SVA;angle_SVA];
        %         ANGLE_FHA=[ANGLE_FHA;angle_FHA];
        %
        %         angle_SVA_R= normlity_percent(atan2((RFLE(Rheel_strike:locs_r(end),3)-RFAL(Rheel_strike:locs_r(end),3)),(RFLE(Rheel_strike:locs_r(end),2)-RFAL(Rheel_strike:locs_r(end),2))).*180/pi-90);
        %         angle_FHA_R= normlity_percent(atan2((RFLE(Rheel_strike:locs_r(end),3)-RTOE(Rheel_strike:locs_r(end),3)),(RFLE(Rheel_strike:locs_r(end),2)-RTOE(Rheel_strike:locs_r(end),2))).*180/pi-90);
        %         ANGLE_SVA_R=[ANGLE_SVA_R;angle_SVA_R];
        %         ANGLE_FHA_R=[ANGLE_FHA_R;angle_FHA_R];
        %         subplot(211)
        %         plot(ANGLE_SVA_R)
        %         subplot(212)
        %         plot(RFCC(:,3))
        %         subplot(211)
        %         plot(angle_FHA)
        %         subplot(212)
        %         plot(LFCC(:,3))

        %         Lcop_x=csvread(filename2,Frame_number+17,8,[Frame_number+17 8 2*Frame_number+16 8]);
        %         Rcop_x=csvread(filename2,Frame_number+17,20,[Frame_number+17 20 2*Frame_number+16 20]);
        %         [ RROLL_OVER_X_F,RROLL_OVER_Y_F] = create_ROLL_OVER_F(RFCC,RTOE,RAnkleJC_all,Rcop_x,Rheel_strike,Rtoe_off);
        %
        %         [ RROLL_OVER_X_AF,RROLL_OVER_Y_AF] = create_ROLL_OVER_AF(RFCC,RTOE,RAnkleJC_all,RKneeJC_all,Rcop_x,Rheel_strike,Rtoe_off);
        %
        %         [ RROLL_OVER_X_KAF,RROLL_OVER_Y_KAF] = create_ROLL_OVER_KAF(RAnkleJC_all,Rcop_x,Rheel_strike,Rtoe_off, ...
        %             RTH1,RTH2,RTH3,RTH4,RSHK1,RSHK2,RSHK3,RSHK4,LIAS,RIAS,LIPS,RIPS,RFLE,RFME,RFAL,RTAM);
        %
        %         [ LROLL_OVER_X_F,LROLL_OVER_Y_F] = create_ROLL_OVER_F(LFCC,LTOE,LAnkleJC_all,Lcop_x,Lheel_strike,Ltoe_off);
        %
        %         [ LROLL_OVER_X_AF,LROLL_OVER_Y_AF] = create_ROLL_OVER_AF(LFCC,LTOE,LAnkleJC_all,LKneeJC_all,Lcop_x,Lheel_strike,Ltoe_off);
        %
        %         [ LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF] = create_ROLL_OVER_KAF(LAnkleJC_all,Lcop_x,Lheel_strike,Ltoe_off, ...
        %             LTH1,LTH2,LTH3,LTH4,LSHK1,LSHK2,LSHK3,LSHK4,LIAS,RIAS,LIPS,RIPS,LFLE,LFME,LFAL,LTAM);
        %
        %         data1 = [ RROLL_OVER_X_F RROLL_OVER_Y_F RROLL_OVER_X_AF RROLL_OVER_Y_AF RROLL_OVER_X_KAF RROLL_OVER_Y_KAF];
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape',strcat(strrep(fiels( j ).name,'.csv',''),'R','.xls')),data1);
        %
        %         data2 = [LROLL_OVER_X_F LROLL_OVER_Y_F LROLL_OVER_X_AF LROLL_OVER_Y_AF LROLL_OVER_X_KAF LROLL_OVER_Y_KAF];
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),data2);
        %         mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape'),'ANGLE');
        %         mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','ANGLE'),'L_SVA');
        %         mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','ANGLE'),'L_FHA')
        %         mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','ANGLE'),'R_SVA')
        %         mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','ANGLE'),'R_FHA')
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','ANGLE','L_SVA',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),angle_SVA);
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','ANGLE','L_FHA',strcat(strrep(fiels( j ).name,'.csv',''),'L','.xls')),angle_FHA);
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','ANGLE','R_SVA',strcat(strrep(fiels( j ).name,'.csv',''),'R','.xls')),angle_SVA_R);
        %         xlswrite(fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','ANGLE','R_FHA',strcat(strrep(fiels( j ).name,'.csv',''),'R','.xls')),angle_FHA_R);
    end
end

function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'cubic');
end



