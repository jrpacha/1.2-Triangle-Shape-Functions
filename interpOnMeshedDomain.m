% Interpolation on an meshed domain: meshHole

clearvars
close all
clc

eval('meshHole');

numNodes = size(nodes,1);
numElem = size(elem, 1);

p = [0.83, 0.7];
temp = 1:numNodes;

plotElementsOld(nodes, elem, 0)
hold on
plot(p(1,1), p(1,2), ...
    'Marker','o', ...
    'MarkerFaceColor', 'red', ...
    'MarkerEdgeColor', 'black', ...
    'MarkerSize', 5)
hold off

for e = 1:numElem
    nod1 = elem(e,1); %1st. global node of element e
    nod2 = elem(e,2); %2nd. global node of element e
    nod3 = elem(e,3); %3rd. global node of element e

    v1 = nodes(nod1,:); %v1 = (x1,y1): vertexs of 1st node
    v2 = nodes(nod2,:); %v2 = (x2,y2): vertexs of 2nd node
    v3 = nodes(nod3,:); %v3 = (x3,y3): vertexs of 3rd node

    % fprintf('Element %d\n', e)
    % fprintf('node 1: %3d vertex 1: %8.4e, %8.4e\n', nod1, v1);
    % fprintf('node 2: %3d vertex 2: %8.4e, %8.4e\n', nod2, v2);
    % fprintf('node 3: %3d vertex 3: %8.4e, %8.4e\n', nod3, v3);

    vertexs = [v1; v2; v3];

    [alphas, isInside] = baryCoord(vertexs, p);

    if isInside > 0
        fprintf('point p = [%f, %f] belongs to element %d\n', p,e)
        fprintf('nodes: %d, %d, %d\n', nod1, nod2, nod3);
        fprintf('vertexs:\n')
        fprintf('\t%12.4e%12.4e\n',vertexs')
        fprintf('Barycentric coods. of p, alphas = %8.4e, %8.4e, %8.4e\n', alphas)

        temp1 = temp(nod1); temp2 = temp(nod2); temp3 = temp(nod3);
        interpTemp = alphas(1)*temp1 + alphas(2)*temp2 + alphas(3)*temp3;

        fprintf('Interpolated temperature at the point, tempInterp = %.4f%c\n', ...
            interpTemp, char(176))
        break;
    end
end