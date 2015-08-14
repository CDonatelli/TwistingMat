function [MTSData] = AnalyzeMTS ()

%     choice = menu('Do you want to calculate force per IVJ?', 'yes', 'no');
%     Options = [1, 0];
%     Method = Options(choice);

    prompt = {'SL of fish (mm):', ...
              'Average number of vertebrae (leave as 0 to ignore):',...
              'Number of MTS files', ...
              'Specimens to skip (enter 0 if none):',...
              'MTS file extension:',...
              'Row where data begins:',...
              'Column where data begins:',...
              'Specemin Prefix:',...
              'Guage length (mm):'};
    dlg_title = 'Enter the following information';
    num_lines = 1;
    def = {'0','0','0', '0', 'csv', '19', '0','Aflav','10'};
    answer = inputdlg(prompt, dlg_title, num_lines, def);
    
    SL = str2num(cell2mat(answer(1)));
    TotalVert = str2num(cell2mat(answer(2)));
    FileNum = str2num(cell2mat(answer(3)));
    Skip = str2num(cell2mat(answer(4)));
    Ext = cell2mat(answer(5));
    R = str2num(cell2mat(answer(6)));
    C = str2num(cell2mat(answer(7)));
    Pref = cell2mat(answer(8));
    Guage = str2num(cell2mat(answer(9)));
    
    if TotalVert == 0
        Verts = 0;
    else
        Verts = round((SL/TotalVert)*Guage);
    end
    
    waitfor(msgbox('Please select the directory containing your MTS files'));
    directory = uigetdir; % go to the directory containing the .avi file
    cd(directory);
    
    Files = dir([directory, ['\*.',Ext]]);
    if Skip == 0
        Files = Files;
    else
        Files(Skip) = [];
    end
    MaxLoad = [];
    for i = 1:length(Files)
        num = strfind(Files(i).name,'_'); num = Files(i).name(num+1:num+3);
        num = ['T_',num];
        MTSData.(num) = csvread(Files(i).name, R, C);
        Mat = MTSData.(num);
        [m,n] = size(Mat);
        for i = 1:m
            Mat(i,5) = (180 * acos(-( (Mat(i,2)^2)/(2*38.1^2)) + 1))/pi;
            if Verts == 0
                Mat = Mat;
            else
                Mat(i,6) = Mat(i,5)/Verts;
                Mat(i,7) = Mat(i,3)/Verts;
            end
        end
        MTSData.(num) = Mat;
        MaxLoad = [MaxLoad; prctile(Mat, 95)];
    end
    MTSData.MaxLoads = MaxLoad;
end




