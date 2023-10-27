 % plot(Z(index,:))
% [Apks_loc_MIN,Alocs_loc_MIN]=findpeaks(-Z(index,:),"MinPeakDistance",10);
% Ain=find_inflection_point(Z(index,:));
opengl('save', 'software')% %% 一、以二进制按字节读取数据
% profile on
fp = fopen('C:\Users\zzs\Desktop\chenhao\摇椅鞋\shoe3.stl','rb');
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
Data = load("C:\Users\zzs\Desktop\chenhao\标记点CT到步态实验室每一帧的转换矩阵\chenhao_transMAT_three.txt");%帧之间的转换矩阵
Z=[];
a=ones(size(v,1),1);
[pks,locs] = findpeaks(-z6(1:59216,1),'MinPeakDistance',100);
% plot(z6(1:2000))
mfc_loc=[];
mfc=[];
index=zeros(1,1);
INDEX=[];
for i=1:size(pks)-1
    for m=locs(i):locs(i+1)+60
       A=Data(1+4*(m-1):4+4*(m-1),:);% 每一个转换矩阵四行四列，每一个循环取一个转换矩阵
          v1=[v a];%为了和转换矩阵相乘将顶点矩阵加一列1，数据格式为143531*4，并转置为4*14353
          v11=A*(v1.');
          v2=v11.';
          Z=[Z,v2(:,3)];
    end
    for j=1:size(Z,1)
%         plot(Z(j,:));
        de1=diff(Z(j,:),1); 
        de2=diff(Z(j,:),2);       %拟合曲线的二阶导
        [pks_loc,locs_loc]=findpeaks(-Z(j,:),"MinPeakDistance",10);
        [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc);
        k=find(-pks_loc == min(-pks_loc));
        [pks_loc_p,locs_loc_p]=findpeaks(Z(j,locs_loc(k(end)):end),"MinPeakDistance",10);
        [pks_loc_p,locs_loc_p]=Eliminate_adjacent_peaks(pks_loc_p,locs_loc_p);
        locs_loc_p=locs_loc_p+locs_loc(k(end));
        if j==1
            if size(locs_loc,2)==1
            mfc_loc=2000;
            else
                if ((-pks_loc(end))-(-pks_loc(1)))>0
                    mfc_loc=-pks_loc(end); 
                else
                    mfc_loc=2000;
                end
            end
        else
            
                if size(locs_loc_p,2)==2 && size(locs_loc,2)==2 && locs_loc(2)>locs_loc_p(1)... 
                    && locs_loc(2)<locs_loc_p(2)&&locs_loc_p(2)>locs_loc(k(end))&&locs_loc_p(1)>locs_loc(k(end)) ...
                    && locs_loc_p(2)-locs_loc(2)>3&&locs_loc_p(1)-locs_loc(1)>3&&(locs_loc(2)-locs_loc_p(1))>5 
%                     &&-pks_loc(2)-(-pks_loc(1))>5
%                     de1(locs_loc(1)+1)>0 &&  de1(locs_loc_p(2)-1)>0&& mfc_loc>-pks_loc(2)
                    if mfc_loc>-pks_loc(2)
                            index=j;
                            mfc_loc=min(mfc_loc,-pks_loc(2));
                    end
     
                end
                    [pks_loc_f,locs_loc_f]=findpeaks(-Z(j,locs_loc(k(end)):locs_loc_p(end)));
                    locs_loc_f=locs_loc_f+locs_loc(k(end));
                if size(locs_loc,2)==1 &&size(locs_loc_p,2)==1&&locs_loc<locs_loc_p 
                    in=find_inflection_point1(Z(j,locs_loc(k(end)):locs_loc_p(end)));
                    in=in+locs_loc(k(end));
                    if size(in,2)>0&&(Z(j,in(end))-(-pks_loc))>5&&(in(end)-locs_loc)>10&&(locs_loc_p - in(end))>5&&de2(in(end)+1)>0
%                     if size(in,2)>0&&(in(end)-locs_loc)>10&&(locs_loc_p - in(end))>5
                        if mfc_loc>Z(j,in(end))
                            index=j;
                            mfc_loc=min(mfc_loc,Z(j,in(end)));
                        end
                   end
                end
        end
      
   end 
        figure(index)
        plot(Z(index,:))
        mfc=[mfc,mfc_loc];
        mfc_loc=[];
        Z=[];
        INDEX=[INDEX,index]

end

function [ini]=find_inflection_point(Zz)
%%Y是上例中拟合的曲线，看客自己操作时切记要两段代码合在一起跑
Y=Zz;
de1=diff(Y,1); 
de2=diff(Y,2);       %拟合曲线的二阶导
% de3=diff(Y,3);       %拟合曲线的三阶导
h=size(Y,2);
rowX=linspace(0,0,h);
for row1=h-3:-1:4
    if de1(row1)>0 && de1(row1-1)>0 && de1(row1+1)>0 && de2(row1-1)<0&& de2(row1-2)<0&&...
        de2(row1-3)<0 && de2(row1)<0&&de2(row1+1)>0&&de2(row1+2)>0&&de2(row1+3)>0
%     if (de2(row1)==0 && de3(row1)~=0)||  (de2(row1)*de2(row1+1)<0)
       rowX(row1)=1;
    end
end
ini=find(rowX);
end


function [ini]=find_inflection_point1(Zz)
Y=Zz;
de1=diff(Y,1); 
de2=diff(Y,2);       %拟合曲线的二阶导
% de3=diff(Y,3);       %拟合曲线的三阶导
h=size(Y,2);
rowX=linspace(0,0,h);
if ~size(find(de1<0),2)
    for row1=h-3:-1:4
        if de1(row1)>0 && de1(row1-1)>0 && de1(row1+1)>0 && de2(row1-3)<0&& de2(row1-2)<0&& de2(row1-1)<0 &&de2(row1)<0 ...
            &&de2(row1+1)>0&&de2(row1+2)>0&&de2(row1+3)>0
    %     if (de2(row1)==0 && de3(row1)~=0)||  (de2(row1)*de2(row1+1)<0)
           rowX(row1)=1;
        end
    end
end
ini=find(rowX);
end

%%消除临近峰值
function [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc)
if size(pks_loc)>1
for k=1:size(pks_loc)-1
    for l=k+1:size(pks_loc)-1
        if(find((abs(pks_loc(l)-pks_loc(k)))<0.05))
        pks_loc(l)=[];
        locs_loc(l)=[];
        end
        
    end

end
end
end
function [ini]=find_mum(Zz)
 if j==1
            if size(locs_loc,2)==1
            mfc_loc=2000;
            else
                if ((-pks_loc(end))-(-pks_loc(1)))>0
                    mfc_loc=-pks_loc(end);
                    figure(j)
                         plot(Z(j,:))
                        
                else
                    mfc_loc=2000;
                end
            end
        else
            if size(locs_loc,2)==1
                mfc_loc=mfc_loc;
            else
                if -pks_loc(end)>-pks_loc(1)
                    if  mfc_loc>-pks_loc(end)
                         index=j;
                         close
                         figure(j)
                         plot(Z(j,:))
                         [pks_loc_MIN,locs_loc_MIN]=findpeaks(-Z(j,:),"MinPeakDistance",10);
                    end
                    mfc_loc=min(mfc_loc,-pks_loc(end));
                end
            end
 end
end
 