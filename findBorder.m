function findBorder()
radius = 1.1;
global positionL positionR
%rFlag = testSensor(positionR,radius);
%lFlag = testSensor(positionL,radius);
rVirgin = 1;
lVirgin = 1;
while (rVirgin == 1) || (lVirgin == 1)
    clearMower()
    mowerForward(0.1);
    drawMower();
    pause(0.00000000001)
    rFlag = testSensor(positionR,radius);
    lFlag = testSensor(positionL,radius);
    if lFlag == 1
        lVirgin = 0;
    end
    if rFlag == 1
        rVirgin = 0;
    end
end

disp('end')
end
