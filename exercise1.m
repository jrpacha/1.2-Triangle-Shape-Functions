clearvars
close all
%Exercise 1.1: Point correspondence
%Consider now the obtained point on the Reference 
%Triangle pTR=(0.4,0.2) and compute the associated 
%point on the Original Triangle. Observe that the 
%barycentric coordinates are the same and the point 
%obtained is (2,2)

vertexsTR = [0,0;
    1,0;
    0,1]; %vertexs of the reference triangle

vertexs=[1,1; 
    3,2;
    2,4]; %vertexs on the triangle K

pTR=[0.4,0.2]; %point on the reference triangle
[alphasTR,isInside]=baryCoord(vertexsTR,pTR)
pK=alphasTR*vertexs %image of pTR on the triangle K
