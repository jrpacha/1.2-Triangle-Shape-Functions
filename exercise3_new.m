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
    [alphas,isInside]=baryCoord(vertexs,p);
    title({['Barycentric coordinates of point P w.r.t. element ',...
        num2str(e)],['$\alpha = ($',num2str(alphas(1)),', ',...
        num2str(alphas(2)),', ',...
        num2str(alphas(3)),')']},'interpreter','LaTeX')
    if (isInside >= 1)
        elemP = e;
        nodsElem = [n1;n2;n3];
        vertexsElem = vertexs;
        interpTemp=alphas(1)*temp(n1)+ ... %Interpolate temp.
                   alphas(2)*temp(n2)+ ...
                   alphas(3)*temp(n3);
        fill(vertexs(:,1), vertexs(:,2),'red') % fill the element in red
        % Write for the element holdig the point P, its nodes and their
        % coordinates
        fprintf(1,'Point: p=(%f,%f)\n',p);
        fprintf('Elem: %d\n',elemP)
        fprintf('Nodes: %d,%d,%d\n',nodsElem)
        fprintf('%20s\n','Vertexs Coords.')
        fprintf('%7s%11s\n','X','Y')
        fprintf('%12.5e%12.5e\n',vertexsElem')
        fprintf('Interpolated Temp.: T(%f,%f) = %.4f%cC\n',...
            p,interpTemp,char(176))
        break;       
    end
    fill(vertexs(:,1),vertexs(:,2),'green') % fill the element in green
    pause(0.25);
end
hold off