%ShapeFunctions2D: Interpolate Temperature in a Triangle Mesh

%Extra files required:
%meshHole.m: uncompress this file from meshFilesAll.rar
%plotTriangMesh.m: uncompress this file from additionalFiles.zip 
%baryCoord.m

%Be sure they are placed in the current folder!

%You can download meshFilesAll.rar and additionalFiles.zip from 
%Toni Susin's Numerical Factory.

clearvars
close all

eval('meshHole'); %load nodes position and connectivity matrices
                  %from the mesh file meshHole.m 

numNod=size(nodes,1); %number of nodes
numElem=size(elem,1); %number of elements
temp=1:numNod; %temperature at each node. Just an example!
temp=temp';
p=[0.83,0.7];

figure()
plotTriangMesh(nodes,elem); %plot nodes and elements 
hold on
plot(p(1,1),p(1,2),'o','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',6,...
    'lineWidth',2,'color','black')
hold off

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

%Interpolate the temperature
%interpTemp=alphasElem*temp(elem(e,:));
interpTemp=alphasElem(1)*temp(n1)+ ...
    alphasElem(2)*temp(n2)+ ...
    alphasElem(3)*temp(n3);

fprintf(1,'Point p=[%f,%f]\n',p);
fprintf(1,'*Element: %d\n',e);
fprintf(1,'*Nodes: %d,%d,%d\n',n1,n2,n3);
fprintf(1,'*Interpolated Temp.: %.4f%cC\n',interpTemp,char(176));