Data = xlsread("C:\Users\zzs\Desktop\HBone.xlsx");%帧之间的转换矩阵
R1=[];
R2=[];
R3=[];
for m=1:size(Data,1)/4
    R= Data(1+4*(m-1):4+4*(m-1)-1,1:3);
    [r1,r2,r3]=dcm2angle(R,'XYZ');
    R1=[R1;r1/180*pi];
    R2=[R2;r2/180*pi];
    R3=[R3;r3/180*pi];

    t1=r2eul_z_y_x(R);

end
angle_xyz=[R1,R2,R3];

function t1=r2eul_z_y_x(R)
 
%R为3by3旋转矩阵
 
r11=R(1,1);r12=R(1,2);r13=R(1,3);
r21=R(2,1);r22=R(2,2);r23=R(2,3);
r31=R(3,1);r32=R(3,2);r33=R(3,3);
 
%解方程组后得以下
t1 = [-atan2(-r21, r11) -atan2(r31, sqrt(r32 ^ 2 + r33 ^ 2)) -atan2(-r32, r33);];
 
t1=t1*180/pi;
end
