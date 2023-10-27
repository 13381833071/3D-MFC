clc;
clear;
maindir = 'G:\能耗';
subdir =  dir( maindir );
SUBJ=[];
for k=1:4
    energy_EEkg =[]; energy_t = []; energy_EEm = []; energy_EEtot = [];
    for i = 4 : length( subdir )
        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
            continue;
        end
        filename_shoe= fullfile( maindir, subdir( i).name,strcat('0',num2str(k),'_shoe.xlsx'));
        if(exist(filename_shoe)~=0)
            t=Read_colum(filename_shoe,'t');
            t=t.*24*60*60;
            [~,Index] =min(abs(t-360));%Index返回索引
            %             energy_t =[energy_t;normlity_percent(t(1:Index))];
            energy_t =[energy_t;(t(1:Index))];

            EEkg=Read_colum(filename_shoe,'EEkg');
            EEkg=EEkg.*(4184)./(24*3600);
            %             energy_EEkg =[energy_EEkg;normlity_percent(EEkg(1:Index))];
            energy_EEkg =[energy_EEkg;(EEkg(1:Index))];

            EEm=Read_colum(filename_shoe,'EEm');
            EEm=EEm.*(4184)./60;
            energy_EEm =[energy_EEm;normlity_percent(EEm(1:Index))];
            %             energy_EEm =[energy_EEm;(EEm(1:Index)).'];

            EEtot=Read_colum(filename_shoe,'EEtot');
            EEtot=EEtot.*(4184);
            energy_EEtot =[energy_EEtot;normlity_percent(EEtot(1:Index))];
            %             energy_EEtot =[energy_EEtot;(EEtot(1:Index))];

            SUBJ = linspace(1,15,15).';
            SUBJ1 =linspace(1,15,15).';
            SUBJ=repmat(SUBJ1, 4, 1);

        end
    end

    if ~isempty(energy_EEkg)
        %         xlswrite(fullfile('G:\能耗\total_results',strcat(num2str(k),'energy_EEkg.xls')),energy_EEkg);
        eval([['energy_EEkg',num2str(k)] ,'= energy_EEkg']);
    end

    if ~isempty(energy_t)
        %         xlswrite(fullfile('G:\能耗\total_results',strcat(num2str(k),'energy_t.xls')),energy_t);
        eval([['energy_t',num2str(k)] ,'= energy_t']);
    end

    if ~isempty(energy_EEm)
        %         xlswrite(fullfile('G:\能耗\total_results',strcat(num2str(k),'energy_EEm.xls')),energy_EEm);
        eval([['energy_EEm',num2str(k)] ,'= energy_EEm']);
    end

    if ~isempty(energy_EEtot)
        %         xlswrite(fullfile('G:\能耗\total_results',strcat(num2str(k),'energy_EEtot.xls')),energy_EEtot);
        eval([['energy_EEtot',num2str(k)] ,'= energy_EEtot']);
    end
end

% [ENERGY]=Energy_expenditure(energy_t1,energy_t2,energy_t3,energy_t4,energy_EEkg1,energy_EEkg2,energy_EEkg3,energy_EEkg4,2);
% [ENERGY]=Energy_expenditure(energy_t1,energy_t2,energy_t3,energy_t4,energy_EEtot1,energy_EEtot2,energy_EEtot3,energy_EEtot4,3);
[ENERGY]=Energy_expenditure(energy_EEtot1,energy_EEtot2,energy_EEtot3,energy_EEtot4,3);

% [spm_left_pelvic_angle]=plot_SPM(energy_EEkg1,energy_EEkg2,energy_EEkg3,energy_EEkg4,1,SUBJ);
% [spm_left_pelvic_angle]=plot_SPM(energy_EEtot1,energy_EEtot2,energy_EEtot3,energy_EEtot4,1,SUBJ);


function [result]=Read_colum(filename_shoe,x)
E=x;
EEKG=cellstr(E);
[data,txt]=xlsread(filename_shoe);
index1=find(contains(txt(1,:),EEKG)==1);
result =data(4:end,index1(1,1)-1);%读取excel文件
end


function [energy_expenditure1] =Energy_expenditure(energy_expenditure1,energy_expenditure2,energy_expenditure3,energy_expenditure4,var)
index=[];
figure
if var==1
    energy_expenditure1b = energy_expenditure1';
    energy_expenditure1_row = energy_expenditure1b(:);

    energy_expenditure2b = energy_expenditure2';
    energy_expenditure2_row = energy_expenditure2b(:);

    energy_expenditure3b = energy_expenditure3';
    energy_expenditure3_row = energy_expenditure3b(:);

    energy_expenditure4b = energy_expenditure4';
    energy_expenditure4_row = energy_expenditure4b(:);
    max_size=max([size(energy_expenditure1_row,1),size(energy_expenditure2_row,1),size(energy_expenditure3_row,1),size(energy_expenditure4_row,1)]);
    energy_expenditure1_row=[ energy_expenditure1_row ; zeros(max_size-length(energy_expenditure1_row),1)];
    energy_expenditure2_row=[ energy_expenditure2_row ; zeros(max_size-length(energy_expenditure2_row),1)];
    energy_expenditure3_row=[ energy_expenditure3_row ; zeros(max_size-length(energy_expenditure3_row),1)];
    energy_expenditure4_row=[ energy_expenditure4_row ; zeros(max_size-length(energy_expenditure4_row),1)];
    energy_expenditure=[energy_expenditure1_row,energy_expenditure2_row,energy_expenditure3_row,energy_expenditure4_row];
    EEM=energy_expenditure;%J/kg/s
    boxplot(energy_expenditure1_row,'symbol','');
    boxplot(energy_expenditure2_row,'symbol','');
    boxplot(energy_expenditure3_row,'symbol','');
    boxplot(energy_expenditure4_row,'symbol','');
    boxplot(EEM,'symbol','');
    %     xlabel('Rocker radius (mm)')
    %     ylabel('Energy expenditure (J/kg/s)')
    fontsz = 10;
    set(gcf,'Position',[200 300 800 600]);

    xlabel('Rocker radius (mm)','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
    ylabel('Energy consumption (J/kg/s)','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
    x3str={'Flat','R21','R18.5','R16'}; %新坐标的值
    set(gca,'XTickLabel',x3str);
    set(gca, 'Box', 'off');
    set(gca,'FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold');
end

if var==2
    energy_expenditure=[energy_expenditure1,energy_expenditure2,energy_expenditure3,energy_expenditure4];
    EEM=energy_expenditure;
    boxplot(EEM,'symbol','');
    %     xlabel('Rocker radius')
    %     ylabel('energy expenditure (J/kg/s)')
    %     x3str={'Flat','R21','R18.5','R16'}; %新坐标的值
    fontsz = 10;
    set(gcf,'Position',[200 300 800 600]);

    xlabel('Rocker radius (mm)','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
    ylabel('Energy consumption (J/kg/s)','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
    x3str={'Flat','R21','R18.5','R16'}; %新坐标的值
    set(gca,'XTickLabel',x3str);
    set(gca, 'Box', 'off');
    set(gca,'FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold');
end

if var==3
    hl1=plot(mean(energy_expenditure1,1), 'color','k');%mean(energy_t1,1)
    x = get(hl1,'xdata');    % x坐标
    x_new = x - 1;    % x坐标平移dx
    set(hl1,'xdata',x_new);    % x坐标
    hold on
    hl2=plot(mean(energy_expenditure2,1), 'color','b');
    x = get(hl2,'xdata');    % x坐标
    x_new = x - 1;    % x坐标平移dx
    set(hl2,'xdata',x_new);    % x坐标
    hold on
    hl3=plot(mean(energy_expenditure3,1), 'color','g');
    x = get(hl3,'xdata');    % x坐标
    x_new = x - 1;    % x坐标平移dx
    set(hl3,'xdata',x_new);    % x坐标
    hold on
    hl4=plot(mean(energy_expenditure4,1), 'color','r');
    x = get(hl4,'xdata');    % x坐标
    x_new = x - 1;    % x坐标平移dx
    set(hl4,'xdata',x_new);    % x坐标
    fontsz = 10;
%     fontsz = 9;
    %     set(gcf,'Position',[200 300 800 600]);

    xlabel('% Six minutes walking','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
%     xlabel('%六分钟行走','FontSize',fontsz,'FontName','微软雅黑','FontWeight','bold')
    %     xlabel('% Six minutes');
    ylabel('Energy consumption (J)','FontSize',fontsz,'FontName','Times New Roman','FontWeight','bold')
%     ylabel('能耗(J)','FontSize',fontsz,'FontName','微软雅黑','FontWeight','bold')
        hl=legend('Flat','R21','R18.5','R16','Location','NorthWest');
%     hl=legend('Flat','R21','R18.5','R16','Location','NorthWest','FontSize',fontsz,'FontName','Times New Roman');
    set(hl,'Orientation','vertical','Box','on')
    set(gca, 'Box', 'off');
    set(gca,'FontSize',fontsz,'FontName','Times New Roman');
ylim([0 0.0009]);
end

end

function [spm_bs]=plot_SPM(var1, var2,var3,var4,var,SUBJ)

%(1) Conduct SPM analysis:
%(2) Plot:
close all
figure('position', [0 0 1000 300])
%%% plot mean and SD:
% subplot(211)
if var==1
    spm1d.plot.plot_meanSD(var1, 'color','k');%mean(var1,1) .*1e6
    hold on
    spm1d.plot.plot_meanSD(var2, 'color','b');
    hold on
    spm1d.plot.plot_meanSD(var3, 'color','g');
    hold on
    spm1d.plot.plot_meanSD(var4, 'color','r');
end
% if var==1
%     title('Sagittal Ankle Angle')
ylabel('Energy expenditure (J)');
xlabel('% Six minutes');
% end
hl=legend('Flat_m','Flat_S','R21_m','R21_S','R18.5_m','R18.5_S','R16_m','R16_S','Location','NorthWest');
set(hl,'Orientation','horizon','Box','off')
set(gca, 'Box', 'off');
Y=[var1;var2;var3;var4];
A1(1:size(var1),1)=0;
A2(1:size(var2),1)=1;
A3(1:size(var3),1)=2;
A4(1:size(var4),1)=3;
A=[A1;A2;A3;A4];
%(1) Conduct SPM analysis:
% spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
spmi      = spm.inference(0.05);
% spmi      = spm_bs.inference(0.05);
disp(spmi)

hold on
subplot(212)
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();

plot(spm_bs.z(1:100),'LineWidth',2,'Color','k')  %between-subjects model
xlabel('% Gait Cycle');
ylabel('SPM','{F}');
title('Main Effect')

end

function  y_new=normlity_percent(y)
x_old = linspace(0,1,length(y));
x_new = linspace(0,1,101);
y_new = interp1(x_old,y,x_new,'spline');
end






