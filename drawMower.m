function mowerHandles = drawMower()

global position positionL positionR
global centreDrawHandle lDrawHandle rDrawHandle
hold on

centreDrawHandle = plot(position(1),position(2),'r*');
lDrawHandle = plot(positionL(1),positionL(2),'b*');
rDrawHandle = plot(positionR(1),positionR(2),'g*');

mowerHandles = [centreDrawHandle,lDrawHandle,rDrawHandle];
end