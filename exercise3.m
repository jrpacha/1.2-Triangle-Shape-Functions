%exercise3: interpolate temperature in a triangle mesh

%Extra files required:
%meshHole.m: uncompress this file from meshFilesAll.rar
%plotTriangMesh.m: uncompress this file from additionalFiles.zip 
%baryCoord.m

%Be sure they are placed in the current folder!

%You can download meshFilesAll.rar and additionalFiles.zip from 
%Toni Susin's Numerical Factory.

clearvars
close all

p=[0.83,0.7];

eval('meshHole'); %load nodes position and connectivity matrices
                  %from the mesh file meshHole.m 

numNod=size(nodes,1); %number of nodes
numElem=size(elem,1); %number of elements
temp=1:numNod; %temperature at each node. Just an example!
temp=temp(:);

for e=1:numElem
    %vertexsElem=nodes(elem(e,:),:);
    n1=elem(e,1);
    n2=elem(e,2);
    n3=elem(e,3);
    v1=nodes(n1,:);
    v2=nodes(n2,:);
    v3=nodes(n3,:);
    vertexsElem=[v1;v2;v3];
    [alphasElem,isInside]=baryCoord(vertexsElem,p);
    if (isInside >= 1)
        break;       
    end
end

%Draw the mesh, and mark the point p and its element's nodes
figure()
plotTriangMesh(nodes,elem); %plot nodes and elements 
hold on
plot(p(1,1),p(1,2),'ro','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',5)
plot(vertexsElem(:,1),vertexsElem(:,2),'og','Marker','o',...
    'MarkerFaceColor','green','MarkerSize',4)
hold off

%Interpolate the temperature at point p
interpTemp=alphasElem(1)*temp(n1)+ ...
    alphasElem(2)*temp(n2)+ ...
    alphasElem(3)*temp(n3);
%interpTemp=alphasElem*temp(elem(e,:));

format short e
e
nods=[n1,n2,n3]
vertexsElem
interpTemp

%Fancy output with fprintf: don't try this at exams!
fprintf('Elem: %d\n',e)
fprintf('Nodes: %d,%d,%d\n',n1,n2,n3)
fprintf('%20s\n','Vertexs Coords.')
fprintf('%7s%11s\n','X','Y')
fprintf('%12.5e%12.5e\n',vertexsElem')
fprintf('\nInterpolated Temp.at point p=(%f,%f):\nT=%12.5e\n',...
    p,interpTemp);