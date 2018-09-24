% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "averages.m"
% Tufts University
% Fall 2017

% Function to calculate average of max drags/lifts for each species

% To run:
% Run
% Change 'Name*' when running (names = who('Name*'))

% To plot:
% plot(Struct.datafield)
% hold on (if you wish to stay on same plot)
% Legend commands

% Gets all names in workspace starting with 'Aflav', 'Ainsi', 'Lsagi',
% 'Plaet', 'Rjord', and 'Xmuco' (must be run separately)
names = who('Xmuco*');

lifts = [];
drags = [];

% Want to show for each species what drag/lift look like
for i = 1:length(names)
    current = eval(names{i});
    % Adding columns (n trials)
    drags = [drags, current.Dmax];
    lifts = [lifts, current.Lmax];
end

dragAvg = mean(drags,2);
liftAvg = mean(lifts,2);