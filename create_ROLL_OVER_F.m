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
% figure(1)
circlefit_2(ROLL_OVER_X_F,ROLL_OVER_Y_F);
end