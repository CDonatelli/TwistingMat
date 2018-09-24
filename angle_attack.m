% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "angle_attack.m"
% Tufts University
% Fall 2017

% Function that takes a list of wobbles and returns an array containing 
% the angles of attack generated using these wobble values 
% (wobble angle of attack)
% To run: angles = angle_attack(Struct.tailWobs)

function [angle_attack] = angle_attack(tailWobs)
    angle_attack = (tailWobs .* 90) .* (pi/180); % Convert to radians
end

