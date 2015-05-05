function Proj = SwimTest(FishDim, frames)

[m,n] = size(FishDim);
F = linspace(0,4*pi,frames);
yine = linspace(0,2*pi, m);
%angles = linspace(-45, 45, m);
% writerObj = VideoWriter('fishtest.avi'); % Name it.
% writerObj.FrameRate = 30; % How many frames per second.
% open(writerObj); 
fid = figure;
Fnames = [];
Proj = struct;

for i = 1:frames
   Fname = ['f', num2str(i)];
   zine = sin(yine+F(i));
   zine(1:5) = 0;
   angles = ((sin(yine+F(i)))*180)/pi;
   angles(1:5) = 0;
   [XX, YY, ZZ, bx, by] = FishEllipse(FishDim, angles, yine, zine, fid);
   frame = getframe(gcf);
%    writeVideo(writerObj, frame)
   figure(fid)
   Nx = [Fname, 'x'];
   Ny = [Fname, 'y'];
   Proj.(Nx) = bx;
   Proj.(Ny) = by;
   
end

% close(writerObj);