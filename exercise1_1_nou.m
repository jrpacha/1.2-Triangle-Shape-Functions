clearvars 
close all
%
% Exercise 1.1: Point correspondence
%
% Consider now the obtained point on the Reference Triangle
% pTR=(0.4,0.2) and compute the associated point on the
% Original Triangle. Observe that the  barycentric coordinates 
% are the same and the point obtained is (2,2)


% Triangle TR 
vertexsTR = [0,0;
    1,0;
    0,1];

% Add the first vertex at the end (just to plot it)
vertexsTRPlot = [vertexsTR; vertexsTR(1,:)];

pTR = [0.4, 0.2];  % point in the Reference triangle

% Triangle T
vertexsT = [1,1;
    3,2;
    2,4];

% Add the first vertex at the end (just to plot it) 
vertexsTPlot = [vertexsT; vertexsT(1,:)];

% compute its barycentric coordinates of pTR wrt the
% reference triangle TR
[alphasPTR, isInside] = baryCoord(vertexsTR, pTR);

% conpute the image of the map: the point p that has the
% same barycentric coordinates as pTR, but w.r.t. the 
% trinagle T
p = alphasPTR * vertexsT;

% Figure
% Plot the reference triangle, TR (in red)
plot(vertexsTRPlot(:,1),vertexsTRPlot(:,2),'-',...
    'color','red',...
    'LineWidth',1.5)
axis equal
hold on

% Plot the point pTR (filled in red)
plot(pTR(:,1),pTR(:,2),'o',...
    'Marker','o',...
    'MarkerFaceColor','red',...
    'MarkerSize',8)

% Plot triangle T (in blue)
plot(vertexsTPlot(:,1),vertexsTPlot(:,2),'-',...
    'color','blue',...
    'LineWidth',1.5)
hold on

% Plot the point p (filled in blue)
plot(p(:,1),p(:,2),'o',...
    'Marker','o',...
    'MarkerFaceColor','blue',...
    'MarkerSize',8)

% Finally, plot the line joining them (in black)
line = [pTR; p];
plot(line(:,1),line(:,2),'-','color','black')
hold off

clc
fprintf(['Exercise 1.1\n',...
    'The image of the point\n\t',...
    'pTR = (%f, %f)\n',...
    'on the reference triangle, TR, is the point\n\t',...
    'p = (%f, %f)\n',...
    'on the triangle T\n'],pTR, p)
