clearvars
close all

eval('meshHole')
numNod=size(nodes,1); %number of nodes
numElem=size(elem,1); %number of elements
temp=1:numNod; %temperature at each node
temp=temp';
p=[0.83,0.7];

figure()
plotTriangMesh(nodes,elem);
hold on
plot(p(1,1),p(1,2),'o','Marker','o',...
    'MarkerFaceColor','red','MarkerSize',6,...
    'lineWidth',2,'color','black')
hold off

for e=1:numElem
    vertexs=nodes(elem(e,:),:);
    [alphas,isInside]=baryCoord(vertexs,p);
    if (isInside >= 1)
        break;       
    end
end

tempP=alphas*temp(elem(e,:));
fprintf(1,'Interpolated temperture %.4f\n',tempP);
fprintf(1,'Element: %d\n',e);
fprintf(1,'Nods: %d, %d, %d\n',elem(e,:));