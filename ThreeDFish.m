function [x,y,z] = ThreeDFish(FishSide, FishTop, X, Y)

for i = 1:41
[x, y, z] = ellipsoid(    X(i),          0,          Y(i),     ...
                           0,       FishSide(i,2),FishTop(i,2),...
                                                           30);
                                                       
surf(x, y, z);
hold on
end

end