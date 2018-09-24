% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: script "dataForStats.m"
% Tufts University
% Fall 2017

% Script that puts fish information gained from BETmain.m into a cell
% (that will later be converted to a CSV and have stats run on it)
% The table is organized as follows:
% Lift Drag Wobble NameofIndividual NameofSpecies
% More fields may be added as desired

C = {};

% varList = who;

for i = 1:length(varList)
    currentVar = eval(varList{i});
    lift = currentVar.Lmax(5);
    drag = currentVar.Dmax(5);
    wobble = max(currentVar.wobble(5,:));
    individual = cell2mat(varList(i));
    species = cell2mat(varList(i));
    
    C{i,1} = lift;
    C{i,2} = drag;
    C{i,3} = wobble;
    C{i,4} = individual(1:end-3);
    C{i,5} = species(1:end-6);
end



