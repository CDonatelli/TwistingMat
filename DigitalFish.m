function [XX, YY, ZZ] = DigitalFish(FishDim, FishLength)
% Takes in an array of heights and widths and generates a digital fish 
% comprised of elipses
% Assumes first column of FishDim is heights and second is widths
% units is the distance between each measurement
figure

    [m,n] = size(FishDim);
    YY = []; ZZ = []; XX = [];
    units = linspace(0,FishLength, m);
    
    for i = 1:m
       % Calculate the ellipse based on height and width at each point
       [X, Y] = calculateEllipse(0, 0, FishDim(i,1), FishDim(i,2), 0, m);    
       
       % X and Y from calculateEllipse will be the Y and Z axis of the
       % fish plot
       YY(:,i) = X; ZZ(:,i) = Y; 
       
       % Generate an array of the i-th number in the "units" vector
       % This will be the center of the ellipse
       
       for j = 1:m
           XX(j,i) = units(i);
       end

       plot3(XX(:,i), YY(:,i), ZZ(:,i));
       xlabel('X'); ylabel('Y'), zlabel('Z');
       hold on
       
    end

end