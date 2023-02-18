clearvars
close all
clc
fprintf('Exercise 3\n')

% Exercise 3.
%
% ShapeFunctions2D Pract: Interpolate Temperature in a
% Triangle Mesh
%

p = [0.83, 0.7];

load meshHole;

numNodes = size(nodes,1);
numElem = size(elem, 1);

temp = 1:numNodes; %assing the temperature at each note

for e = 1:numElem
    n1 = elem(e,1); n2 = elem(e,2); n3 = elem(e,3);
    v1 = nodes(n1,:); v2 = nodes(n2,:); v3 = nodes(n3,:);
    nodesCurrentTriang = [v1; v2; v3];
    [alphas, isInside] = baryCoord(nodesCurrentTriang,p);
    if isInside >= 1
        interpTemp = alphas(1)*temp(n1) + ...
            alphas(2)*temp(n2) + ...
            alphas(3)*temp(n3);
        fprintf(['For point p = (%.4f,%.4f):\n',... 
                 '      Element: %d\n',... 
                 '        nodes: %d, %d, %d\n',...
                 'Interp. temp.: %.4f%sC\n'],...
                 p,e,n1,n2,n3,interpTemp,char(176))
        break; 
    end
end

% Finally, we plot the mesh and the point p
plotElementsOld(nodes, elem, 0)
%plotElements(nodes, elem, p)
hold on
plot(p(:,1),p(:,2),'o',...
    'Marker','o',...
    'MarkerFaceColor','red',...
    'MarkerSize',8)
hold off





