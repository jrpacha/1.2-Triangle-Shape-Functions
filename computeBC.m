%computeBC.m: compute barycantric coordinates of a point p w.r.t. a given
%triangle.

%Files required:
% baryCoordQuad.m

%Be sure it is placed in the current folder!

clearvars
close all

p=[2,2]; %point
vertexs=[1,1; %define the triangle vertex coordinates
    3,2;
    2,4];

figure()
vplot=[vertexs;vertexs(1,:)]; %just to plot the closed triangle,
                              %we add the 1st point at the last file
plot(vplot(:,1),vplot(:,2),'-b')
hold on
plot(p(1,1),p(1,2),'o','Marker','o','MarkerFaceColor','red','MarkerSize',6)
hold off

[alphas,isInside]=baryCoord(vertexs,p)

%Check the results
p-alphas*vertexs;

%Example: correspondence with the Reference Triangle
vertexsTR = [0,0;
    1,0;
    0,1];
figure()
plot(vplot(:,1),vplot(:,2),'-b')
axis equal
hold on
plot(p(1,1),p(1,2),'o','Marker','o','MarkerFaceColor','red',...
    'lineWidth',1,'color','black','MarkerSize',4) 
pTR=alphas*vertexsTR
vplotTR=[vertexsTR;vertexsTR(1,:)];
plot(vplotTR(:,1),vplotTR(:,2),'-r')
plot(pTR(1,1),pTR(1,2),'o','Marker','o','MarkerFaceColor','blue',...
    'lineWidth',1,'color','black','MarkerSize',4)
linePlot=[p;pTR]
plot(linePlot(:,1),linePlot(:,2),'g-')
hold off
