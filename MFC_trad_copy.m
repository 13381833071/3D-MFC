opengl('save', 'software')% %% 一、以二进制按字节读取数据
% profile on
fp = fopen('C:\Users\zzs\Desktop\文章\chenhao\摇椅鞋\shoe3.stl','rb');
src = fread(fp,'uint8=>uint8');
fclose(fp);

%% 二、提取有效信息
% 提取数据长度信息（四字节无符号整形）
len = typecast(src(81:84),'uint32');

% 提取三角片信息（[48有效字节+2填充字节]*len）
data = reshape(src(85:end),[50,len]);
data(end-1:end,:) = [];

% 类型转换(float*12*len)
dataf = typecast(data(:),'single');
dataf = reshape(dataf,[12,len]);

%% 三、获取v、f、n
% 获取v,f,n（注意MATLAB是列优先的，所以必须按下列方式写）
n = dataf(1:3,:)';
v = reshape(dataf(4:end,:),[3,len*3])';
f = reshape((1:len*3)',[3,len])';

% 去除重复顶点
[v, ~, indexn] =  unique(v, 'rows');
f = indexn(f);

Z=[];

gait_data=load('C:\Users\zzs\Desktop\文章\chenhao\10分钟帧数据仅步态数据\chenhao_01.csv');
z6=gait_data(:,18);
yy2=gait_data(:,2);
[pks,locs] = findpeaks(-z6,'MinPeakDistance',80);

plot(0.01:0.01:1.26,gait_data(locs(2):locs(2+1),3)-68.5,'k','LineWidth',1.5)
figure_FontSize=9;
% ylim([0 160])
set(gca, 'Fontname', '微软雅黑', 'Fontsize', 8);
set(gca, 'Box', 'off','FontWeight','bold');
set(gca,'linewidth',1.5); %坐标 线粗0.5磅
xlabel('时间(s)','Fontname', '微软雅黑', 'Fontsize', 9,'FontWeight','bold');
ylabel('足部离地间隙(mm)', 'Fontname',  '微软雅黑', 'Fontsize', 9,'FontWeight','bold');%,'position',[-30 100]
set(get(gca,'YLabel'),'FontSize',8,'Vertical','middle');
% ylim([0 250])
% xlim([0 1.266])
% set(findobj('FontSize',8),'Fontname', '微软雅黑','FontSize',figure_FontSize);
% legend('P3标记点原始足部离地间隙','3D-MFC方法重建足部离地间隙','二维几何方法重建足部离地间隙','Fontname', '微软雅黑', 'Fontsize', 8,'LineWidth',1.5,'FontWeight','bold') ;



%% 摇摆鞋
P1=[1.2137 0.2601 -395.9976];
P2=[-46.6694 10.9509 -443.1452];
P3=[-60.4167 18.8000 -480.1134];
P4=[-63.5075 14.9190 -562.4350];
P5=[-60.6833 13.1566 -618.3038];
P6=[-14.4277 -0.5241 -681.9155];
A=[P1,P2,P3,P4,P5,P6];
point_toe=[1.2137 0.2601 -395.9976];
point_h=[-60.4167 18.8000 -480.1134];
d1=pdist([point_toe;point_h],'euclidean');
point_ptp=P2;
d2=pdist([point_h;point_ptp],'euclidean');
d3=pdist([point_toe;point_ptp],'euclidean');
Z=[];
X=[];

for i=1:size(gait_data,1)-1
    pos1 = (d1.^2+d3.^2-d2.^2)./(2.*d1.*d3);    %//求出余弦值
    angle1 = acos(pos1);         %//余弦值装换为弧度值
    realangle1 =angle1*180/pi;   %//弧度值转换为角度值
    Y1=gait_data(i,3);
    Y2=gait_data(i,9);
    X1=gait_data(i,2);
    X2=gait_data(i,8);
    angle2=atan((Y2-Y1)./(X2-X1));
    realangle2 =angle2.*180./pi;   %//弧度值转换为角度值
    d=d3.*sind(realangle1-realangle2);
    d_x=d3.*cosd(realangle1-realangle2);
    y=Y1-(d);
    x=X1-(d_x);
    Z=[Z,y];
    X=[X,x];
end
Y=Z;



