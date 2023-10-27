opengl('save', 'software')% %% 一、以二进制按字节读取数据
% profile on
fp = fopen('C:\Users\zzs\Desktop\chenhao\平底鞋\MU JU_01_鞋子 4_001.stl','rb');
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

gait_data=load('C:\Users\zzs\Desktop\chenhao\10分钟帧数据仅步态数据\zhangxingyu_02.csv');
z6=gait_data(:,18);
[pks,locs] = findpeaks(-z6,'MinPeakDistance',100);

mfc_loc=[];
mfc=[];
mfc1=[];
INDEX=INDEX;

%% 摇摆鞋
% P1=[1.2137 0.2601 -395.9976];
% P2=[-46.6694 10.9509 -443.1452];
% P3=[-60.4167 18.8000 -480.1134];
% P4=[-63.5075 14.9190 -562.4350];
% P5=[-60.6833 13.1566 -618.3038];
% P6=[-14.4277 -0.5241 -681.9155];
% A=[P1,P2,P3,P4,P5,P6];
point_toe=[1.2137 0.2601 -395.9976];
point_h=[-60.4167 18.8000 -480.1134];
d1=pdist([point_toe;point_h],'euclidean');
D1=repmat(d1,size(v,1),1);
D2=[];
D3=[];

toeoff=[];
toeoff_loc=[];
for i=1:size(v,1)
    point_ptp=v(i,:);
    d2=pdist([point_h;point_ptp],'euclidean');
    D2=[D2;d2];
    d3=pdist([point_toe;point_ptp],'euclidean');
    D3=[D3;d3];
end


for i=1:size(pks)-2
    for m=locs(i):locs(i+1)+5

        pos1 = (D1.^2+D3.^2-D2.^2)./(2.*D1.*D3);    %//求出余弦值
        angle1 = acos(pos1);         %//余弦值装换为弧度值
        realangle1 = angle1*180/pi;   %//弧度值转换为角度值

        Y1=gait_data(m,3);
        YY1=repmat(Y1,size(v,1),1);
        X1=gait_data(m,2);
        XX1=repmat(X1,size(v,1),1);

        Y2=gait_data(m,9);
        YY2=repmat(Y2,size(v,1),1);
        X2=gait_data(m,8);
        XX2=repmat(X2,size(v,1),1);
        angle2=atan((YY2-YY1)./(XX2-XX1));
        realangle2 = -angle2.*180./pi;   %//弧度值转换为角度值
        d=d3.*sind(realangle1-realangle2);
        y=YY1-abs(d);

        Z=[Z,y];
    end

    for j=INDEX(i)
        %% 对于轨迹有波动的个体进行平滑处理，并不是所有人都需要
        y=Z(j,:);
        window=5;
        b = (1/window)*ones(1,window);
        a = 1;
        y_smooth_gaussian=smoothdata(y,'gaussian',window);
        Z(j,:)=y_smooth_gaussian;
        figure(2)
        plot(Z(j,:))
        de1=diff(Z(j,:),1);
        de2=diff(Z(j,:),2);       %拟合曲线的二阶导
        [pks_loc,locs_loc]=findpeaks(-Z(j,:),"MinPeakDistance",10);
        [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc);

        pks_loc(diff(locs_loc)<4)=[];
        locs_loc(diff(locs_loc)<4)=[];
        %% 需要调参gait_p，与每个受试者的步度、步宽和步长有关的变量
        gait_para=60;
        pks_loc(find( locs_loc<gait_para))=[];
        locs_loc( locs_loc<gait_para)=[];
        %
        k=find(-pks_loc == min(-pks_loc));
        locs_loc=locs_loc(k:end);
        pks_loc=pks_loc(k:end);
        try
            [pks_loc_p,locs_loc_p]=findpeaks(Z(j,locs_loc(k(end)):end),"MinPeakDistance",10);

        catch
            continue
        end
        [pks_loc_p,locs_loc_p]=Eliminate_adjacent_peaks(pks_loc_p,locs_loc_p);
        locs_loc_p=locs_loc_p+locs_loc(k(end));

        pks_loc_p(diff(locs_loc_p)<4)=[];
        locs_loc_p(diff(locs_loc_p)<4)=[];

        if size(locs_loc,2)==2&&size(locs_loc_p,2)==1&&locs_loc_p<locs_loc(2)
            locs_loc_p(2)=size(Z,2);
            pks_loc_p(2)=Z(j,end);
        end
        locs_loc( find(locs_loc>locs_loc_p(end)))=[];
        pks_loc(find(locs_loc>locs_loc_p(end)))=[];
        if size(locs_loc_p,2)==2 && size(locs_loc,2)==2 && locs_loc(2)>locs_loc_p(1)...
                && locs_loc(2)<locs_loc_p(2) && locs_loc_p(2)>locs_loc(k(end)) && ...
                locs_loc_p(1)>locs_loc(k(end)) && locs_loc_p(2)-locs_loc(2)>0&& ...
                locs_loc_p(1)-locs_loc(1)>0 &&(locs_loc(2)-locs_loc_p(1))>0 ...
                && pks_loc_p(2)>pks_loc_p(1) && -pks_loc(2)>-pks_loc(1)

            mfc_loc=-pks_loc(2);
            toeoff_loc=pks_loc(1);

            inin1=find_inflection_point2(Z(j,locs_loc(1):locs_loc_p(1)))+locs_loc(1)-1;
            inin1(diff(inin1)<4)=[];

            inin2=find_inflection_point2(Z(j,locs_loc_p(1):locs_loc(2)))+locs_loc_p(1)-1;
            inin2(diff(inin2)<4)=[];

            inin3=find_inflection_point2(Z(j,locs_loc(2):locs_loc_p(2)))+locs_loc(2)-1;
            inin3(diff(inin3)<4)=[];

            if size(inin1,2)~=0&&size(inin2,2)~=0&&size(inin3,2)~=0

                if isempty(find(de2(locs_loc(1)-1:inin1(1)-1)<0,1))

                    if  isempty(find(de2(inin1(end)+1:inin2(1)-1)>0,1))

                        if isempty(find(de2(inin2(end)+1:inin3(1)-1)<0,1))

                            if isempty(find(de2(inin3(end)+1:size(de2,2))>0,1))
                                mfc_loc=min(mfc_loc,-pks_loc(2));
                                toeoff_loc=pks_loc(1);
                            end
                        end
                    end
                end
            elseif de2(locs_loc(1))>0&&de2(locs_loc(1)-1)>0&&de2(locs_loc(1)-2)>0 ...
                    &&de2(locs_loc(1)+1)>0&&de2(locs_loc(1)+2)>0 ...
                    &&de2(locs_loc(2))>0&&de2(locs_loc(2)-1)>0&&de2(locs_loc(2)-2)>0 ...
                    &&de2(locs_loc(2)+1)>0&&de2(locs_loc(2)+2)>0 ...
                    &&de2(locs_loc_p(1))<0
                index=j;
                mfc_loc=-pks_loc(2);
                toeoff_loc=locs_loc(2);

            end
        elseif  size(locs_loc,2)==1 &&size(locs_loc_p,2)==1&&locs_loc<locs_loc_p
            in=find_inflection_point1(Z(j,locs_loc(k(end)):locs_loc_p(end)));
            in=Eliminate_adjacent_peaks_de2(in);
            in(diff(in)<4)=[];
            in=in+locs_loc(k(end));
            ini_1=find_inflection_point3(Z(j,locs_loc(k(end)):locs_loc_p(end)));
            ini_1=Eliminate_adjacent_peaks_de2(ini_1);
            ini_1(diff(ini_1)<4)=[];
            ini_1=ini_1++locs_loc(k(end));
            if size(in,2)>0&&(Z(j,in(end))-(-pks_loc))>5&&(in(end)-locs_loc)>10&&(locs_loc_p - in(end))>5&&de2(in(end)+1)>0
                mfc_loc=Z(j,in(end));
                toeoff_loc=pks_loc(1);
            end
            if  size(ini_1,2)==3&&size(find(de2(locs_loc:ini_1(1)-1)<0),2)<size(find(de2(locs_loc:ini_1(1)-1)>0),2)&&size(find(de2(ini_1(1):ini_1(2)-1)<0),2)>size(find(de2(ini_1(1):ini_1(2)-1)>0),2)...
                    &&  size(find(de2(ini_1(2):ini_1(3)-1)<0),2)<size(find(de2(ini_1(2):ini_1(3)-1)>0),2)&&  size(find(de2(ini_1(3):size(de2,2)-1)<0),2)>size(find(de2(ini_1(3):size(de2,2)-1)>0),2)
                mfc_loc=Z(j,ini_1(2));
                toeoff_loc=pks_loc(1);
            end
        end
    end
    mfc=[mfc;mfc_loc-57];
    mfc1=[mfc1;mfc_loc-abs(toeoff_loc)];
    toeoff=[toeoff;toeoff_loc];
    mfc_loc=[];
    toeoff_loc=[];
    Z=[];
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
h=size(de2,2);
rowX=linspace(0,0,h);
for row1=h-1:-1:1
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

end
end
