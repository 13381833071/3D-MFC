opengl('save', 'software')% %% 一、以二进制按字节读取数据
% profile on
fp = fopen('C:\Users\zzs\Desktop\文章\chenhao\平底鞋\MU JU_01_鞋子 4_001.stl','rb');
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

%% 转换矩阵用法一6个点求转换矩阵err:0.3864,rmse:0.2538,mfc:115.5822,toe_off:74.0833
Data = xlsread("C:\Users\zzs\Desktop\文章\chenhao\最新标记点CT到步态实验室每一帧的转换矩阵\zhangxingyuF_transMAT_three_6_f2.xlsx");%帧之间的转换矩阵
Data2 = xlsread("C:\Users\zzs\Desktop\文章\chenhao\最新标记点CT到步态实验室每一帧的转换矩阵\zhangxingyuF_transMAT_three_6.xlsx");%帧之间的转换矩阵
% Data=table2array(Data);
% Data2=table2array(Data2);
%% 转换矩阵用法一3个点求转换矩阵err:0.0425,rmse:0.1190
% Data = xlsread("C:\Users\zzs\Desktop\chenhao\最新标记点CT到步态实验室每一帧的转换矩阵\chenhao_transMAT_three_3_f2.xlsx");%帧之间的转换矩阵
% Data2 = xlsread("C:\Users\zzs\Desktop\chenhao\最新标记点CT到步态实验室每一帧的转换矩阵\chenhao_transMAT_three.xlsx");%帧之间的转换矩阵
%% 转换矩阵用法二3个点求转换矩阵
% Data = xlsread("C:\Users\zzs\Desktop\chenhao\最新标记点CT到步态实验室每一帧的转换矩阵\chenhao_transMAT_three.xlsx");%帧之间的转换矩阵
% Data = load("C:\Users\zzs\Desktop\chenhao\标记点CT到步态实验室每一帧的转换矩阵\qianchengF_transMAT_three.txt");%帧之间的转换矩阵
Z=[];
Y=[];
aa=ones(size(v,1),1);

gait_data=load('C:\Users\zzs\Desktop\文章\chenhao\10分钟帧数据仅步态数据\zhangxingyu_02.csv');
z6=gait_data(:,18);
dt=0.01;
[pks,locs] = findpeaks(-z6(1:end),'MinPeakDistance',80);
% plot(z6(1:2000))

mfc_loc=[];
mfc=[];
mfc1=[];
time_loc=[];
time=[];
s=[];
S=[];
index=zeros(1,1);
INDEX=[];
toeoff=[];
toeoff_loc=[];

for i=1:size(pks)-1
    for m=locs(i):locs(i+1)+5
        %% 转换矩阵用法一
        %%          第一帧应用CT到VICON应用之间得转换矩阵
        %         if m==locs(i)
        %             A=Data2(1+4*(m-1):4+4*(m-1),:);
        %             v1=[v aa];%为了和转换矩阵相乘将顶点矩阵加一列1，数据格式为143531*4，并转置为4*14353
        %             v11=A*(v1.');
        %             v2=v11.';
        %             Z=[Z,v2(:,3)];
        %         else
        %             %            之后的转换矩阵：每两VICON帧数据之间的转换矩阵
        %             A=Data(1+4*(m-2):4+4*(m-2),:);% 每一个转换矩阵四行四列，每一个循环取一个转换矩阵
        %             v11=A*(v2.');
        %             v2=v11.';
        %             Z=[Z,v2(:,3)];
        %
        %
        %         end
        %% 转换矩阵用法二 只用CT到VICON求转换矩阵实用三个点求转换矩阵err:2.5192 rmse:0,9164，6个点误差反而大
        A=Data2(1+4*(m-1):4+4*(m-1),:);% 每一个转换矩阵四行四列，每一个循环取一个转换矩阵
        v1=[v aa];%为了和转换矩阵相乘将顶点矩阵加一列1，数据格式为143531*4，并转置为4*14353
        v11=A*(v1.');
        v2=v11.';
        Z=[Z,v2(:,3)];
        Y=[Y,v2(:,2)];
    end
    for j=1:size(Z,1)
        [pks_loc,locs_loc]=findpeaks(-Z(j,:),"MinPeakDistance",10);
        [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc);

        pks_loc(diff(locs_loc)<4)=[];
        locs_loc(diff(locs_loc)<4)=[];
        %% 需要调参gait_p，与每个受试者的步度、步宽和步长有关的变量
%         gait_para=60;
%         pks_loc(find( locs_loc<gait_para))=[];
%         locs_loc( locs_loc<gait_para)=[];
%         %
%         k=find(-pks_loc == min(-pks_loc));
%         locs_loc=locs_loc(k:end);
%         pks_loc=pks_loc(k:end);
        [ss,p]=max(-diff(Y(j,:))./10);
        [ss2,p2]=max(diff(Z(j,1:p))./10);

        if j==1
            mfc_loc=Z(j,p);
            index=j;
            time_loc=p;
            s=ss;
            toeoff_loc=min(-pks_loc);
        end
        if mfc_loc>Z(j,p)
            mfc_loc=min(mfc_loc,Z(j,p));
            index=j;
            time_loc=p;
            s=ss;
            toeoff_loc=min(-pks_loc);
        end
    end

%     figure(index)
%     subplot(3,1,1)
%     plot(Z(index,:))
%     subplot(3,1,2)
%     plot(-diff(Y(index,:))./10);
%     subplot(3,1,3)
%     plot(diff(Z(index,:))./10);

    S=[S;s];
    INDEX=[INDEX;index];
    mfc1=[mfc1;mfc_loc-abs(toeoff_loc)];
    mfc=[mfc;mfc_loc-57];
    toeoff=[toeoff;toeoff_loc];
    time=[time;time_loc];
    mfc_loc=[];
    toeoff_loc=[];
    Z=[];
    Y=[];
    time_loc=[];
end

function [ini]=find_inflection_point3(Zz)
Y=Zz;
de1=diff(Y,1);
de2=diff(Y,2);       %拟合曲线的二阶导
de3=diff(Y,3);
h=size(Y,2);
rowX=linspace(0,0,h);
if size(find(de1<0),2)<size(find(de1>0),2)
    for row1=h-3:-1:4
        if (de2(row1)==0 && de3(row1)~=0)||  (de2(row1)*de2(row1+1)<0)
            rowX(row1)=1;
        end
    end
end
ini=find(rowX);
end


function [ini]=find_inflection_point1(Zz)
Y=Zz;
de1=diff(Y,1);
de2=diff(Y,2);       %拟合曲线的二阶导

h=size(Y,2);
rowX=linspace(0,0,h);
if size(find(de1<0),2)<size(find(de1>0),2)
    for row1=h-3:-1:4
        if de2(row1-1)<0&&de2(row1+1)>0
            rowX(row1)=1;
        end
    end
end
ini=find(rowX);
end

function [inin]=find_inflection_point2(Zz)
Y=Zz;
de2=diff(Y,2);       %拟合曲线的二阶导
de3=diff(Y,3);
h=size(Y,2);
rowX=linspace(0,0,h);
for row1=h-3:-1:2
    if(de2(row1)==0 && de3(row1)~=0)|| (de2(row1)*de2(row1+1)<0)
        rowX(row1)=1;
    end
end
inin=find(rowX);
end




%%%%%%%%%%%%%%%%%%%%%%%%
%%消除临近峰值
function [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc)
if size(pks_loc,2)>1
    A=locs_loc;
    B=pks_loc;
    i=1;
    while i<length(A)
        if (A(i+1)-A(i))<4
            A(i+1) = [];
            B(i+1) = [];
        else
            i = i + 1;
        end
    end

    % for k=1:size(pks_loc,2)-1
    %     for l=k+1:size(pks_loc,2)-1
    %         if(find((abs(pks_loc(l)-pks_loc(k)))<0.05))
    %         pks_loc(l)=[];
    %         locs_loc(l)=[];
    %         end
    %
    %     end
    %
    % end
end
end


function [ini_1]=Eliminate_adjacent_peaks_de2(ini_1)
if size(ini_1,2)>1

    A=ini_1;
    i=1;
    while i<length(A)
        if A(i+1)-A(i+1)<4
            A(i+1) = [];
        else
            i = i + 1;
        end
    end
    % for k=1:size(ini_1,2)-1
    %     for l=k+1:size(ini_1,2)-1
    %         if(find((abs(ini_1(l)-ini_1(k)))<3))
    %         ini_1(l)=[];
    %         locs_loc
    %         end
    %
    %     end
    %
    % end
end
end

