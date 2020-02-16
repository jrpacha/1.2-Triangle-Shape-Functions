% Exercise2.m: Several Triangles

% Let's consider now four triangles adding a central vertex (as it is 
% shown in the figure). We can define these polygons by the coordinates
% of the vertices and the triangles defined by these vertices. Then:

% 1.-Decide to which triangle belongs the point p=(0.8,0.7).
% 2.-Assume the temperature at the vertex placed at the point (x,y), 
% T(x,y), is T(0,0)=10ºC, T(1,0)=20ºC, T(1,1)=30ºC, T(0,1)=40ºC, and 
% T(0.5,0.5)=50ºC. Then, compute the interpolated temperature at point p.

% Files required:

% plotElements.m: uncompress this file from additionalFiles.zip 
% baryCoord.m

% Be sure they're placed in the current folder!

% You can download meshFilesAll.rar and additionalFiles.zip from Toni
% Susin's Numerical Factory.

clearvars
close all

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
    4, 1, 5
    ];

temp=10:10:50; %Temperatures at the nodes, according to the stated 
               %global numeration.
               
figure()
plotElements(nodes,elem,1);
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
    vertexs=[v1;v2;v3];
    [alphas,isInside]=baryCoord(vertexs,p);
    if isInside >= 1
        elemP = e;
        nodsElem = [n1;n2;n3];
        vertexsElem = vertexs;
        interpTemp = alphas(1)*temp(n1) + ... %Interpolate temp.
                     alphas(2)*temp(n2) + ...
                     alphas(3)* temp(n3);
        break;
    end
end

%Fancy output with fprintf: don't try this at exams!
fprintf('-----------------------------------------------------\n')
fprintf('Fancy output, don''t try this at the exams!!\n')
fprintf('-----------------------------------------------------\n')
fprintf('Point: p=(%f,%f)\n',p)
fprintf('Elem: %d\n',e)
fprintf('Nodes: %d,%d,%d\n',nodsElem)
fprintf('%20s\n','Vertexs Coords.')
fprintf('%7s%11s\n','X','Y')
fprintf('%12.5e%12.5e\n',vertexsElem')
fprintf('Interpolated Temp.: T(%f,%f) = %.4f%cC\n',...
          p,interpTemp,char(176));
fprintf('-----------------------------------------------------\n\n')      
% A faster way to show the results
fprintf('A faster way to show the results...\n')
format short e
p
elemP
nods=[n1,n2,n3]
vertexsElem
interpTemp