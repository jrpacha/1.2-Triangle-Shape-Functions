clearvars
close all
clc
fprintf('Exercise 2\n')

% Exercise 2: Several Triangles
%
% Let's consider now four triangles adding a central
% vertex (as it is shown in the figure). We can define 
% these polygons by the coordinates of the vertices 
% and the triangles defined by these vertices.

vertexs = [0, 0;
    1, 0;
    1, 1;
    0, 1;
    0.5, 0.5];

triang = [1, 2, 5;
    2, 3, 5;
    3, 4, 5;
    4, 1, 5];

% Use the function build in the previous exercise
% to decide to which triangle the point p = (0.8, 0.7)
% belongs.

p = [0.8, 0.7];

numElem = size(triang,1);

for e = 1: numElem
    n1 = triang(e,1); n2 = triang(e,2); n3 = triang(e,3);
    v1 = vertexs(n1,:); v2 = vertexs(n2,:); v3 = vertexs(n3,:);
    vertexsCurrentTriang = [v1; v2; v3];
    [alphas, isInside] = baryCoord(vertexsCurrentTriang,p);
    if isInside >= 1
        fprintf(['Point p = (%.4f, %.4f) belongs\n',... 
             'to triangle number %d\n'],p,e)
        break;
    end
end

% Finally, we plot the mesh and the point p
plotElementsOld(vertexs, triang, 1)
%plotElements(vertexs, triang, 1)
hold on
plot(p(:,1),p(:,2),'o',...
    'Marker','o',...
    'MarkerFaceColor','red',...
    'MarkerSize',8)
hold off





