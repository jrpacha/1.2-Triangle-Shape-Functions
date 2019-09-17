clearvars
close all
%Exercise 1.1: Point correspondence
%Consider now the obtained point on the Reference Triangle pR=(0.4,0.2) 
%and compute the associated point on the Original Triangle. Observe that 
%the barycentric coordinates are the same and the point obtained is (2,2)

vertexsR = [0,0;
    1,0;
    0,1]; %vertexs of the reference triangle, R

vertexsK=[1,1; 
    3,2;
    2,4]; %vertexs on the triangle K

pR=[0.4,0.2]; %point on the reference triangle, R
[alphasR,isInside]=baryCoord(vertexsR,pR)
pK=alphasR*vertexsK %image of pR on the triangle, K

linePlot=[pR;pK]; %to plot a line joining pR on R and its image, pK on K. 

vplotR=[vertexsR;vertexsR(1,:)]; %Add the 1st. point at the last row,
vplotK=[vertexsK;vertexsK(1,:)];  %just to plot closed triangles. 

%plot the reference triangle, R, and point pR: 
plot(vplotR(:,1),vplotR(:,2),'-','color',[1.0,0.5,0])
hold on
axis equal
plot(pR(1,1),pR(1,2),'o','Marker','square','MarkerFaceColor','magenta')

%plot triangle K; and point pK, the image of the point pR.
plot(vplotK(:,1),vplotK(:,2),'-','color','blue')
plot(pK(1,1),pK(1,2),'o','Marker','o','MarkerFaceColor','red')

%Finaly, we plot a line joining pR and pK.
plot(linePlot(:,1),linePlot(:,2),'-','color','green')
hold off