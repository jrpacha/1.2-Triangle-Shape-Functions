clearvars
close all

p = [0.83,0.7];

eval('meshHole')

numNodes = size(nodes,1);
numElem = size(elem,1);

T = (1:numNodes)'; %Temperatures at nodes

%plotElements(nodes, elem, numbering);
numbering = 0;
plotElementsOld(nodes, elem, numbering);
hold on
plot(p(1,1),p(1,2),'o','Marker','o','MarkerFaceColor','red');
hold off

for e = 1:numElem
    n1 = elem(e,1);
    n2 = elem(e,2);
    n3 = elem(e,3);   %Nodes of element e
    v1 = nodes(n1,:);
    v2 = nodes(n2,:);
    v3 = nodes(n3,:); %Vertexs of element e
    vertexs = [v1;v2;v3];
    [alphas, isInside]=baryCoord(vertexs, p);
    if isInside >= 1
        % Interpolate the temperature at point p
        elemPointP = e;
        nodesElemPointP = [n1,n2,n3];
        Tp = T(n1)*alphas(1) + T(n2)*alphas(2) + T(n3)*alphas(3);
        break;
    end
end

fprintf('Interpolated temperature: %.5e\n',Tp);
fprintf('Element: %d\n',elemPointP);
fprintf('Nodes: [%d, %d, %d]\n',nodesElemPointP);


    
    
    

