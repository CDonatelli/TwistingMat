% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "BETmain.m"
% Tufts University
% Fall 2017

% Main function to run functions on structs with fish data and write new
% data obtained to a new struct file
% To run:
% fishSpeciesNum_vidNumBET = BETmain(fishSpeciesNum_vidNum)

% NOTE: Having issues with some structs
% Issues: Ainsi2_1, Ainsi2_2, Ainsi2_4, Ainsi3_2, Ainsi3_5, Ainsi4_3,
% Ainsi4_4, Lsagi6_5, Rjord1_3, Rjord2_4, Rjord3_4, Xmuco3_1, Xmuco5_1

function [resultBET] = BETmain(structName)

resultBET.angles = angle_attack(structName.tailWobs);
resultBET.tvdot = calc_vel(structName.X, structName.Y, ...
                           structName.VidScale);
[resultBET.D, resultBET.L, resultBET.Dmax, resultBET.Lmax] = ...
                           BETcalc(resultBET.angles, resultBET.tvdot, ...
                           structName.imD, structName.ImScale, ...
                           structName.fishLength);
resultBET.wobble = structName.tailWobs;
end
