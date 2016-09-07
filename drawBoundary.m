function drawBoundary(boundaryCoords,boundaryHandle)   %Takes a vector of vectors and plots [x1,y1;x2,y2;....]

x = boundaryCoords(:,1);
y = boundaryCoords(:,2);

figure(
boundaryHandle = plot(x,y);

end