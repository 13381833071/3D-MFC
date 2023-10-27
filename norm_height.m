maindir = 'G:\GAIT';
subdir =  dir( maindir );   % 确定子文件夹
gait_cycle_timeLF=[];
gait_cycle_timeRF=[];
LF_gait_velocity=[];


for k=1:4
for i = 1 : length( subdir )
    if( isequal( subdir( i ).name, '.' ) ||  isequal( subdir( i ).name, '..' ) || ~subdir( i ).isdir )   % 如果不是目录跳过
        continue;
    end

    try
        gait_cycle_timeLF_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'gait_cycle_timeLF.xls'));
        gait_cycle_timeLF_fiels = dir( gait_cycle_timeLF_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( gait_cycle_timeLF_fiels )
            gait_cycle_timeLF_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',gait_cycle_timeLF_fiels( j ).name) ;
        end
        gait_cycle_timeLF = [gait_cycle_timeLF;xlsread(gait_cycle_timeLF_filepath)];%读取excel文件
        zxc=find(gait_cycle_timeLF>10);
        if(size(zxc,1)>0)
            i
        end
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        gait_cycle_timeRF_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'gait_cycle_timeRF.xls'));
%         gait_cycle_timeRF_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1gait_cycle_timeRF.xls' );
        gait_cycle_timeRF_fiels = dir( gait_cycle_timeRF_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( gait_cycle_timeRF_fiels )
            gait_cycle_timeRF_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',gait_cycle_timeRF_fiels( j ).name) ;
        end
        gait_cycle_timeRF = [gait_cycle_timeRF;xlsread(gait_cycle_timeRF_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        LF_gait_velocity_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'LF_gait_velocity.xls'));
%         LF_gait_velocity_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1LF_gait_velocity.xls' );
        LF_gait_velocity_fiels = dir( LF_gait_velocity_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( LF_gait_velocity_fiels )
            LF_gait_velocity_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',LF_gait_velocity_fiels( j ).name) ;
        end
        LF_gait_velocity = [LF_gait_velocity;xlsread(LF_gait_velocity_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
         RF_gait_velocity_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'RF_gait_velocity.xls'));
%         RF_gait_velocity_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1RF_gait_velocity.xls' );
        RF_gait_velocity_fiels = dir( RF_gait_velocity_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( RF_gait_velocity_fiels )
            RF_gait_velocity_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',RF_gait_velocity_fiels( j ).name) ;
        end
        RF_gait_velocity = [RF_gait_velocity;xlsread(RF_gait_velocity_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        LF_step_length_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'LF_step_length.xls'));
%         LF_step_length_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1LF_step_length.xls' );
        LF_step_length_fiels = dir( LF_step_length_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( LF_step_length_fiels )
            LF_step_length_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',LF_step_length_fiels( j ).name) ;
        end

        LF_step_length = [LF_step_length;xlsread(LF_step_length_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end


    try
        RF_step_length_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'RF_step_length.xls'));
%         RF_step_length_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1RF_step_length.xls' );
        RF_step_length_fiels = dir( RF_step_length_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( RF_step_length_fiels )
            RF_step_length_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',RF_step_length_fiels( j ).name) ;
        end
        RF_step_length = [RF_step_length;xlsread(RF_step_length_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        step_width_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'step_width.xls'));
%         step_width_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1step_width.xls' );
        step_width_fiels = dir( step_width_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( step_width_fiels )
            step_width_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',step_width_fiels( j ).name) ;
        end
        step_width = [step_width;xlsread(step_width_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        swing_timeLF_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'swing_timeLF.xls'));
%         swing_timeLF_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1swing_timeLF.xls' );
        swing_timeLF_fiels = dir( swing_timeLF_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( swing_timeLF_fiels )
            swing_timeLF_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',swing_timeLF_fiels( j ).name) ;
        end
        swing_timeLF = [swing_timeLF;xlsread(swing_timeLF_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        swing_timeRF_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'swing_timeRF.xls'));
%         swing_timeRF_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1swing_timeRF.xls' );
        swing_timeRF_fiels = dir( swing_timeRF_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( swing_timeRF_fiels )
            swing_timeRF_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',swing_timeRF_fiels( j ).name) ;
        end
        swing_timeRF = [swing_timeRF;xlsread(swing_timeRF_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        cadence_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'cadence.xls'));
%         cadence_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\1cadence.xls' );
        cadence_fiels = dir( cadence_subdirpath );   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( cadence_fiels )
            cadence_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',cadence_fiels( j ).name) ;
        end
        cadence = [cadence;xlsread(cadence_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        LMFC_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'LMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls'));
%         LMFC_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\LMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls' );
        LMFC_fiels = dir( LMFC_subdirpath);   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( LMFC_fiels )
            LMFC_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',LMFC_fiels( j ).name) ;
        end
        LMFC = [LMFC;xlsread(LMFC_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end

    try
        RMFC_subdirpath = fullfile( maindir, subdir( i ).name,'gait_para',strcat(num2str(k), 'RMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls'));
%         RMFC_subdirpath = fullfile( maindir, subdir( i ).name, '\gait_para\RMFC_Tradition MFC_New MFC_LOC MFC_velocity_mfc MFC_velocity TOE_OFF_LOC MFC_Tradition_time MFC_velocity_time TOE_OFF_time.xls' );
        RMFC_fiels = dir( RMFC_subdirpath);   % 在这个子文件夹下找后缀为jpg的文件
        for j = 1 : length( RMFC_fiels )
            RMFC_filepath = fullfile( maindir, subdir( i ).name ,'gait_para',RMFC_fiels( j ).name) ;
        end
        RMFC = [RMFC;xlsread(RMFC_filepath)];%读取excel文件
    catch
        continue%假如上面的没法执行则执行continue,到下个循环
    end    
end

mean_gait_cycle_timeLF=mean(gait_cycle_timeLF);
mean_gait_cycle_timeRF=mean(gait_cycle_timeRF);
mean_LF_gait_velocity=mean(LF_gait_velocity);
mean_RF_gait_velocity=mean(RF_gait_velocity);
mean_LF_step_length=mean(LF_step_length);
mean_RF_step_length=mean(RF_step_length);
mean_step_width=mean(step_width);
mean_swing_timeLF=mean(swing_timeLF);
mean_swing_timeRF=mean(swing_timeRF);
mean_cadence=mean(cadence);
mean_gait=[mean_gait_cycle_timeLF mean_gait_cycle_timeRF mean_LF_gait_velocity mean_RF_gait_velocity ...
    mean_LF_step_length mean_RF_step_length mean_swing_timeLF mean_swing_timeRF mean_step_width mean_cadence];

mean_LMFC=mean(LMFC);
mean_RMFC=mean(RMFC);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'mean_LMFC.xls')),mean_LMFC);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'mean_RMFC.xls')),mean_RMFC);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'mean_gait.xls')),mean_gait);

xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'LF_step_length.xls')),LF_step_length);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'RF_step_length.xls')),RF_step_length);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'step_width.xls')),step_width);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'gait_cycle_timeLF.xls')),gait_cycle_timeLF);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'gait_cycle_timeRF.xls')),gait_cycle_timeRF);
% xlswrite('G:\GAIT\total_results\gait_cycle_timeLF.xls',gait_cycle_timeLF);
% xlswrite('G:\GAIT\total_results\gait_cycle_timeRF.xls',gait_cycle_timeRF);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'LF_gait_velocity.xls')),LF_gait_velocity);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'RF_gait_velocity.xls')),RF_gait_velocity);
% xlswrite('G:\GAIT\total_results\LF_gait_velocity.xls',LF_gait_velocity);
% xlswrite('G:\GAIT\total_results\RF_gait_velocity.xls',RF_gait_velocity);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'swing_timeLF.xls')),swing_timeLF);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'swing_timeRF.xls')),swing_timeRF);
% xlswrite('G:\GAIT\total_results\swing_timeLF.xls',swing_timeLF);
% xlswrite('G:\GAIT\total_results\swing_timeRF.xls',swing_timeRF);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'cadence.xls')),cadence);
% xlswrite('G:\GAIT\total_results\cadence.xls',cadence);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'LMFC.xls')),LMFC);
xlswrite(fullfile('G:\GAIT\total_results',strcat(num2str(k),'RMFC.xls')),RMFC);

end

