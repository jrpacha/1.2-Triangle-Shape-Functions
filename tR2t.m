clearvars
close all

vertexsR = [
    0, 0;
    1, 0;
    0, 1
    ];

pR = [0.2, 0.3]; %Point belongs to triangle R
pr = []

vertexsRPlot = [
    vertexsR;
    vertexsR(1,:)
    ];

vertexs = [
    1.0, 1.0;
    2.0, 3.0;
    0.75, 5.0
    ];

vertexsPlot = [
    vertexs;
    vertexs(1,:)
    
]

[alphasR,isInside] = baryCoord(vertexsR,pR)
p = alphasR*vertexs

line = [
    pR;
    p
    ];

%Plots

%Referece triangle, R
plot(pR(1,1), pR(1,2),'ro')
axis image
hold on
plot(vertexsRPlot(:,1),vertexsRPlot(:,2),'r-')

%Triangle T
plot(p(1,1), p(1,2),'bo')
hold on
plot(vertexsPlot(:,1),vertexsPlot(:,2),'b-')

plot(line(:,1), line(:,2),'g-')

hold off

pG = polyshape(vertexsR) 
[X,Y]=centroid(pG)