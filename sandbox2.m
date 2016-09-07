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
radius = 1.1;

offset = [7,7];
position = [-2,0] + offset;   % x, y position
positionL = [-1,5]+ offset;
positionR = [1,5]+ offset;

mowerRotate(40);

drawMower();
findBorder();
disp('on border')

lastTurn = 'r';
while 1
    clearMower();
    rFlag = testSensor(positionR,radius);
    lFlag = testSensor(positionL,radius);
    
    if (rFlag == 1 && lFlag == 1)
        mowerForward(0.1);
        disp('f')
    end
    
    if (rFlag == 1 && lFlag == 0)
        %turn right
        while lFlag == 0
            clearMower();
            mowerRotate(1);
            drawMower();
            rFlag = testSensor(positionR,radius);
            lFlag = testSensor(positionL,radius);
            lastTurn = 'r';
            
        end
        disp(' r')
    elseif (rFlag == 0 && lFlag == 1)
        %turn left
        while rFlag == 0
            clearMower();
            mowerRotate(-1);
            drawMower();
            rFlag = testSensor(positionR,radius);
            lFlag = testSensor(positionL,radius);
            lastTurn = 'l';
            
        end
        disp('  l')
    end

    drawMower();
    pause(0.00000000001)
end