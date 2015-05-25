function [XX, YY, ZZ, bx, by] = FishEllipse(FishDim, angles, yine, zine )%fid)
% Takes in an array of heights and widths and generates a fish comprised of
% elipses plotted in a 3D space
% Assumes first column is heights and second is widths
%
% Will be modified to take in angles? Assumed? Projected?
% figure(fid)

    [m,n] = size(FishDim);
    YY = []; ZZ = []; XX = []; bx = []; by = [];
    
    % Generates the wave motion of the fish
    %yine = linspace(0,2*pi, m); zine = sin(yine);
    
    % Generates the twisting/wobble
    %angles = linspace(-25, 25, m);
    
    for i = 1:m
       % Calculate the ellipse based on height and width at each point
       [X, Y] = calculateEllipse(yine(i), zine(i), FishDim(i,1), FishDim(i,2), angles(i), m);    
       
       % X and Y from calculateEllipse will be the Y and Z axis of the
       % fish plot
       YY(:,i) = X; ZZ(:,i) = Y;
       
       % Generate an array of the i-th number in the "wave motion" array
       % This will be the center of the ellipse
       for j = 1:m
           XX(j,i) = yine(i);
           pL(j) = zine(i);
       end
       ZZ(:,i) = ZZ(:,i)+pL';
       %ZZ(1:5,i) = 0;
       % Plot the ellipse      
%        subplot(2,1,1)
%        plot3(XX(:,i), YY(:,i), ZZ(:,i));
%        xlabel('X'); ylabel('Y'), zlabel('Z');
%        hold on
       
       bx(:,i) = XX(:,i); 
       by(:,i) = (ZZ(:,i)+pL')';
       
%        subplot(2,1,2)
       plot(bx(:,i), by(:,i), 'ro');
       xlabel('X'); ylabel('Z');
       hold on
    end
%     subplot(2,1,1)
%     hold off
%     
%     subplot(2,1,2)
%     hold off
end
