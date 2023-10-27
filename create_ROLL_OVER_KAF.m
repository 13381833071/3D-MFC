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