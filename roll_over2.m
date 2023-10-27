% maindir = 'G:\GAIT\zhangxingyu'; processed =  java.util.HashSet;
% 
% while true
% 	while true
% 	    files  = dir( maindir );
% % 	    #processing需要包含待处理文件的名称，所以用map
% 	    processing =  java.util.HashMap;
%         index = 1;
% 	    for i = 1 : length( files )
% 	        cur = files( i ).name;
% % 	       #已经处理过了，所以跳过
% 	        if(~processed.contains(cur))
% 	            processing.put(index, cur); index = index + 1;
% 	        end
% 	    end
% 	    
% 	    if(processing.isEmpty())
% 	        continue;
% 	    else
% 	        disp('start processing'); break;
% 	    end
% 	end
% 
% %    # 对这个文件名为filepath的处理
%     for j = 1 : processing.size()
%         filename = processing.get(j); filepath = fullfile( maindir,filename); 
%         processed.add(files( i ).name);
% %         #处理步骤
%         ...
%     end
% end


%%导入.c3d步态数据
filename1='G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.c3d';
filename2='G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv';
Gait_data = c3dserver ;
openc3d(Gait_data,1,'G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.c3d');

LIAS= get3dtarget(Gait_data, 'LIAS', false) ;
RIAS = get3dtarget(Gait_data, 'RIAS', false) ;
LIPS= get3dtarget(Gait_data, 'LIPS', false) ;
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

RKneeJC_all = RFME +((RFLE-RFME)/2);                                                        %膝关节中心
RAnkleJC_all = RTAM +((RFAL-RTAM)/2);                                                       %踝关节中心
LKneeJC_all = LFME +((LFLE-LFME)/2);                                                        %膝关节中心
LAnkleJC_all = LTAM +((LFAL-LTAM)/2);                                                       %踝关节中心

Frame_start=csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',13,0,[13 0 13 0]);

Rheel_strike_time=roundn(csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',6,1,[6 1 6 1]),-2);
Rheel_strike=(Rheel_strike_time-Frame_start)/0.01+1;

Rtoe_off_time=roundn(csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',8,1,[8 1 8 1]),-2);
Rtoe_off=(Rtoe_off_time-Frame_start)/0.01;

Lheel_strike_time=roundn(csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',5,1,[5 1 5 1]),-2);
Lheel_strike=(Lheel_strike_time-Frame_start)/0.01+1;

Ltoe_off_time=roundn(csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',7,1,[7 1 7 1]),-2);
Ltoe_off=(Ltoe_off_time-Frame_start)/0.01;

Frame_number=csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',0,1,[0 1 0 1]);

Lcop_x=csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',Frame_number+17,8,[Frame_number+17 8 2*Frame_number+16 8]);
Rcop_x=csvread('G:\GAIT\zhangxingyu\01ZHANGXINGYU normal 01.csv',Frame_number+17,20,[Frame_number+17 20 2*Frame_number+16 20]);

%[ RKNEE_ANGLE] = Calculate_Joint_Angle(LIAS,RIAS,LIPS,RIPS,RTH1,RTH2,RTH3,RTH4,RFLE,RFME,RSHK1,RSHK2,RSHK3,RSHK4,RFAL,RTAM);

[ RROLL_OVER_X_F,RROLL_OVER_Y_F] = create_ROLL_OVER_F(RFCC,RTOE,RAnkleJC_all,Rcop_x,Rheel_strike,Rtoe_off);

[ RROLL_OVER_X_AF,RROLL_OVER_Y_AF] = create_ROLL_OVER_AF(RFCC,RTOE,RAnkleJC_all,RKneeJC_all,Rcop_x,Rheel_strike,Rtoe_off);

[ RROLL_OVER_X_KAF,RROLL_OVER_Y_KAF] = create_ROLL_OVER_KAF(RAnkleJC_all,Rcop_x,Rheel_strike,Rtoe_off, ...
    RTH1,RTH2,RTH3,RTH4,RSHK1,RSHK2,RSHK3,RSHK4,LIAS,RIAS,LIPS,RIPS,RFLE,RFME,RFAL,RTAM);


% mkdir('G:\GAIT\zhangxingyu','Roll_Over_Shape'); %% 在指定的文件路径下以变量名为名字创建新的文件夹
data = [ RROLL_OVER_X_F RROLL_OVER_Y_F RROLL_OVER_X_AF RROLL_OVER_Y_AF RROLL_OVER_X_KAF RROLL_OVER_Y_KAF];
xlswrite('G:\GAIT\zhangxingyu\Roll_Over_Shape\01ZHANGXINGYU normal 01.xls',data);

% [ LKNEE_ANGLE] = Calculate_Joint_Angle(LIAS,RIAS,LIPS,RIPS,LTH1,LTH2,LTH3,LTH4,LFLE,LFME,LSHK1,LSHK2,LSHK3,LSHK4,LFAL,LTAM);
[ LROLL_OVER_X_F,LROLL_OVER_Y_F] = create_ROLL_OVER_F(LFCC,LTOE,LAnkleJC_all,Lcop_x,Lheel_strike,Ltoe_off);

[ LROLL_OVER_X_AF,LROLL_OVER_Y_AF] = create_ROLL_OVER_AF(LFCC,LTOE,LAnkleJC_all,LKneeJC_all,Lcop_x,Lheel_strike,Ltoe_off);

[ LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF] = create_ROLL_OVER_KAF(LAnkleJC_all,Lcop_x,Lheel_strike,Ltoe_off, ...
    LTH1,LTH2,LTH3,LTH4,LSHK1,LSHK2,LSHK3,LSHK4,LIAS,RIAS,LIPS,RIPS,LFLE,LFME,LRFAL,LTAM);

function [ KNEE_ANGLE] = Calculate_Joint_Angle(LIAS,RIAS,LIPS,RIPS,RTH1,RTH2,RTH3,RTH4,RFLE,RFME,RSHK1,RSHK2,RSHK3,RSHK4,RFAL,RTAM)
KNEE_ANGLE=[];
for frame=1:size(RTH1,1)
    %% 3. 大腿的TM矩阵
    [ithigh,jthigh,kthigh,originthigh] = create_rhcs(RTH1(frame,:),RTH2(frame,:),RTH3(frame,:),RTH4(frame,:)); %为右边大腿创建右手坐标系
    thigh1 = [ithigh' jthigh' kthigh'];
    det(thigh1);    %结果=1 就是right handed
    TMthigh = eye(4);
    TMthigh(1:3,1:3) = thigh1;
    TMthigh(1:3,4) = originthigh';

    %% 小腿的TM
    [ishank,jshank,kshank,originshank] = create_rhcs(RSHK1(frame,:),RSHK2(frame,:),RSHK3(frame,:),RSHK4(frame,:)); %同上
    shank1 = [ishank' jshank' kshank'];
    det(shank1);
    TMshank = eye(4);
    TMshank(1:3,1:3) = shank1;
    TMshank(1:3,4) = originshank';

    %%在计算AM，先确定关节中心。
    %% 确定解剖关节中心
    %% 根据Robertson Equations 2.11 - 2.16计算骨盆相关数据
    originpelvis = 0.5*(RIAS(frame,:)+LIAS(frame,:));        %(原点在RASIS and LASIS中间)
    i = RIAS(frame,:) - originpelvis;                %(建立骨盆x-component，单位向量)
    v = originpelvis - 0.5 * (RIPS(frame,:)+LIPS(frame,:));  %(从RPSIS and LPSIS的中点建立一个向量指向原点)
    k = cross(i,v);                          %(k是垂直于包含i and v的平面的一个单位向量)
    j = cross(k,i);                          %(确定最后一个unit)
    ipelv = i/norm(i);                       %i unit vector of pelv
    jpelv = j/norm(j);                       %j unit vector of pelv
    kpelv = k/norm(k);                       %k unit vector of pelv
    pelvis1 = [ipelv' jpelv' kpelv'];        % equat 2.16
    det(pelvis1(:,1:3))                            %结果=1 就是right handed

    %Pelvis 骨盆
    TApelvis = eye(4);
    TApelvis(1:3,1:3) = pelvis1(1:3,1:3);
    TApelvis(1:3,4) = originpelvis';
    % showcs(TApelvis,50);
    RLK=RFLE(frame,:);
    RMK=RFME(frame,:);
    RLA=RFAL(frame,:);
    RMA=RTAM(frame,:);
    % 根据Robertson Equations 2.17-2.23计算大腿相关
    HIPnorm = norm(RIAS(frame,:)-LIAS(frame,:));  %取模厂
    PHIP = [0.36*HIPnorm -0.19*HIPnorm -0.30*HIPnorm];
    HipJC = pelvis1*PHIP'+originpelvis';                     %O(RTHIGH)=P(RHIP)=R'(PELVIS)*P'(RHIP)+O(PELVIS)
    KneeJC = RMK +((RLK-RMK)/2);                                                        %膝关节中心
    AnkleJC = RMA +((RLA-RMA)/2);                                                       %踝关节中心

    %% 建立解剖关键点坐标系, where X= superiorly, Y = anteriorly, Z= medially
    %Thigh 大腿
    k = (HipJC' - KneeJC)/norm(HipJC' - KneeJC);
    v = (RLK - RMK)/ norm(RLK - RMK);
    j = cross(k,v);
    i = cross(j,k);
    Rthigh = [i' j' k'];
    det(Rthigh);                                     %结果=1 就是right handed
    AMthigh = eye(4);
    AMthigh(1:3,1:3) = Rthigh;
    AMthigh(1:3,4) = HipJC;

    %Shank 小腿
    k = (KneeJC - AnkleJC)/norm(KneeJC - AnkleJC);
    v = (RLK - RMK)/norm(RLK - RMK);
    j = cross(k,v);
    i = cross(j,k);
    Rshank = [i' j' k'];
    det(Rshank)                                      %结果=1 就是right handed
    AMshank = eye(4);
    AMshank(1:3,1:3) = Rshank;
    AMshank(1:3,4) = KneeJC;
    % showcs(AMthigh,50);                             %显示坐标轴
    % showcs(AMshank,50);
    hold off;                                       %有一种爱叫做放手，放开你的figure

    %% 计算解剖点坐标系和cluster建立的坐标系间的transformation matrices (TM)
    [TMTAthigh]=(inv(TMthigh))*AMthigh;
    [TMTAshank]=(inv(TMshank))*AMshank;

    %% 计算膝关节的三维角度是什么

    %% Clusters

    %% 同上
    [ithigh,jthigh,kthigh, originthigh]= create_rhcs(RTH1(frame,:),RTH2(frame,:),RTH3(frame,:),RTH4(frame,:));
    [ishank,jshank,kshank, originshank]= create_rhcs(RSHK1(frame,:),RSHK2(frame,:),RSHK3(frame,:),RSHK4(frame,:));

    thigh1= [ithigh' jthigh' kthigh'];
    det(thigh1)
    shank1= [ishank' jshank' kshank'];
    det(shank1)
    %% 4x4 matrices
    %Thigh
    TMthigh = eye(4);
    TMthigh(1:3,1:3)=thigh1;
    TMthigh(1:3,4) = originthigh';
    %Shank
    TMshank = eye(4);
    TMshank(1:3,1:3)=shank1;
    TMshank(1:3,4) = originshank';
    %% 用前面计算出来的TM来确定解剖关键点的坐标
    A_thigh2 = TMthigh * TMTAthigh ;
    A_shank2 = TMshank * TMTAshank ;
    %% 计算小腿和大腿cluster的矩阵
    Angles_R2 =inv(A_thigh2(1:3,1:3)) * A_shank2(1:3,1:3);
    %% 提取三维Cardan角度
    alpha2 = atan2(-Angles_R2(3,2),Angles_R2(3,3));
    beta2 = atan2(Angles_R2(3,1),(sqrt(Angles_R2(1,1)^2+Angles_R2(2,1)^2)));
    gamma2 = atan2(-Angles_R2(2,1),Angles_R2(1,1));
    angles2 = [alpha2 beta2 gamma2];
    angles2_d = rad2deg(angles2);                %转换弧度到角度
    KNEE_ANGLE=[KNEE_ANGLE;angles2_d];
end
plot(KNEE_ANGLE(67:150),'r');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算足翻滚形状特性%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ ROLL_OVER_X_F,ROLL_OVER_Y_F] = create_ROLL_OVER_F(RFCC,RTOE,AnkleJC_all,cop_x,heel_strike,toe_off)
heel_x=RFCC(:,2);
heel_z=RFCC(:,3);
toe_x=RTOE(:,2);
toe_z=RTOE(:,3);
ankle_x=AnkleJC_all(:,2);
ankle_z=AnkleJC_all(:,3);

heel=[heel_x heel_z];
toe=[toe_x toe_z];
ankle=[ankle_x ankle_z];
cop_z=zeros(size(cop_x,1),1);
cop=[cop_x cop_z];
ROLL_OVER_X_F=[];
ROLL_OVER_Y_F=[];

for i=heel_strike:toe_off
    d_ankle_cop=pdist([ankle(i,:);cop(i,:)],'euclidean');
    d_ankle_toe=pdist([ankle(i,:);toe(i,:)],'euclidean');
    d_cop_toe=pdist([cop(i,:);toe(i,:)],'euclidean');
    d_heel_cop=pdist([cop(i,:);heel(i,:)],'euclidean');
    d_heel_toe=pdist([toe(i,:);heel(i,:)],'euclidean');

    pos_ankle = (d_ankle_cop^2+d_ankle_toe^2-d_cop_toe^2)/(2*d_ankle_cop*d_ankle_toe);
    angle_ankle = (acos(pos_ankle));
    realangle_ankle = angle_ankle*180/pi;

    pos_toe1 = (d_ankle_toe^2+d_cop_toe^2-d_ankle_cop^2)/(2*d_ankle_toe*d_cop_toe);
    angle_toe1 = (acos(pos_toe1));
    realangle_toe1 = angle_toe1*180/pi;

    pos_toe2 = (d_heel_toe^2+d_cop_toe^2-d_heel_cop^2)/(2*d_heel_toe*d_cop_toe);
    angle_toe2 = (acos(pos_toe2));
    realangle_toe2 = angle_toe2*180/pi;
    %     realangle_shoe=angle_ankle+angle_toe1-angle_toe2;%realangle_ankle+realangle_toe1-realangle_toe2;
    realangle_shoe=realangle_ankle+realangle_toe1-realangle_toe2;

    roll_over_x_shoe=-(d_ankle_cop.*cosd(realangle_shoe));
    roll_over_y_shoe=-d_ankle_cop.*sind(realangle_shoe);
    ROLL_OVER_X_F=[ROLL_OVER_X_F;roll_over_x_shoe];
    ROLL_OVER_Y_F=[ROLL_OVER_Y_F;roll_over_y_shoe];

end
figure(1)
circlefit_2(ROLL_OVER_X_F,ROLL_OVER_Y_F);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算踝足翻滚形状特性%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ ROLL_OVER_X_AF,ROLL_OVER_Y_AF] = create_ROLL_OVER_AF(RFCC,RTOE,AnkleJC_all,KneeJC_all,cop_x,heel_strike,toe_off)
heel_x=RFCC(:,2);
heel_z=RFCC(:,3);
toe_x=RTOE(:,2);
toe_z=RTOE(:,3);
ankle_x=AnkleJC_all(:,2);
ankle_z=AnkleJC_all(:,3);
knee_x=KneeJC_all(:,2);
knee_z=KneeJC_all(:,3);
toe=[toe_x toe_z];
ankle=[ankle_x ankle_z];
cop_z=zeros(size(cop_x,1),1);
cop=[cop_x cop_z];
D=[];
ANGLE1=[];
ANGLE2=[];
ANGLE3=[];
ROLL_OVER_X_AF=[];
ROLL_OVER_Y_AF=[];
SVA=[];
FHA=[];

for i=heel_strike:toe_off
    d=pdist([ankle(i,:);cop(i,:)],'euclidean');
    D=[D;d];
    angle1=(atan((knee_x(i,:)-ankle_x(i,:))./(knee_z(i,:)-ankle_z(i,:))));
    sva=angle1;
    ANGLE1=[ANGLE1;angle1];
    SVA=[SVA;sva];
    fha=-(atan((heel_x(i,:)-toe_x(i,:))./(heel_z(i,:)-toe_z(i,:))));
    FHA=[FHA;fha];

    angle2=(atan((cop_x(i,:)-ankle_x(i,:))./(ankle_z(i,:))));
    ANGLE2=[ANGLE2;angle2];

    angle3=pi/2-angle1-angle2;
    ANGLE3=[ANGLE3;angle3];

    roll_over_x_af=-d.*cos(angle3);
    ROLL_OVER_X_AF=[ROLL_OVER_X_AF;roll_over_x_af];

    roll_over_y_af=-d.*sin(angle3);
    ROLL_OVER_Y_AF=[ROLL_OVER_Y_AF;roll_over_y_af];
end

sva=(atan((knee_x-ankle_x)./(knee_z-ankle_z)));%normal
fha=(atan((heel_x-toe_x)./(heel_z-toe_z)));
figure(2)
circlefit_2(ROLL_OVER_X_AF,ROLL_OVER_Y_AF);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算膝踝足翻滚形状特性%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ ROLL_OVER_X_KAF,ROLL_OVER_Y_KAF] = create_ROLL_OVER_KAF(AnkleJC_all,cop_x,heel_strike,toe_off, ...
    RTH1,RTH2,RTH3,RTH4,RSHK1,RSHK2,RSHK3,RSHK4,LIAS,RIAS,LIPS,RIPS,RFLE,RFME,RFAL,RTAM)
DD=[];
ANGLE11=[];
ANGLE22=[];
ANGLE33=[];
ROLL_OVER_X_KAF=[];
ROLL_OVER_Y_KAF=[];
ankle_x=AnkleJC_all(:,2);
ankle_z=AnkleJC_all(:,3);
ankle=[ankle_x ankle_z];
cop_z=zeros(size(cop_x,1),1);
cop=[cop_x cop_z];
HipJC_all = calculate_HIPjoint_center(RTH1,RTH2,RTH3,RTH4,RSHK1,RSHK2,RSHK3,RSHK4,LIAS,RIAS,LIPS,RIPS,RFLE,RFME,RFAL,RTAM);
hip_x=HipJC_all(:,2);
hip_z=HipJC_all(:,3);
for i=heel_strike:toe_off
    d=pdist([ankle(i,:);cop(i,:)],'euclidean');
    DD=[DD;d];
    angle11=(atan((hip_x(i,:)-ankle_x(i,:))./(hip_z(i,:)-ankle_z(i,:))));
    ANGLE11=[ANGLE11;angle11];
    angle22=(atan((cop_x(i,:)-ankle_x(i,:))./(ankle_z(i,:))));
    ANGLE22=[ANGLE22;angle22];
    angle33=(pi/2-angle11-angle22);
    ANGLE33=[ANGLE33;angle33];
    roll_over_x_KAF=-d.*cos(angle33);
    ROLL_OVER_X_KAF=[ROLL_OVER_X_KAF;roll_over_x_KAF];
    roll_over_y_KAF=-d.*sin(angle33);
    ROLL_OVER_Y_KAF=[ROLL_OVER_Y_KAF;roll_over_y_KAF];
end
figure(3)
circlefit_2(ROLL_OVER_X_KAF,ROLL_OVER_Y_KAF);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%创建局部坐标系%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ishank,jshank,kshank,originshank] = create_rhcs(RTHI1,RTHI2,RTHI3,RTHI4)
originshank = 0.5*(RTHI1+RTHI4);        %(原点在RASIS and LASIS中间)
i = RTHI1 - originshank;                %(建立骨盆x-component，单位向量)
v = originshank - 0.5 * (RTHI2+RTHI3);  %(从RPSIS and LPSIS的中点建立一个向量指向原点)
k = cross(i,v);                          %(k是垂直于包含i and v的平面的一个单位向量)
j = cross(k,i);                          %(确定最后一个unit)
ishank = i/norm(i);                       %i unit vector of pelv
jshank = j/norm(j);                       %j unit vector of pelv
kshank = k/norm(k);                       %k unit vector of pelv
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算髋关节中心%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [HipJC_ALL] = calculate_HIPjoint_center(RTH1,RTH2,RTH3,RTH4,RSHK1,RSHK2,RSHK3,RSHK4,LIAS,RIAS,LIPS,RIPS,RFLE,RFME,RFAL,RTAM)
HipJC_ALL=[];
for frame=1:size(RTH1,1)
    %% 3. 大腿的TM矩阵
    [ithigh,jthigh,kthigh,originthigh] = create_rhcs(RTH1(frame,:),RTH2(frame,:),RTH3(frame,:),RTH4(frame,:)); %为右边大腿创建右手坐标系
    thigh1 = [ithigh' jthigh' kthigh'];
    det(thigh1);    %结果=1 就是right handed
    TMthigh = eye(4);
    TMthigh(1:3,1:3) = thigh1;
    TMthigh(1:3,4) = originthigh';

    %% 小腿的TM
    [ishank,jshank,kshank,originshank] = create_rhcs(RSHK1(frame,:),RSHK2(frame,:),RSHK3(frame,:),RSHK4(frame,:)); %同上
    shank1 = [ishank' jshank' kshank'];
    det(shank1);
    TMshank = eye(4);
    TMshank(1:3,1:3) = shank1;
    TMshank(1:3,4) = originshank';

    %%在计算AM，先确定关节中心。
    %% 确定解剖关节中心
    %% 根据Robertson Equations 2.11 - 2.16计算骨盆相关数据
    originpelvis = 0.5*(RIAS(frame,:)+LIAS(frame,:));        %(原点在RASIS and LASIS中间)
    i = RIAS(frame,:) - originpelvis;                %(建立骨盆x-component，单位向量)
    v = originpelvis - 0.5 * (RIPS(frame,:)+LIPS(frame,:));  %(从RPSIS and LPSIS的中点建立一个向量指向原点)
    k = cross(i,v);                          %(k是垂直于包含i and v的平面的一个单位向量)
    j = cross(k,i);                          %(确定最后一个unit)
    ipelv = i/norm(i);                       %i unit vector of pelv
    jpelv = j/norm(j);                       %j unit vector of pelv
    kpelv = k/norm(k);                       %k unit vector of pelv
    pelvis1 = [ipelv' jpelv' kpelv'];        % equat 2.16
    det(pelvis1(:,1:3))                            %结果=1 就是right handed

    %Pelvis 骨盆
    TApelvis = eye(4);
    TApelvis(1:3,1:3) = pelvis1(1:3,1:3);
    TApelvis(1:3,4) = originpelvis';
    % showcs(TApelvis,50);
    RLK=RFLE(frame,:);
    RMK=RFME(frame,:);
    RLA=RFAL(frame,:);
    RMA=RTAM(frame,:);
    % 根据Robertson Equations 2.17-2.23计算大腿相关
    HIPnorm = norm(RIAS(frame,:)-LIAS(frame,:));  %取模厂
    PHIP = [0.36*HIPnorm -0.19*HIPnorm -0.30*HIPnorm];
    HipJC = pelvis1*PHIP'+originpelvis';
    HipJC_ALL=[HipJC_ALL;HipJC'];%O(RTHIGH)=P(RHIP)=R'(PELVIS)*P'(RHIP)+O(PELVIS)
end
end
