% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: script "BatchBET.m"
% Tufts University
% Fall 2017

% Script that runs BETmain on all the structs and saves them as their 
% original name with BET concatenated at the end

varList = who;

for i = 1:length(varList)
    currentOrig = eval(varList{i});
    currentBET = BETmain(currentOrig);
    tempName = [[cell2mat(varList(i)),'BET'], '=currentBET'];
    eval(tempName);
end