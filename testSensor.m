function result = testSensor(position,radius) %returns a 1 if in range

global boundaryPoints

xp = position(1);
yp = position(2);
xv = boundaryPoints(:,1);
yv = boundaryPoints(:,2);
dist = abs(p_poly_dist(xp, yp, xv, yv));
if dist < radius
    result = 1;
else
    result = 0;
end