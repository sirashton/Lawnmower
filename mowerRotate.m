function mowerRotate(angle)

global position positionL positionR
global direction

direction = direction + angle;
radians = (angle/360)*2*pi;
R = [cos(radians) -sin(radians); sin(radians) cos(radians)];
relPosL = positionL - position;
relPosL = relPosL * R;
positionL = relPosL + position;
relPosR = positionR - position;
relPosR = relPosR * R;
positionR = relPosR + position;

end