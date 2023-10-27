% rocker_shoe_method1=[11.3618264485578	47.9308076143476	33.0640887007552	5.57599550020627	-0.124306461887862	4.54831470261585];
% rocker_shoe_method1=roundn(rocker_shoe_method1,-2);
% 
% flat_shoe_method1=[0.298551551655000	35.6385317500000	9.30222778645551	4.75711516875000	1.10283354330177	8.89412150263214];
% flat_shoe_method1=roundn(flat_shoe_method1,-2);
% rocker_shoe_method2=[11.1580257500000	65.4945250000000	24.2305593968330	5.35834325000000	2.26360736700358	37.9548874032483];
% rocker_shoe_method2=roundn(rocker_shoe_method2,-2);
% 
% flat_shoe_method2=[0.466686258750000	37.5295075000000	9.39292487736996	5.52341462500000	1.08544647035203	11.7718210745812];
% flat_shoe_method2=roundn(flat_shoe_method2,-2);
% 
% y=[rocker_shoe_method1;flat_shoe_method1;rocker_shoe_method2;flat_shoe_method2]';
% b=bar(y);
% ylim([0 70])
% % yticks(0:0.5:6)
% grid on;%加网格
% hold on;%保持图像
% legend('rocker shoe method1','flat shoe method1','rocker shoe method2','flat shoe method2')
% 
% for i=1:4
% xtips1 = b(i).XEndPoints;
% ytips1 = b(i).YEndPoints; %获取 Bar 对象的 XEndPoints 和 YEndPoints 属性
% labels1 = string(b(i).YData); %获取条形末端的坐标
% text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom','FontName','宋体','FontSize',18,'FontWeight','bold')
% %将这些坐标传递给 text 函数，并指定垂直和水平对齐方式，让值显示在条形末端上方居中处
% end
% % --v3
% x3str={' Min','Max','Mean','IQR','S','K'}; %新坐标的值
% 
% xtb = get(gca,'XTickLabel');% 获取横坐标轴标签句柄
% xt = get(gca,'XTick');% 获取横坐标轴刻度句柄
% yt = get(gca,'YTick'); % 获取纵坐标轴刻度句柄 
% xtextp=xt;%每个标签放置位置的横坐标，这个自然应该和原来的一样了。                    
% ytextp=-0.1*yt(3)*ones(1,length(xt));
% text(xtextp,ytextp,x3str,'HorizontalAlignment','right','rotation',46,'FontName','宋体','FontSize',28,'FontWeight','bold')
% set(gca,'XTickLabel',[]); %将原坐标(1,2,3,..)去掉
% legend('FontName','宋体','FontSize',28,'FontWeight','bold');
% ylabel('Vertical displacement(mm)','FontName','宋体','FontSize',28,'FontWeight','bold');
% set(gca, 'Fontname', 'Times newman', 'Fontsize', 28);

% % ----设置 xlabel在右边而非中间
% h=xlabel('Rating Counts');
% xlim = get(gca,'XLim');
% ylim = get(gca,'YLim');
% set(h,'Position',[xlim(2)+(xlim(2)-xlim(1))*0.05,ylim(1)])

%将这些坐标传递给 text 函数，并指定垂直和水平对齐方式，让值显示在条形末端上方居中处


% ylabel('离地高度(mm)');

%%加载数据
% MFC_data=xlsread('C:\Users\zzs\Desktop\chenhao\MFC_tad_just_data.xlsx');
% chenhaoRMFC_1=MFC_data(:,1);
% chenhaoFMFC_1=MFC_data(:,4);
% chenhaoRMFC_2=MFC_data(:,5);
% chenhaoFMFC_2=MFC_data(:,6);
% 
% zhuyunchaoRMFC_1=MFC_data(:,1+6);
% zhuyunchaoFMFC_1=MFC_data(:,4+6);
% zhuyunchaoRMFC_2=MFC_data(:,5+6);
% zhuyunchaoFMFC_2=MFC_data(:,6+6);
% 
% qianchengRMFC_1=MFC_data(:,1+6+6);
% qianchengFMFC_1=MFC_data(:,4+6+6);
% qianchengRMFC_2=MFC_data(:,5+6+6);
% qianchengFMFC_2=MFC_data(:,6+6+6);
% 
% ningxinyiRMFC_1=MFC_data(:,1+6+6+6);
% ningxinyiFMFC_1=MFC_data(:,4+6+6+6);
% ningxinyiRMFC_2=MFC_data(:,5+6+6+6);
% ningxinyiFMFC_2=MFC_data(:,6+6+6+6);
% 
% zhangxingyuRMFC_1=MFC_data(:,1+6+6+6+6);
% zhangxingyuFMFC_1=MFC_data(:,4+6+6+6+6);
% zhangxingyuRMFC_2=MFC_data(:,5+6+6+6+6);
% zhangxingyuFMFC_2=MFC_data(:,6+6+6+6+6);
% mfc=[chenhaoRMFC_1(1:521) zhuyunchaoRMFC_1(1:521)  qianchengRMFC_1(1:521) zhangxingyuRMFC_1(1:521) ];
% 
% l=size(mfc,1);
%%每个个体MFC波动图
% set(0,'defaultfigurecolor','w')
% figure(9)
% set(gca,'position',[0.1,0.1,0.9,0.9])    
% subplot(2,2,1);     % subplot(x,y,n)x表示显示的行数，y表示列数，n表示第几幅图片
% histogram(CHENHAOFMFC,100);
% title('CHENHAOFMFC');
% xlabel('MFC(mm)') 
% ylabel('count') 
% subplot(2,2,2);
% histogram(ZHUYUNCHAOFMFC,100);
% title('ZHUYUNCHAOFMFC');
% xlabel('MFC(mm)') 
% ylabel('count') 
% subplot(2,2,3);
% histogram(ZHANGXINGYUFMFC,100);
% title('ZHANGXINGYUFMFC');
% xlabel('MFC(mm)') 
% ylabel('count') 
% subplot(2,2,4);
% histogram(NINGXINYIFMFC,100);
% title('NINGXINYIFMFC');
% xlabel('MFC(mm)') 
% ylabel('count') 
% %每个个体MFC直方图
% figure(10)          % define figure
% subplot(2,2,1);     % subplot(x,y,n)x表示显示的行数，y表示列数，n表示第几幅图片
% plot(CHENHAOFMFC);
% title('CHENHAOFMFC');
% xlabel('gait cycle') 
% ylabel('MFC(mm)') 
% subplot(2,2,2);
% plot(ZHUYUNCHAOFMFC);
% title('ZHUYUNCHAOFMFC');
% xlabel('gait cycle') 
% ylabel('MFC(mm)') 
% subplot(2,2,3);
% plot(ZHANGXINGYUFMFC);
% title('ZHANGXINGYUFMFC');
% xlabel('gait cycle') 
% ylabel('MFC(mm)') 
% subplot(2,2,4);
% plot(NINGXINYIFMFC);
% title('NINGXINYIFMFC');
% xlabel('gait cycle') 
% ylabel('MFC(mm)') 
%%线性分析统计
% MIN=(min(mfc)).';
% MIN_mean=mean(MIN);
% MAX=(max(mfc)).';
% MAX_mean=mean(MAX);
% MEAN=(mean(mfc)).';
% MEAN_mean=mean(MEAN);
% MED=(median(mfc)).';
% MED_mean=mean(MED);
% SD = (std(mfc)).';%
% SD_mean=mean(SD);
% Q1=(prctile(mfc,25)).';
% Q1_mean=mean(Q1);
% Q2=(prctile(mfc,50)).';
% Q2_mean=mean(Q2);
% Q3=(prctile(mfc,75)).';
% Q3_mean=mean(Q3);
% IQR=(Q3-Q1);
% IQR_mean=mean(IQR);
% S=(skewness(mfc)).';
% S_mean=mean(S);
% K=(kurtosis(mfc)).';
% K_mean=mean(K);

% % %%每个受试者统计
% Participant={'chenhaoMFC';'zhuyunchaoMFC';'zhangxinyuMFC';'ningxinyiMFC'};
% table(Participant,MIN,MAX,MEAN1,MED11,SSDD1,Q1,Q2,Q3,IQR,S,K)

%% 一组所有人数据统计平均值
% v={'MIN_mean'; 'MAX_mean'; 'MEAN_mean'; 'MED_mean'; 'SD_mean'; 'Q1_mean'; 'Q2_mean'; 'Q3_mean';'IQR_mean' ;'S_mean'; 'K_mean'} ;
% TAB_F_1=table(MIN_mean, MAX_mean, MEAN_mean, MED_mean, SD_mean, Q1_mean, Q2_mean, Q3_mean, IQR_mean, S_mean, K_mean);
% LastName = {'rocker_shoe_method1'; 'flat_shoe_method1'; 'rocker_shoe_method2'; 'flat_shoe_method2'};
% MIN_mean = [11.3618264485578;0.298551551655000;11.1580257500000;0.466686258750000];
% MAX_mean =[47.9308076143476;35.6385317500000;65.4945250000000;37.5295075000000];
% MEAN_mean=[33.0640887007552;9.30222778645551;24.2305593968330;9.39292487736996];
% IQR_mean=[5.57599550020627;4.75711516875000;5.35834325000000;5.52341462500000];
% S_mean=[-0.124306461887862;1.10283354330177;2.26360736700358;1.08544647035203];
% K_mean=[4.54831470261585;8.89412150263214;37.9548874032483;11.7718210745812];
% Tab= table(LastName,MIN_mean ,MAX_mean,MEAN_mean,IQR_mean,S_mean,K_mean) ;


% %% 相关性分析
% data=[MIN,MAX,MEAN,MED,SD,Q1,Q2,Q3,IQR,S,K];
% r={'MIN','MAX','MEAN','MED','SD','Q1','Q2','Q3','IQR','S','K'}.';
% v1={'MIN','MAX','MEAN','MED','SD','Q1','Q2','Q3','IQR','S','K'};
% R=corr(data,'type','Spearman');
% v={MIN,MAX,MEAN,MED,SD,Q1,Q2,Q3,IQR,S,K};
% % writematrix(R,'test.xlsx','columNames',v,'RowNames',v);
% MIN=R(:,1);
% MAX=R(:,2);
% MEAN=R(:,3);
% MED=R(:,4);
% SD=R(:,5);
% Q1=R(:,6);
% Q2=R(:,7);
% Q3=R(:,8);
% IQR=R(:,9);
% S=R(:,10);
% K=R(:,11);
% T=table(r,MIN,MAX,MEAN,MED,SD,Q1,Q2,Q3,IQR,S,K);
% T.Properties.VariableNames ={'r','MIN','MAX','MEAN','MED','SD','Q1','Q2','Q3','IQR','S','K'};
% T

%%计算POINCARE拟合SD1,SD2
clc;
clear;
mfc1=xlsread('G:\GAIT\qudaopeng\gait_para\1LMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls');
mfc=mfc1(1:350,1);
xp=mfc;
xp(end)=[];
xm=mfc;
xm(1)=[];
%SD1
SD1 = std(xp-xm)/sqrt(2);% set(handles.sd1, 'string', num2str(SD1*1000));
%SD2
SD2 = std(xp+xm)/sqrt(2);
% set(handles.sd2, 'string', num2str(SD2*1000));
%SDRR
SDRR=sqrt(SD1^2+SD2^2)/sqrt(2);
% set(handles.sdrr, 'string', num2str(SDRR*1000));
figure(5)
plot(xm,xp,'.')
xlabel('MFCn()mm');
ylabel('MFCn+1()mm');
% title('poincare plot,SD1=5.0481;SD2=9.6580')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s=4:16;          %s是窗口大小
s=s';
len=length(s);
F_n=zeros(len,1);

%对每个n值求F_n
% Mfc=[chenhaoFMFC_2(1:521)];
 for i=1:len
    F_s(i)=DFA(mfc,s(i),1);
 end

%线性拟合
p=polyfit(log10(s),log10(F_s),1);
disp(p)

%画图
figure(6)
% plot(s,F_s(:,1),'o');
plot(log10(s),log10(F_s),'.');
hold on
%画拟合直线
x=s;
y=p(2)+p(1)*log10(x);
for i=1:len
   y(i)=10^y(i);
end
% hold on
% plot(log10(x),log10(y),'y');
plot(log10(x),log10(y),...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','k')
xlabel('Log10(n)') 
ylabel('Log10F(n)') 
title('DFA')
hurst=p(1);
hold on;

function fs=DFA(data,s,order)     %data是一列数据；s是划分的窗口大小；

      N=length(data);            %N序列的长度；      
      ns=floor(N/s);              %窗口的个数
      fitcoef=zeros(ns,order+1);
      mean1=mean(data(1:N));         %序列均值
      s1=0;s2=0; sum1=0;sum2=0;      %局部变量用来求窗口内波动的和
     
      len=ns*s;                   %窗口内数据的总长度
      yv1=zeros(len,1);            %正序局部趋势序列，初始化
      yv2=zeros(len,1);            %逆序局部趋势序列，初始化
          
      for i=1:N
         w(i)=sum(data(1:i)-mean1);  %构造轮廓序列,y在这一步会变成行向量
      end
      
      y1=w';                      %转换成正序的列序列y1;
      y2=flipud(y1);               %y2是逆序的列序列
      
      y1=y1(1:len);                %将轮廓序列长度，转换成窗口内数据的总长度
      y2=y2(1:len);
      
      %正序重构序列，划分成长度为n的互不重叠的窗口，并在每个窗口用最小二乘法拟合数据，得到局部趋势。
      for j=1:ns
         fitcoef(j,:)=polyfit(1:s,y1((j-1)*s+1:j*s)',order);
      end
      %       p=polyfit((j-1)*n(k)+1:j*n(k),y((j-1)*n(k)+1:j*n(k)),1);
%       y1(k,(j-1)*n(k)+1:j*n(k))=polyval(p,(j-1)*n(k)+1:j*n(k));
      for j=1:ns
         yv1(((j-1)*s+1):j*s)=polyval(fitcoef(j,:),1:s);
      end
      
      %逆序重构序列，划分成长度为n的互不重叠的窗口，并在每个窗口用最小二乘法拟合数据，得到局部趋势。
      for j=1:ns
         fitcoef(j,:)=polyfit(1:s,y2((j-1)*s+1:j*s)',order);
      end
      
      for j=1:ns
         yv2(((j-1)*s+1):j*s)=polyval(fitcoef(j,:),1:s);
      end
      
      %去除趋势的正序和逆序的序列为：
      ys1=y1-yv1;
      ys2=y2-yv2;
      
      %正序序列窗口内波动的和
      for i=1:ns
           for j=1:s
             sum1=ys1((i-1)*s+j).^2+sum1;
          end  
          s1=s1+sum1;
      end
      s1=s1/s;
      
       %逆序序列窗口内波动的和
      for i=1:ns
           for j=1:s
             sum2=ys2((i-1)*s+j).^2+sum2;
          end  
          s2=s2+sum2;
      end
      s2=s2/s;
      
     %序列窗口内波动的平均值   
     fs=sqrt((s1+s2)/(2*ns));
%      fs=sqrt(s2)/(ns);%%修改
end


