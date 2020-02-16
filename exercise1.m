%exercise1.m: point correspondence

%Consider now the obtained point on the Reference Triangle pR=(0.4,0.2) 
%and compute the associated point on the Original Triangle. Observe that 
%the barycentric coordinates are the same and the point obtained is (2,2)

%Files required:
% baryCoordQuad.m

%Be sure it is placed in the current folder!

clearvars
close all

vertexsR = [0,0;
    1,0;
    0,1]; %vertexs of the reference triangle, R

vertexsK=[1,1; 
    3,2;
    2,4]; %vertexs on the triangle K

pR=[0.4,0.2]; %point on the reference triangle, R
[alphasR,isInside]=baryCoord(vertexsR,pR)
pK=alphasR*vertexsK %image of pR on the triangle, K

fmt=['pR = (%f, %f) in TR --> pK = (%f, %f) in TK\n',...
 'Barycentric coordinates of pR = (%f, %f)\n',...
    '\tw.r.t. the triangle TR, alphaR = (%f, %f, %f)\n',...
 'Barycentric coordinates of pK = (%f, %f)\n',...
    '\tw.r.t. the triangle TK, alphaK = (%f, %f, %f)\n'];

[alphasK,isInsideK] = baryCoord(vertexsK, pK);
fprintf(fmt,pR,pK,pR,alphasR,pK,alphasK) %Barycebtric coordinates of point 
                                         %pK w.r.t. triangle TK 

linePlot=[pR;pK]; %to plot a line joining pR on R and its image, pK on K

vplotR=[vertexsR;vertexsR(1,:)]; %Add the 1st. point at the last row,
vplotK=[vertexsK;vertexsK(1,:)];  %just to plot closed triangles. 

%plot the reference triangle, R, and point pR: 
plot(vplotR(:,1),vplotR(:,2),'-','color','black')
hold on
axis equal
plot(pR(1,1),pR(1,2),'o','Marker','o','MarkerFaceColor','blue',...
    'MarkerEdgeColor','black','lineWidth',1)

%plot triangle K; and point pK, the image of the point pR
plot(vplotK(:,1),vplotK(:,2),'-','color','black')
plot(pK(1,1),pK(1,2),'o','Marker','o','MarkerFaceColor','red',...
    'MarkerEdgeColor','black','lineWidth',1)

%Finaly, we plot a line joining pR and pK
plot(linePlot(:,1),linePlot(:,2),'-','color','black')
titleTxt = ['Image of the point $\hat{p} = ($',num2str(pR(1,1)),', ',...
    num2str(pR(1,2)),'$)\in T^{R}\mapsto p = ($',num2str(pK(1,1)),', ',... 
    num2str(pK(1,2)),'$)\in T^{K}$'];
title(titleTxt,'interpreter','LaTeX')

hold off