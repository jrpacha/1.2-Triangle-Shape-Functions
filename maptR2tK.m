%maptR2tK: call the function tR2tK, that maps points from the reference
%triangle TR, of vertexs u1 = [0,0], u2 = [1,0], and u3 = [0,1]; to the
%reference given by the tirangle TK, of vertexs v1 = [1,1]; v2 = [3,2],
% and v3 = [2,4].
clearvars 
close all

%Vertexs of the triangle TK, onto which the reference triangle is mapped.
triangleK=[1,1; 
     3,2;
     2,4]; %vertexs on the triangle K
 
%Call the function tR2tK, to draw the triangles tR, tK and allow the user 
%to select the point and drag it through the plane
tR2tK(triangleK)

