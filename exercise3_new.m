%exercise3.m: interpolate temperature in a triangle mesh

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

eval('meshHole'); %load nodes position and connectivity matrix
                  %from file meshHole.m 

numNod=size(nodes,1); %number of nodes
numElem=size(elem,1); %number of elements
temp=1:numNod; %temperature at each node. Just an example!
temp=temp(:);

%Draw the mesh, and mark the point p and its element's nodes
plotElementsOld(nodes,elem,0); %third argument is 0: labels not shown
hold on
plot(p(1,1),p(1,2),'ro','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',5)

for e=1:numElem
    %vertexsElem=nodes(elem(e,:),:);
    n1=elem(e,1);
    n2=elem(e,2);
    n3=elem(e,3);
    v1=nodes(n1,:);
    v2=nodes(n2,:);
    v3=nodes(n3,:);
    vertexs=[v1;v2;v3];
    %plot(vertexs(:,1),vertexs(:,2),'og','Marker','o',...
    %     'MarkerFaceColor','green','MarkerSize',4)
    [alphasElem,isInside]=baryCoord(vertexs,p);
    title({['Barycentric coordinates of point P w.r.t. element ',...
        num2str(e)],['$\alpha = ($',num2str(alphasElem(1)),', ',...
        num2str(alphasElem(2)),', ',...
        num2str(alphasElem(3)),')']},'interpreter','LaTeX')
    if (isInside >= 1)
        elemP = e;
        nodsElem = [n1;n2;n3];
        vertexsElem = vertexs;
        interpTemp=alphasElem(1)*temp(n1)+ ... %Interpolate temp.
                   alphasElem(2)*temp(n2)+ ...
                   alphasElem(3)*temp(n3);
        fill(vertexs(:,1), vertexs(:,2),'red')
        break;       
    end
    fill(vertexs(:,1),vertexs(:,2),'green')
    pause(0.25);
end
hold off

%Fancy output with fprintf: don't try this at exams!
fprintf('-----------------------------------------------------\n')
fprintf('Fancy output, don''t try this at the exams!!\n')
fprintf('-----------------------------------------------------\n')
fprintf(1,'Point: p=(%f,%f)\n',p);
fprintf('Elem: %d\n',elemP)
fprintf('Nodes: %d,%d,%d\n',nodsElem)
fprintf('%20s\n','Vertexs Coords.')
fprintf('%7s%11s\n','X','Y')
fprintf('%12.5e%12.5e\n',vertexsElem')
fprintf('Interpolated Temp.: T(%f,%f) = %.4f%cC\n',...
        p,interpTemp,char(176))
fprintf('-----------------------------------------------------\n\n')    
% A faster way to show the results
fprintf('A faster way to show the results...\n')
format short e
p
elemP
nods=[n1,n2,n3]
vertexsElem
interpTemp