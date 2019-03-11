clearvars
close all
%Exercise 2: Several Triangles
%Let's consider now four triangles adding a central
%vertex (as it is shown in the figure). We can define 
%these polygons by the coordinates of the vertices 
%and the triangles defined by these vertices. Decide 
%which triangle the point p=(0.8,0.7) belongs to 
%

p = [0.8,0.7];

vertexs=[
    0,0;
    1,0;
    1,1;
    0,1;
    0.5,0.5;
    ];

triang=[
    1, 2, 5;
    2, 3, 5;
    3, 4, 5;
    4, 1, 5;
    ];

figure()
plotTriangMesh(vertexs,triang);
hold on
plot(p(1,1),p(1,2),'o','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',6,...
    'lineWidth',2,'color','black')
hold off

numTriang=size(triang,1);
for e=1:numTriang
    V=vertexs(triang(e,:),:);
    [alphas,isInside]=baryCoord(V,p);
    if (isInside >= 1)
        fprintf(1,'Point p belongs to triangle %d\n',...
            e);
        break;
    end
end

