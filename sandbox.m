clear
clc
close all

global boundaryPoints
boundaryPoints = [0,0;50,0;50,30;0,30;0,0];
figure
handoll = drawBoundary(boundaryPoints);
global direction
global position positionL positionR
direction = 0;


offset = [7,7];
position = [-2,0] + offset;   % x, y position
positionL = [-1,5]+ offset;
positionR = [1,5]+ offset;


while 1
    drawMower();
    pause(0.00000000001)
    clearMower()
    mowerForward(0.1)
    mowerRotate(-0.5)
    
    xp = position(1);
    yp = position(2);
    xv = boundaryPoints(:,1);
    yv = boundaryPoints(:,2);
    p_poly_dist(xp, yp, xv, yv);
    pdist([position(1),position(2);positionR(1),positionR(2)])
end
