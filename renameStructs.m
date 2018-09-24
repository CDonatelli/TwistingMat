% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: script "renameStructs.m"
% Tufts University
% Fall 2017

% Script to rename files from Struct to their actual names (i.e.
% Struct to Aflav1_1) when they are uploaded to the workspace

currentFolder = dir;

for i = 3:length(currentFolder)
    load(currentFolder(i).name);
    tempName = [currentFolder(i).name(1:end-4), '=Struct'];
    eval(tempName);
end