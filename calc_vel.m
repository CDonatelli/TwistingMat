% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "calc_vel.m"
% Tufts University
% Fall 2017

% Function to calculate velocity (body segment) in the x and y direction
% To run: tvdot = calc_vel(Struct.X, Struct.Y, Struct.VidScale)

function [tvdot] = calc_vel(mxmm, mymm, vid_scale)

% Convert data to mm
mxmm = mxmm .* vid_scale ./1000;
mymm = mymm .* vid_scale ./1000;

% Smoothing of the data to reduce noise
for i = 1:20
   mxmm(i,:) = smooth(mxmm(i,:), 'rlowess', 25)';
   mymm(i,:) = smooth(mymm(i,:), 'rlowess', 25)';
end

% Derivative based on the frames per second in the video
framespersec = 120;
dt = 1 / framespersec;

% Velocity calculations
vx = diff(mxmm, 1, 2)/dt;
vy = diff(mymm, 1, 2)/dt;

% Derivative calculations
dx = diff(mxmm, 1, 1);
dy = diff(mymm, 1, 1);

% Variable mag introduced
mag = sqrt(dx.^2 + dy.^2);
tx = dx ./ mag;
ty = dy ./ mag;

% Making velocity matrices the same size so .* can be used
vx(:,end+1) = vx(:,end);
vy(:,end+1) = vy(:,end);

% Making time matrices the same size so .* can be used
tx(end+1,:) = tx(end,:);
ty(end+1,:) = ty(end,:);

tvdot = vx.*tx + vy.*ty;

tvdot1 = tvdot;
tvdot2 = abs(tvdot);
end
