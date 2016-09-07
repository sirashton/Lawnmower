function mowerForward(distance)

global position positionL positionR
global direction

radians = (direction/360)*2*pi;

addX = sin(radians) * distance;
addY = cos(radians) * distance;
addPos = [addX,addY];

position = position + addPos;
positionL = positionL + addPos;
positionR = positionR + addPos;

end
