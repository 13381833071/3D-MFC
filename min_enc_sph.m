opengl('save', 'software')% %% 一、以二进制按字节读取数据
profile on
fp = fopen('C:\Users\zzs\Desktop\chenhao\平底鞋\MU JU_01_marker7 1_001.stl','rb');
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
figure
subplot(2,1,1)
view(3)
% subplot(2,1,1)
hold on
patch('vertices',v,'faces',f,'edgecolor','r',...
    'facecolor','r','facelighting','gouraud')
grid on
xlabel('x(mm)')
ylabel('y(mm)')
zlabel('z(mm)')
title('(a)','FontSize',16);



light
axis equal
hold on

ptCloud = pointCloud(v(:,1:3));
pcwrite(ptCloud, 'test.pcd', 'Encoding', 'ascii'); %将程序中的xyz数据写入pcd文件中
% pc = pcread('test.pcd');
% pcshow(pc); %显示点云


% 加载点云
ptCloud_in = pcread('test.pcd');

% 设置内点到模型的最大距离
maxDistance = 4;

% 执行MSAC球拟合,并提取内点、外点索引
[model,inlierIndices,outlierIndices,meanError] = pcfitsphere(ptCloud_in,maxDistance);

% 提取拟合球面点云
cloud_sphere = select(ptCloud_in,inlierIndices);

% 提取外点点云
cloud_outlier = select(ptCloud_in,outlierIndices);

figure;
subplot(2,2,1)
pcshow(ptCloud_in.Location,[0 0 0],"BackgroundColor",'w');
% title('包含球面的点云','FontWeight','bold')
legend('包含球面的点云','FontWeight','bold') 
legend('FontName','宋体','FontSize',28,'FontWeight','bold');

xlabel('X(m)','FontWeight','bold');
ylabel('Y(m)','FontWeight','bold');
zlabel('Z(m)','FontWeight','bold');
figure_FontSize=28;

set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',28),'FontSize',figure_FontSize);

title('(a)','FontSize',16);
set(gca, 'FontSize',28)
hold on;

subplot(2,2,2)
pcshow(cloud_sphere.Location,[0 0 0],"BackgroundColor",'w');
% title('球面拟合点云','FontWeight','bold')
legend('球面拟合点云','FontWeight','bold') 
legend('FontName','宋体','FontSize',28,'FontWeight','bold');
xlabel('X(m)','FontWeight','bold');
ylabel('Y(m)','FontWeight','bold');
zlabel('Z(m)','FontWeight','bold');
figure_FontSize=28;

set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',28),'FontSize',figure_FontSize);
title('(b)','FontSize',16);

set(gca, 'FontSize',28)
hold on;

subplot(2,2,3)
pcshow(cloud_outlier.Location,[0 0 0],"BackgroundColor",'w','MarkerSize', 18);
% title('外点点云','FontWeight','bold')
legend('外点点云','FontWeight','bold') 
legend('FontName','宋体','FontSize',28,'FontWeight','bold');
xlabel('X(m)','FontWeight','bold');
ylabel('Y(m)','FontWeight','bold');
zlabel('Z(m)','FontWeight','bold');
figure_FontSize=28;

set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',28),'FontSize',figure_FontSize);
title('(c)','FontSize',16);

set(gca, 'FontSize',28)
hold on;

subplot(2,2,4)

hold on

pcshowpair(cloud_sphere,cloud_outlier,"BackgroundColor",'w')
% title('球面拟合点云、外点云比较','FontWeight','bold')
xlabel('X(m)','FontWeight','bold');
ylabel('Y(m)','FontWeight','bold');
zlabel('Z(m)','FontWeight','bold');
figure_FontSize=28;

set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',28),'FontSize',figure_FontSize);
legend('球面拟合点云','外点云比较','FontWeight','bold') 
legend('FontName','宋体','FontSize',28,'FontWeight','bold');
title('(d)','FontSize',16);
set(gca, 'FontSize',28)



