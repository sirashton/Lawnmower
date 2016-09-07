function test()
clear
clc
close all

drawSetup()
global drawSpace

global position positionL positionR
position = [-2,0];   % x, y position
positionL = [-1,5];
positionR = [1,5];
direction = 0;      %degress clockwise from north
finishedPerim = 1;
sensorR = 0;        %0 not near
sensorL = 0;        %1 near
sensorBR = 1;
motor = 0;
distanceStep = 1;
rotationStep = (1/360)*2*pi;

stepSize = 0.51; %unit of distance / time
%boundary = [[0,0],[50,0],[50,30],[0,30]];

    while (finishedPerim == 0);
        %test sensors

        if (sensorR == sensorL == sensorBR == 1);
            %move forwards
            addX = cos(direction) * distanceStep;
            addY = sin(direction) * distanceStep;
            addPos = [addX,addY];
            position = position + addPos;
            positionL = positionL + addPos;
            positionR = positionR + addPos;
        elseif (sensorR == 1) and (sensorL == 0);
            %stop
            %rotate right
            while (sensorL == 0);
                direction = direction + 1;
                R = [cos(rotationStep) -sin(rotationStep); sin(rotationStep) cos(rotationStep)];
                relPosL = positionL - position;
                relPosL = relPosL * R;
                positionL = relPosL + position;
                relPosR = positionR - position;
                relPosR = relPosR * R;
                positionR = relPosR + position;
            end
            %until 1,1,1
        elseif (sensorR == 0) and (sensorL == 1);
            %stop
            %rotate left

            direction = direction - 1;
            rotationStep = -rotationStep;
            R = [cos(rotationStep) -sin(rotationStep); sin(rotationStep) cos(rotationStep)];
            relPosL = positionL - position;
            relPosL = relPosL * R;
            positionL = relPosL + position;
            relPosR = positionR - position;
            relPosR = relPosR * R;
            positionR = relPosR + position;
            while (sensorR == 0);
                direction = direction - 1;
            end
            rotationStep = -rotationStep;
            %until 1,1,1
        end



        %calc new position
            %calc position of sensors
        %store
        %test sensors
        %decide the turn / straight / stop
        %if two on edge store position in boundary


        % repeat until full loop

        %delete(h(finishedPerim))
        %drawAll()
        pause(stepSize);
    end

function drawAll()

global position positionL positionR
hold on

x = [ 0,50,50, 0, 0];
y = [ 0, 0,30,30, 0];
drawSpace = figure('Name','This Window','Visible','Off');
plot(x,y,'.-');
xlim([-10 60]);
ylim( [-10 40]);
centreDrawHandle = plot(position(1),position(2),'r*');
lDrawHandle = plot(positionL(1),positionL(2),'b*');
rDrawHandle = plot(positionR(1),positionR(2),'g*');

drawnow

function drawMower()

global position positionL positionR
hold on

% viewer = figure;
% figure(viewer)

plot(position(1),position(2),'r*')
Lpos = plot(positionL(1),positionL(2),'b*');
plot(positionR(1),positionR(2),'g*')

drawnow

