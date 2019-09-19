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

nodes=[
    0,0;
    1,0;
    1,1;
    0,1;
    0.5,0.5;
    ];

elem=[
    1, 2, 5;
    2, 3, 5;
    3, 4, 5;
    4, 1, 5;
    ];

figure()
plotTriangMesh(nodes,elem);%You can find this function in 
hold on
plot(p(1,1),p(1,2),'o','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',6,...
    'lineWidth',2,'color','black')
hold off

numElem=size(elem,1);
for e=1:numElem
    n1=elem(e,1);
    n2=elem(e,2);
    n3=elem(e,3);
    v1=nodes(n1,:);
    v2=nodes(n2,:);
    v3=nodes(n3,:);
    vertexsElem=[v1;v2;v3];
    [alphas,isInside]=baryCoord(vertexsElem,p);
    if (isInside >= 1)
        fprintf(1,'Point p=[%f,%f]\n*Elem: %d\n*Nodes: %d,%d,%d\n',...
            p,e,n1,n2,n3);
        break;
    end
end

%Interpolation of the temperature
temp=10:10:50; %Assume T(i)=10*e, e=1,2,3,4,5
interpTemp=temp(n1)*alphas(1)+temp(n2)*alphas(2)+temp(n3)*alphas(3);
fprintf('*Interpolated temp.: %.4f%cC\n',interpTemp,char(176));


