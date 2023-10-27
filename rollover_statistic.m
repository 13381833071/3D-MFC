clc;
clear;
maindir = 'G:\GAIT';
subdir =  dir( maindir );   % 确定子文件夹
for k=1:4
    slow_L_total_mean_var=[];
    slow_R_total_mean_var=[];
    fast_L_total_mean_var=[];
    fast_R_total_mean_var=[];
    normal_L_total_mean_var=[];
    normal_R_total_mean_var=[];

    XC_F = [];
    YC_F = [];
    R_F=[];
    A_F=[];
    XC_AF = [];
    YC_AF = [];
    R_AF=[];
    A_AF=[];
    XC_KAF = [];
    YC_KAF = [];
    R_KAF=[];
    A_KAF=[];

    XC_F_slow_R = [];
    YC_F_slow_R = [];
    R_F_slow_R=[];
    XC_AF_slow_R = [];
    YC_AF_slow_R = [];
    R_AF_slow_R=[];
    XC_KAF_slow_R = [];
    YC_KAF_slow_R = [];
    R_KAF_slow_R=[];

    XC_F_fast_L = [];
    YC_F_fast_L = [];
    R_F_fast_L=[];
    XC_AF_fast_L = [];
    YC_AF_fast_L = [];
    R_AF_fast_L=[];
    XC_KAF_fast_L = [];
    YC_KAF_fast_L = [];
    R_KAF_fast_L=[];

    XC_F_fast_R = [];
    YC_F_fast_R = [];
    R_F_fast_R=[];
    XC_AF_fast_R = [];
    YC_AF_fast_R = [];
    R_AF_fast_R=[];
    XC_KAF_fast_R = [];
    YC_KAF_fast_R = [];
    R_KAF_fast_R=[];

    XC_F_normal_L = [];
    YC_F_normal_L = [];
    R_F_normal_L=[];
    XC_AF_normal_L = [];
    YC_AF_normal_L = [];
    R_AF_normal_L=[];
    XC_KAF_normal_L = [];
    YC_KAF_normal_L = [];
    R_KAF_normal_L=[];

    XC_F_normal_R = [];
    YC_F_normal_R = [];
    R_F_normal_R=[];
    XC_AF_normal_R = [];
    YC_AF_normal_R = [];
    R_AF_normal_R=[];
    XC_KAF_normal_R = [];
    YC_KAF_normal_R = [];
    R_KAF_normal_R=[];
    height=178;%[170 170 178 171 180];
    for i = 1 : length( subdir )
        
        if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
            continue;
        end

        try
            subdirpath_L = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','slow L',strcat('0',num2str(k), '*.xls'));
            fiels = dir( subdirpath_L );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels )
                filepath = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','slow L',fiels( j ).name) ;
                data = xlsread(filepath);
                LROLL_OVER_X_F = data(:,1);
                LROLL_OVER_Y_F = data(:,2);
                LROLL_OVER_X_AF = data(:,3);
                LROLL_OVER_Y_AF = data(:,4);
                LROLL_OVER_X_KAF = data(:,5);
                LROLL_OVER_Y_KAF = data(:,6);
                [xc_f,yc_f,r_f]=circlefit(LROLL_OVER_X_F,LROLL_OVER_Y_F);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F,LROLL_OVER_Y_F);
                XC_F = [XC_F;xc_f];
                YC_F = [YC_F;yc_f];
                R_F=[R_F;r_f];
                %                 A_F=[A_F;a_f];
                [xc_af,yc_af,r_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF = [XC_AF;xc_af];
                YC_AF = [YC_AF;yc_af];
                R_AF=[R_AF;r_af];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf,yc_kaf,r_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF = [XC_KAF;xc_kaf];
                YC_KAF = [YC_KAF;yc_kaf];
                R_KAF=[R_KAF;r_kaf];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_slow_L=[XC_F YC_F R_F XC_AF YC_AF R_AF XC_KAF YC_KAF R_KAF] ;
            XYR_slow_L_mean=mean(XYR_slow_L,1)./height;
            XYR_slow_L_var=var(XYR_slow_L,1)./height;
            slow_L_total_mean_var=[slow_L_total_mean_var;XYR_slow_L_mean XYR_slow_L_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','slow L'),'XYR');
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','slow L','XYR',strcat(num2str(k),'slow_L_total_mean_var.xls')),slow_L_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','slow L','XYR',strcat(num2str(k),'XYR_slow_L.xls')),XYR_slow_L);

            subdirpath_slow_R = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','slow R',strcat('0',num2str(k), '*.xls'));
            fiels_slow_R = dir( subdirpath_slow_R );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels_slow_R )
                filepath_slow_R = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','slow R',fiels_slow_R( j ).name) ;
                data = xlsread(filepath_slow_R);
                LROLL_OVER_X_F_slow_R = data(:,1);
                LROLL_OVER_Y_F_slow_R = data(:,2);
                LROLL_OVER_X_AF_slow_R = data(:,3);
                LROLL_OVER_Y_AF_slow_R = data(:,4);
                LROLL_OVER_X_KAF_slow_R = data(:,5);
                LROLL_OVER_Y_KAF_slow_R = data(:,6);
                [xc_f_slow_R,yc_f_slow_R,r_f_slow_R]=circlefit(LROLL_OVER_X_F_slow_R,LROLL_OVER_Y_F_slow_R);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F_slow_R,LROLL_OVER_Y_F);
                XC_F_slow_R = [XC_F_slow_R;xc_f_slow_R];
                YC_F_slow_R = [YC_F_slow_R;yc_f_slow_R];
                R_F_slow_R=[R_F_slow_R;r_f_slow_R];
                %                 A_F=[A_F;a_f];
                [xc_af_slow_R,yc_af_slow_R,r_af_slow_R]=circlefit_2(LROLL_OVER_X_AF_slow_R,LROLL_OVER_Y_AF_slow_R);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF_slow_R = [XC_AF_slow_R;xc_af_slow_R];
                YC_AF_slow_R = [YC_AF_slow_R;yc_af_slow_R];
                R_AF_slow_R=[R_AF_slow_R;r_af_slow_R];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf_slow_R,yc_kaf_slow_R,r_kaf_slow_R]=circlefit_2(LROLL_OVER_X_KAF_slow_R,LROLL_OVER_Y_KAF_slow_R);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF_slow_R = [XC_KAF_slow_R;xc_kaf_slow_R];
                YC_KAF_slow_R = [YC_KAF_slow_R;yc_kaf_slow_R];
                R_KAF_slow_R=[R_KAF_slow_R;r_kaf_slow_R];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_slow_R=[XC_F_slow_R YC_F_slow_R R_F_slow_R XC_AF_slow_R YC_AF_slow_R R_AF_slow_R XC_KAF_slow_R YC_KAF_slow_R R_KAF_slow_R] ;
            XYR_slow_R_mean=mean(XYR_slow_R,1)./height;
            XYR_slow_R_var=var(XYR_slow_R,1)./height;
            slow_R_total_mean_var=[slow_R_total_mean_var;XYR_slow_R_mean XYR_slow_R_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','slow R'),'XYR')
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','slow R','XYR',strcat(num2str(k),'slow_R_total_mean_var.xls')),slow_R_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','slow R','XYR',strcat(num2str(k),'XYR_slow_R.xls')),XYR_slow_R);


            subdirpath_fast_L = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','fast L',strcat('0',num2str(k), '*.xls'));
            fiels_fast_L = dir( subdirpath_fast_L );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels_fast_L )
                filepath_fast_L = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','fast L',fiels_fast_L( j ).name) ;
                data = xlsread(filepath_fast_L);
                LROLL_OVER_X_F_fast_L = data(:,1);
                LROLL_OVER_Y_F_fast_L = data(:,2);
                LROLL_OVER_X_AF_fast_L = data(:,3);
                LROLL_OVER_Y_AF_fast_L = data(:,4);
                LROLL_OVER_X_KAF_fast_L = data(:,5);
                LROLL_OVER_Y_KAF_fast_L = data(:,6);
                [xc_f_fast_L,yc_f_fast_L,r_f_fast_L]=circlefit(LROLL_OVER_X_F_fast_L,LROLL_OVER_Y_F_fast_L);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F_fast_R,LROLL_OVER_Y_F);
                XC_F_fast_L = [XC_F_fast_L;xc_f_fast_L];
                YC_F_fast_L = [YC_F_fast_L;yc_f_fast_L];
                R_F_fast_L=[R_F_fast_L;r_f_fast_L];
                %                 A_F=[A_F;a_f];
                [xc_af_fast_L,yc_af_fast_L,r_af_fast_L]=circlefit_2(LROLL_OVER_X_AF_fast_L,LROLL_OVER_Y_AF_fast_L);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF_fast_L = [XC_AF_fast_L;xc_af_fast_L];
                YC_AF_fast_L = [YC_AF_fast_L;yc_af_fast_L];
                R_AF_fast_L=[R_AF_fast_L;r_af_fast_L];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf_fast_L,yc_kaf_fast_L,r_kaf_fast_L]=circlefit_2(LROLL_OVER_X_KAF_fast_L,LROLL_OVER_Y_KAF_fast_L);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF_fast_L = [XC_KAF_fast_L;xc_kaf_fast_L];
                YC_KAF_fast_L = [YC_KAF_fast_L;yc_kaf_fast_L];
                R_KAF_fast_L=[R_KAF_fast_L;r_kaf_fast_L];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_fast_L=[XC_F_fast_L YC_F_Lfast_L R_F_fast_ XC_AF_fast_L YC_AF_fast_L R_AF_fast_L XC_KAF_fast_L YC_KAF_fast_L R_KAF_fast_L] ;
            XYR_fast_L_mean=mean(XYR_fast_L,1)./height;
            XYR_fast_L_var=var(XYR_fast_L,1)./height;
            fast_L_total_mean_var=[fast_L_total_mean_var;XYR_fast_L_mean XYR_fast_L_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','fast L'),'XYR')
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','fast L','XYR',strcat(num2str(k),'fast_L_total_mean_var.xls')),fast_L_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','fast L','XYR',strcat(num2str(k),'XYR_fast_L.xls')),XYR_fast_L);
                  
            subdirpath_fast_R = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','fast R',strcat('0',num2str(k), '*.xls'));
            fiels_fast_R = dir( subdirpath_fast_R );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels_fast_R )
                filepath_fast_R = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','fast R',fiels_fast_R( j ).name) ;
                data = xlsread(filepath_fast_R);
                LROLL_OVER_X_F_fast_R = data(:,1);
                LROLL_OVER_Y_F_fast_R = data(:,2);
                LROLL_OVER_X_AF_fast_R = data(:,3);
                LROLL_OVER_Y_AF_fast_R = data(:,4);
                LROLL_OVER_X_KAF_fast_R = data(:,5);
                LROLL_OVER_Y_KAF_fast_R = data(:,6);
                [xc_f_fast_R,yc_f_fast_R,r_f_fast_R]=circlefit(LROLL_OVER_X_F_fast_R,LROLL_OVER_Y_F_fast_R);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F_fast_R,LROLL_OVER_Y_F);
                XC_F_fast_R = [XC_F_fast_R;xc_f_fast_R];
                YC_F_fast_R = [YC_F_fast_R;yc_f_fast_R];
                R_F_fast_R=[R_F_fast_R;r_f_fast_R];
                %                 A_F=[A_F;a_f];
                [xc_af_fast_R,yc_af_fast_R,r_af_fast_R]=circlefit_2(LROLL_OVER_X_AF_fast_R,LROLL_OVER_Y_AF_fast_R);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF_fast_R = [XC_AF_fast_R;xc_af_fast_R];
                YC_AF_fast_R = [YC_AF_fast_R;yc_af_fast_R];
                R_AF_fast_R=[R_AF_fast_R;r_af_fast_R];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf_fast_R,yc_kaf_fast_R,r_kaf_fast_R]=circlefit_2(LROLL_OVER_X_KAF_fast_R,LROLL_OVER_Y_KAF_fast_R);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF_fast_R = [XC_KAF_fast_R;xc_kaf_fast_R];
                YC_KAF_fast_R = [YC_KAF_fast_R;yc_kaf_fast_R];
                R_KAF_fast_R=[R_KAF_fast_R;r_kaf_fast_R];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_fast_R=[XC_F_fast_R YC_F_fast_R R_F_fast_R XC_AF_fast_R YC_AF_fast_R R_AF_fast_R XC_KAF_fast_R YC_KAF_fast_R R_KAF_fast_R] ;
            XYR_fast_R_mean=mean(XYR_fast_R,1)./height;
            XYR_fast_R_var=var(XYR_fast_R,1)./height;
            fast_R_total_mean_var=[fast_R_total_mean_var;XYR_fast_R_mean XYR_fast_R_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','fast R'),'XYR')
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','fast R','XYR',strcat(num2str(k),'fast_R_total_mean_var.xls')),fast_R_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','fast R','XYR',strcat(num2str(k),'XYR_fast_R.xls')),XYR_fast_R); 

            subdirpath_normal_L = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','normal L',strcat('0',num2str(k), '*.xls'));
            fiels_normal_L = dir( subdirpath_normal_L );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels_normal_L )
                filepath_normal_L = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','normal L',fiels_normal_L( j ).name) ;
                data = xlsread(filepath_normal_L);
                LROLL_OVER_X_F_normal_L = data(:,1);
                LROLL_OVER_Y_F_normal_L = data(:,2);
                LROLL_OVER_X_AF_normal_L = data(:,3);
                LROLL_OVER_Y_AF_normal_L = data(:,4);
                LROLL_OVER_X_KAF_normal_L = data(:,5);
                LROLL_OVER_Y_KAF_normal_L = data(:,6);
                [xc_f_normal_L,yc_f_normal_L,r_f_normal_L]=circlefit(LROLL_OVER_X_F_normal_L,LROLL_OVER_Y_F_normal_L);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F_normal_L,LROLL_OVER_Y_F);
                XC_F_normal_L = [XC_F_normal_L;xc_f_normal_L];
                YC_F_normal_L = [YC_F_normal_L;yc_f_normal_L];
                R_F_normal_L=[R_F_normal_L;r_f_normal_L];
                %                 A_F=[A_F;a_f];
                [xc_af_normal_L,yc_af_normal_L,r_af_normal_L]=circlefit_2(LROLL_OVER_X_AF_normal_L,LROLL_OVER_Y_AF_normal_L);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF_normal_L = [XC_AF_normal_L;xc_af_normal_L];
                YC_AF_normal_L = [YC_AF_normal_L;yc_af_normal_L];
                R_AF_normal_L=[R_AF_normal_L;r_af_normal_L];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf_normal_L,yc_kaf_normal_L,r_kaf_normal_L]=circlefit_2(LROLL_OVER_X_KAF_normal_L,LROLL_OVER_Y_KAF_normal_L);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF_normal_L = [XC_KAF_normal_L;xc_kaf_normal_L];
                YC_KAF_normal_L = [YC_KAF_normal_L;yc_kaf_normal_L];
                R_KAF_normal_L=[R_KAF_normal_L;r_kaf_normal_L];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_normal_L=[XC_F_normal_L YC_F_normal_L R_F_normal_L XC_AF_normal_L YC_AF_normal_L R_AF_normal_L XC_KAF_normal_L YC_KAF_normal_L R_KAF_normal_L] ;
            XYR_normal_L_mean=mean(XYR_normal_L,1)./height;
            XYR_normal_L_var=var(XYR_normal_L,1)./height;
            normal_L_total_mean_var=[normal_L_total_mean_var;XYR_normal_L_mean XYR_normal_L_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','normal L'),'XYR')
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','normal L','XYR',strcat(num2str(k),'normal_L_total_mean_var.xls')),normal_L_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','normal L','XYR',strcat(num2str(k),'XYR_normal_L.xls')),XYR_normal_L);
                  
            subdirpath_L_normal_R = fullfile( maindir, subdir( i ).name,'Roll_Over_Shape','normal R',strcat('0',num2str(k), '*.xls'));
            fiels_normal_R = dir( subdirpath_L_normal_R );   % 在这个子文件夹下找后缀为jpg的文件
            for j = 1 : length( fiels_normal_R )
                filepath_normal_R = fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','normal R',fiels_normal_R( j ).name) ;
                data = xlsread(filepath_normal_R);
                LROLL_OVER_X_F_normal_R = data(:,1);
                LROLL_OVER_Y_F_normal_R = data(:,2);
                LROLL_OVER_X_AF_normal_R = data(:,3);
                LROLL_OVER_Y_AF_normal_R = data(:,4);
                LROLL_OVER_X_KAF_normal_R = data(:,5);
                LROLL_OVER_Y_KAF_normal_R = data(:,6);
                [xc_f_normal_R,yc_f_normal_R,r_f_normal_R]=circlefit(LROLL_OVER_X_F_normal_R,LROLL_OVER_Y_F_normal_R);
                %                 [xc_f,yc_f,r_f,a_f]=circlefit_2(LROLL_OVER_X_F_normal_R,LROLL_OVER_Y_F);
                XC_F_normal_R = [XC_F_normal_R;xc_f_normal_R];
                YC_F_normal_R = [YC_F_normal_R;yc_f_normal_R];
                R_F_normal_R=[R_F_normal_R;r_f_normal_R];
                %                 A_F=[A_F;a_f];
                [xc_af_normal_R,yc_af_normal_R,r_af_normal_R]=circlefit_2(LROLL_OVER_X_AF_normal_R,LROLL_OVER_Y_AF_normal_R);
                %                 [xc_af,yc_af,r_af,a_af]=circlefit_2(LROLL_OVER_X_AF,LROLL_OVER_Y_AF);
                XC_AF_normal_R = [XC_AF_normal_R;xc_af_normal_R];
                YC_AF_normal_R = [YC_AF_normal_R;yc_af_normal_R];
                R_AF_normal_R=[R_AF_normal_R;r_af_normal_R];
                %                 A_AF=[A_AF;a_af];
                [xc_kaf_normal_R,yc_kaf_normal_R,r_kaf_normal_R]=circlefit_2(LROLL_OVER_X_KAF_normal_R,LROLL_OVER_Y_KAF_normal_R);
                %                 [xc_kaf,yc_kaf,r_kaf,a_kaf]=circlefit_2(LROLL_OVER_X_KAF,LROLL_OVER_Y_KAF);
                XC_KAF_normal_R = [XC_KAF_normal_R;xc_kaf_normal_R];
                YC_KAF_normal_R = [YC_KAF_normal_R;yc_kaf_normal_R];
                R_KAF_normal_R=[R_KAF_normal_R;r_kaf_normal_R];
                %                 A_KAF=[A_KAF;a_kaf];
            end
            XYR_normal_R=[XC_F_normal_R YC_F_normal_R R_F_normal_R XC_AF_normal_R YC_AF_normal_R R_AF_normal_R XC_KAF_normal_R YC_KAF_normal_R R_KAF_normal_R];
            XYR_normal_R_mean=mean(XYR_normal_R,1)./height;
            XYR_normal_R_var=var(XYR_normal_R,1)./height;
            normal_R_total_mean_var=[normal_R_total_mean_var;XYR_normal_R_mean XYR_normal_R_var];
            mkdir(fullfile( maindir, subdir( i ).name ,'Roll_Over_Shape','normal R'),'XYR')
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','normal R','XYR',strcat(num2str(k),'normal_R_total_mean_var.xls')),normal_R_total_mean_var);
            xlswrite(fullfile(maindir, subdir( i ).name ,'Roll_Over_Shape','normal R','XYR',strcat(num2str(k),'XYR_normal_R.xls')),XYR_normal_R);
                  
        catch
            continue%假如上面的没法执行则执行continue,到下个循环
        end
    end
end

% file = 'G:\GAIT\ningxinyi\Roll_Over_Shape\fast L\01ningxinyi walking  fast 02L.xls';
% data = xlsread(file);
% x = data(:,5);
% y = data(:,6);
% 
% plot(x,y,'k','LineWidth',1.5);
% hold on;
% file = 'G:\GAIT\ningxinyi\Roll_Over_Shape\fast L\02ningxinyi wqalking fast 02L.xls';
% data = xlsread(file);
% x = data(:,5);
% y = data(:,6);
% plot(x,y,'b','LineWidth',1.5);
% hold on;
% file = 'G:\GAIT\ningxinyi\Roll_Over_Shape\fast L\03ningxinyi walking  fast 02L.xls';
% data = xlsread(file);
% x = data(:,5);
% y = data(:,6);
% plot(x,y,'g','LineWidth',1.5);
% hold on;
% file = 'G:\GAIT\ningxinyi\Roll_Over_Shape\fast L\04ningxinyi walking  fast 02L.xls';
% data = xlsread(file);
% x = data(:,5);
% y = data(:,6);
% plot(x,y,'r','LineWidth',1.5);
% title('Knee-ankle-foot roll-over shapes','Fontsize', 12)%Foot-shoe roll-over shapes Ankle-foot roll-over shapes
% figure_FontSize=8;
% set(gca, 'Fontname','Times New Roman','Fontsize', 8);
% xlabel('Foot X (mm)','fontsi',8,'FontWeight','bold','Fontname','Times New Roman');
% ylabel ('Foot Z (mm)','Fontname','Times New Roman','fontsi',8,'FontWeight','bold');%,'position', [-8 90]
% set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
% set(findobj('FontSize',8),'FontSize',figure_FontSize,'Fontname','Times New Roman');
% legend('Flat','R16','R18.5','R21','Fontname','Times New Roman','FontSize',8);
% set(gca, 'Box', 'off');
% saveas(gca,'figure.emf')