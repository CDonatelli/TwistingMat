% Casey Culligan, Cassandra Donatelli, Laney Strange, Eric Tytell
% BET Project: function "BETcalc.m"
% Tufts University
% Fall 2017

% To run: BETcalc

function [D, L, Dmax, Lmax] = BETcalc(angles, tvdot, dims, scale, BL)
    % To be used for AW calculation
    dims = scale.*dims./100;
    BL = scale*BL/100;

    [m1,n1] = size(tvdot);
    [m2,n2] = size(angles);

    % Adjusting tvdot array size (only if necessary, depends on struct)
    % Every fifth frame, downsampling, same number of columns
    if n1 > n2
        adjusted_tvdot = tvdot(:, 1:5:end);
        tvdotAngles = adjusted_tvdot(12:2:end, :);    
    else
        adjusted_tvdot = tvdot;
        tvdotAngles = adjusted_tvdot(12:2:end, :);
    end

    if length(tvdotAngles) > length(angles)
        tvdotAngles = tvdotAngles(:,1:end-1);                                          
    end

    % Drag coefficient calculation
    [CD] = 1.28 .* cos(angles);

    % Calculate Projected Area (AW, to be used in Drag and Lift equations)
    [m3,n3] = size(tvdotAngles);
    AW = zeros(5,1);
    dimsRel = dims(10:2:18,:);

    for i = 1:5
        AW(i) = ((2.*(BL/10).*(pi)) .* sqrt((1/2).*(((dimsRel(i,1))^2)+ ...
              (dimsRel(i,2))^2))+2.*(pi).*(dimsRel(i,2)).*(dimsRel(i,1)));
    end
    
    AW = repmat(AW,[1,n3]);
    
    % Find Projected Area
    littleL = (BL/10);
    littleH = repmat(dimsRel(:,2),[1,n3]);
    AP = littleL*( sin(angles).*littleH );
    
    % Find Drag
    % D = (1/2)(saltwater density)(drag coefficient)(tvdot)
    [D] = .5 .* 1027 .* CD .* tvdotAngles.^2 .* AW;

    % Find Lift Coefficient
    [CL] = 1.28 .* sin(angles);

    % Find Lift
    % LH = (1/2)(saltwater density)(angle of attack wobble)(tvdot)
    [L] = .5 .* 1027 .* CL .* tvdotAngles.^2 .* AW;

    % Calculating Dmax and Lmax so that stats can later be done on them
    [Dmax] = max(D,[],2);
    [Lmax] = max(L,[],2);
end