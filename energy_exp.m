% %%不取前90秒的数据rocker shoe
% n=37;
% BETA=[];
% for m=1:floor(235/37)
%      vo2=VO2(1+37*(m-1):37*m,:);
%     [Zs ,beta ,UFk ,UBk2 ]= MKTest(vo2,n,m);
%     BETA=[BETA,beta];
% end


% %  按文献中方法求能耗
% ENERGY_EXP=[];
% for m=1:floor(269/37)
% sum_VCO2=sum(VCO2(1+37*(m-1):37*m,:));
% sum_VO2=sum(VO2(1+37*(m-1):37*m,:));
% NPRQ=sum_VCO2./sum_VO2;
% A=4.94;
% B=16.4;%KJ/L
% Energy_exp=(A.*NPRQ+B)*1000/90;
% ENERGY_EXP=[ENERGY_EXP,Energy_exp];
% end

T=t.*24*60*60;
index=[];
for m=1:floor(235/37)
    [~, I]=min(abs(T(:)-90*m));
    index=[index,I];
end

figure
EEM=EEm.*(4184)./60;
plot(T,EEM,'-*')
grid on
title('Energy Expenditure')
xlabel('Time (s)')
ylabel('EEm (J/kg/s)')
time=T.';
EEM=EEM.';

xverts = [time(1:end-1); time(1:end-1); time(2:end); time(2:end)];
yverts = [zeros(1,size(EEM,2)-1); EEM(1:end-1); EEM(2:end); zeros(1,size(EEM,2)-1)];
p = patch(xverts,yverts,'b','LineWidth',1.5);


ENERGY=[];
for m=1:size(index,2)-1
    if m==1
        ENERGY = trapz(time(1:index(1)),EEM(1:index(1)))/(time(index(1))-time(1))/59;
    end
    energy = trapz(time(index(m):index(m+1)),EEM(index(m):index(m+1)))/(time(index(m+1))-time(index(m)))/59;
    ENERGY=[ENERGY,energy];
end
ENERGY=[4.3027	4.5190	4.6839	4.5901	5.3120	4.7953];
ENERGY_flat=[4.8036	4.5870	4.7844	4.8178	4.5335	4.3875];
a1=ENERGY;
a2=ENERGY_flat;
name=[];
y=[a1;a2]';
b=barh(y);
xlim([0 6])
xticks(0:0.5:6)
grid on;%加网格
hold on;%保持图像
legend(' Rocker shoes',' Flat shoes','FontSize',18,'FontWeight','bold')
ylabel('Every 90 seconds interval(s)','FontSize',18,'FontWeight','bold');
xlabel('Mtabolic energy cost(J/kg/s)','FontSize',18,'FontWeight','bold');

for i=1:2
xtips1 = b(i).XEndPoints;
ytips1 = b(i).YEndPoints; %获取 Bar 对象的 XEndPoints 和 YEndPoints 属性
labels1 = string(b(i).YData); %获取条形末端的坐标
text(ytips1,xtips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','middle','FontSize',18,'FontWeight','bold')
%将这些坐标传递给 text 函数，并指定垂直和水平对齐方式，让值显示在条形末端上方居中处
end
% --v3
x3str={' 0-90(s)','90-180(s)','180-270(s)','270-360(s)','360-450(s)','450-540(s)'}; %新坐标的值
set(gca,'YTickLabel',x3str);



function  [Zs ,beta ,UFk ,UBk2 ]= MKTest(Data,n,m)

%% 趋势分析线性:Mann-Kendall检验
Sgn=zeros(n-1,n-1);        %初始化分配内存
for i=1:n-1
    for j=i+1:n
        if((Data(j)-Data(i))>0)
            Sgn(i,j)=1;
        else
            if((Data(j)-Data(i))==0)
                Sgn(i,j)=0;
            else
                if((Data(j)-Data(i))<0)
                    Sgn(i,j)=-1;
                end
            end
        end
    end
end
Smk=sum(sum(Sgn));

VarS=n*(n-1)*(2*n+5)/18;

if n>10
    if Smk>0
        Zs=(Smk-1)/sqrt(VarS);
    else
        if Smk==0
            Zs=0;
        else
            if  Smk<0
                Zs=(Smk+1)/sqrt(VarS);
            end
        end
    end
end

%% beta 斜率 描述单调趋势
t=1;
for i=2:n
   for j=1:(i-1)
       temp(t)=( Data(i)-Data(j) )/( i-j );
       t=t+1;
   end
end
beta=median( temp );

%% 突变检验
Sk=zeros(n,1);          % 定义累计量序列Sk
UFk=zeros(n,1);        % 定义统计量UFk
s = 0;
% 正序列计算start---------------------------------
for i=2:n
   for j=1:i
         if Data(i)>Data(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk(i)=s;
   E=i*(i-1)/4; % Sk(i)的均值
  Var=i*(i-1)*(2*i+5)/72; % Sk(i)的方差
  UFk(i)=(Sk(i)-E)/sqrt(Var);
end
% 正序列计算end---------------------------------

% 逆序列计算start---------------------------------
Sk2=zeros(n);  % 定义逆序累计量序列Sk2
UBk=zeros(n,1); 
s=0;
Data2=flipud(Data);        % 按时间序列逆转样本y
for i=2:n
   for j=1:i
         if Data2(i)>Data2(j)
           s=s+1;
         else
           s=s+0;
         end
   end
   Sk2(i)=s;
   E=i*(i-1)/4; 
  Var=i*(i-1)*(2*i+5)/72; 
  UBk(i,1)=0-(Sk2(i)-E)/sqrt(Var);
end
% 逆序列计算end------------------------------
UBk2=flipud(UBk);
UFk=UFk';
UBk2=UBk2';
% %{
figure(m)%画图
plot(1:n,UFk,'r-','linewidth',1.5);
hold on
plot(1:n,UBk2,'b-.','linewidth',1.5);
plot(1:n,1.96*ones(n,1),':','linewidth',1);
% axis([1,n,-5,8]);
legend('UF统计量','UB统计量','0.05显著水平');
xlabel('t (year)','FontName','TimesNewRoman','FontSize',12);
ylabel('统计量','FontName','TimesNewRoman','Fontsize',12);
%grid on
hold on
plot(1:n,0*ones(n,1),'-.','linewidth',1);
plot(1:n,1.96*ones(n,1),':','linewidth',1);
plot(1:n,-1.96*ones(n,1),':','linewidth',1);
%}
end
