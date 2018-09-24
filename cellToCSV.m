% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "celltoCSV.m"
% Tufts University
% Fall 2017

% Script to convert cell data with fish information to a text file (will
% be uploaded to Jump so that stats can be run on it/plots can be made)

fileID = fopen('celldata.csv','w');
formatSpec = '%d %d %d %s %s\n';

[nrows,ncols] = size(C);
for row = 1:nrows
    fprintf(fileID,formatSpec,C{row,:});
end

fclose(fileID);