%% 摇摆鞋6个标记点
%输入CT标记点拟合球心坐标
% d=[1.2137 0.2601 -395.9976];
% e=[-46.6694 10.9509 -443.1452];
% f=[-60.4167 18.8000 -480.1134];
% a=[-63.5075 14.9190 -562.4350];
% b=[-60.6833 13.1566 -618.3038];
% c=[-14.4277 -0.5241 -681.9155];
% A=[d,e,f,a,b,c];


% %% 平底鞋鞋6个标记点
% %输入CT标记点拟合球心坐标
% d=[-5.8972602;	10.698463;	-364.6666];
% e=[-57.703022;	5.6684699;	-449.884];
% f=[-58.683445;	5.1665664;	-504.08041];
% a=[-62.200055;	14.698091;	-548.34277];
% b=[-64.147308;	20.616934;	-612.13086];
% c=[-19.420757;	13.605434;	-670.32205];
% P1=[ 10.6317 -364.7494];
% P2=[ -1.3622 -402.8587];
% P3=[ 5.6188  -449.8804];
% P4=[ 5.1136  -503.9448];
% P5=[ 14.7866 -548.4026];
% P6=[ 13.7332 -669.0601];
% A=[P1,P2,P3,P4,P5,P6];


%输入VICON标记点球心坐标所有帧
BB=load('C:\Users\zzs\Desktop\文章\chenhao\10分钟帧数据仅步态数据\chenhao_01.csv');
b4=BB(:,1:3).';
b5=BB(:,4:6).';
b6=BB(:,7:9).';
b1=BB(:,10:12).';
b2=BB(:,13:15).';
b3=BB(:,16:18).';
ZZ1=BB(1:500,6);
% Recover R and t
ret_R_ret_t=[];
Y3=b5(3,:);

Z=[];
ZZ=[];
Z3=[];
Z_P2=[];
RMSE=[];
ERR=[];
MAE=[];
for i=1:size(b1,2)-1
%     B=[b1(:,i) b2(:,i) b3(:,i)];
    %顺序取VICON每一帧的数据
    B=[b4(:,i) b5(:,i) b6(:,i) b1(:,i) b2(:,i) b3(:,i)];
    AB=[b4(:,i+1) b5(:,i+1) b6(:,i+1) b1(:,i+1) b2(:,i+1) b3(:,i+1)];
%     B=[b4(:,i) b5(:,i) b6(:,i) b1(:,i) ];
%     AB=[b4(:,i+1) b5(:,i+1) b6(:,i+1) b1(:,i+1) ];

%     B=[ b1(:,i) b2(:,i) b3(:,i)];
%     AB=[ b1(:,i+1) b2(:,i+1) b3(:,i+1)];
    n=size(B,2);

    %求CT求前足，中足和后跟三部分标记点拟合球心坐标点集合mi与VICON步态实验室获取的每
    % 一帧对应的标记点的球心坐标点集合di的变换矩阵
%     [ret_R, ret_t] = rigid_transform_3D(A, B);
    [ret_R, ret_t] = rigid_transform_3D(B, AB);
%     % Compare the recovered R and t with the original,恢复标记点6的轨迹，验算点误差
%     B2 = (ret_R*A) + repmat(ret_t, 1, n);
    B2 = (ret_R*B) + repmat(ret_t, 1, n);
    Z=[Z;B2(3,6)];
    Z3=[Z3;B2(3,1)];
    Z_P2=[Z_P2;B2(3,2)];
    Z_P4=[Z_P2;B2(3,4)];
%     Z=[Z;B2(3,3)];

    % Find the root mean squared error
%     err = B2 - B;
    err = B2 - AB;
    err = err .* err;
    err = sum(err(:));
    mae = mean(abs(B2 - AB));



    MAE=[MAE;mae];
    rmse = sqrt(err/n);
    RMSE=[RMSE;rmse];
    ret_R_T=[[ret_R, ret_t];0 0 0 1];
    ret_R_ret_t=[ ret_R_ret_t;ret_R_T];
end
mae=mean(MAE);
rmse=mean(RMSE);

% figure(1)
% Z1=b3(3,1:500).';
% plot(Z(1:500)-57,'o--k','LineWidth',2);
% hold on;
% plot(Z1(1:500)-57,'k','LineWidth',0.5);
% Z2=b4(3,1:500).';
% plot(Z3(1:500)-57,'o--k','LineWidth',2);
% hold on;
% plot(Z2(1:500)-57,'k','LineWidth',0.5);
% figure_FontSize=20;
% % xlabel('时间帧(100Hz)');
% ylabel('Vertical Displacement(mm)','position',[-30 180]);
% 
% % set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
% set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
% set(findobj('FontSize',20),'FontSize',figure_FontSize);
% lgd = legend('Measured values','Reference values') ;
% title(lgd,'mae:0.1578,rmse:0.2946')
% legend('FontName','宋体','FontSize',20,'LineWidth',1.5,'FontWeight','bold');
% set(gca, 'Fontname', 'Times newman', 'Fontsize', 20);

y=Z_P2;
window=5;
y_smooth_gaussian=smoothdata(y,'gaussian',window);
Z_P2=y_smooth_gaussian;
Y=Z;
Y3=b5(3,:);


figure(3)
plot(0.01:0.01:5,Y3(1:500)-57,'k','LineWidth',1.5);
hold on;
plot(0.01:0.01:5,Z_P2(2:501)-57,'r','LineWidth',1.5);
hold on;
plot(0.01:0.01:5,Y(1:500)-57,'b','LineWidth',1.5);
figure_FontSize=8;
set(gca, 'Fontname', '微软雅黑', 'Fontsize', 8);
set(gca, 'Box', 'off','FontWeight','bold');
set(gca,'linewidth',1.5); %坐标 线粗0.5磅
xlabel('时间(s)','Fontname', '微软雅黑', 'Fontsize', 9,'FontWeight','bold');
ylabel('足部离地间隙(mm)', 'Fontname',  '微软雅黑', 'Fontsize', 9,'FontWeight','bold');%,'position',[-30 100]
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
ylim([0 200])
% xlim([0 6])
% set(findobj('FontSize',8),'Fontname', '微软雅黑','FontSize',figure_FontSize);
legend('标记点方法','3D-MFC方法','二维几何方法','Fontname', '微软雅黑', 'Fontsize', 9,'LineWidth',1.5,'FontWeight','bold') ;


mae_1 = mean(abs(Z_P2(1:59214)-Y3(2:59215)));
rmse_1 = sqrt(mean((Z_P2(1:59214)-Y3(2:59215)).^2));
mae_2 = mean(abs(Y(2:59215)-Y3(2:59215)));
rmse_2 = sqrt(mean((Y(2:59215)-Y3(2:59215)).^2));


function [R,t] = rigid_transform_3D(A, B)
    
    % This function finds the optimal Rigid/Euclidean transform in 3D space
    % It expects as input a 3xN matrix of 3D points.
    % It returns R, t

    narginchk(2,2);
    assert(all(size(A) == size(B)));

    [num_rows, num_cols] = size(A);
    if num_rows ~= 3
        error("matrix A is not 3xN, it is %dx%d", num_rows, num_cols)
    end

    [num_rows, num_cols] = size(B);
    if num_rows ~= 3
        error("matrix B is not 3xN, it is %dx%d", num_rows, num_cols)
    end

    % find mean column wise
    centroid_A = mean(A, 2);
    centroid_B = mean(B, 2);

    % subtract mean
    Am = A - repmat(centroid_A, 1, num_cols);
    Bm = B - repmat(centroid_B, 1, num_cols);

    % calculate covariance matrix (is this the correct terminology?)
    H = Am * Bm';

    %if rank(H) < 3
    %    error(sprintf("rank of H = %d, expecting 3", rank(H)))
    %end

    % find rotation
    [U,S,V] = svd(H);
    R = V*U';

    if det(R) < 0
%         printf("det(R) < R, reflection detected!, correcting for it ...\n");
        V(:,3) = V(:,3) * -1;
        R = V*U';
    end

    t = -R*centroid_A + centroid_B;
end
% Data = load("C:\Users\zzs\Desktop\chenhao\标记点CT到步态实验室每一帧的转换矩阵\qiancheng_transMAT_three.txt");%帧之间的转换矩阵
% gait_data=load('C:\Users\zzs\Desktop\chenhao\10分钟帧数据仅步态数据\qiancheng_01.csv');
% V=gait_data(1:2000,16:18);
% Z=[];
% for m=1:20
%      A=Data(1+4*(m-1):4+4*(m-1),:);% 每一个转换矩阵四行四列，每一个循环取一个转换矩阵
%      v=[-14.341349	-0.75962961	-684.23315];
%      v1=[v 1];%为了和转换矩阵相乘将顶点矩阵加一列1，数据格式为143531*4，并转置为4*14353
%      v11=A*(v1.');
%      v2=v11.';
%      Z=[Z;v2(:,3)];
% end
% mae = mean(abs(Z-V(1:200,3)));
% rmse = sqrt(mean((Z-V(1:200,3)).^2));




% xlswrite('C:\Users\zzs\Desktop\chenhao\ningxinyiR_mfc.xlsx',mfc)
% mfc=mfc.';
% figure(1)
% plot(Z(141206,:)) 
% 
% % plot(chenhaometatarsalH(1000:2000))
% % [pks,locs] = findpeaks(-chenhaometatarsalH);
% % [row,col]=find(-pks>130 & -pks<160);
% MMffcc=-pks(row)-87;
% [pks,locs] = findpeaks(-chenhaometatarsalHf(200:59216));
% [row,col]=find(-pks>135 & -pks<160);
% MMffcc_f=-pks(row)-81.1161;

% %求朱云超rocker shoeMFC
% plot(zhuyunchaometatarsalH(1000:2000))
% [pks,locs] = findpeaks(-zhuyunchaometatarsalH(1:59216));
% [row,col]=find(-pks>125 & -pks<160);
% MMffcc=-pks(row)-81.1161;
%求朱云超flat shoeMFC
% plot(zhuyunchaometatarsalHf(1087:2000));
% [pks,locs] = findpeaks(-zhuyunchaometatarsalHf(1000:60216,1));
% [row,col]=find(-pks>134.5 & -pks<150);
% MMffcc_f=-pks(row)-81.1161;
%求张星宇rocker shoeMFC
% plot(zhangxingyumetatarsalH(1:1000))
% [pks,locs] = findpeaks(-zhangxingyumetatarsalH(1:59216));
% [row,col]=find(-pks>130 & -pks<160);
% MMffcc=-pks(row)-81.1161;
% %求张星宇rocker shoeMFC
% plot(zhangxingyumetatarsalHf(1:1000));
% [pks,locs] = findpeaks(-zhangxingyumetatarsalHf(1:59216,1));
% [row,col]=find(-pks>135 & -pks<160);
% MMffcc_f=-pks(row)-81.1161;
%求宁心仪rocker shoeMFC
% plot(ningxinyimetatarsalH(1:3000))
% [pks,locs] = findpeaks(-ningxinyimetatarsalH);
% [row,col]=find(-pks>113.9 & -pks<145);
% MMffcc=-pks(row)-81.1161;
% plot(Z(1:1000))
% [pks,locs] = findpeaks(-Z,'MinPeakDistance',100);



