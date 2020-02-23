%exercise1SelectPointsWithMouse.m: map points from the reference TR to
%the reference TK.
%
%Select a point pR with the mouse left button. The script computes its 
%image. If the selected point is inside the reference triangle, then its
%image is on the triangle TK, of vertexs v1 = [1,1], v2 = [3,2], 
%v3 = [2,4]. In this case both points are marked with circles. Otherwise, 
%the image lies outside the triangle TK, and both points are marked with 
%squares. The user can repeat the process and draw as many points as she 
%wants. Click the right mouse button to end.
%
%Files required:
%baryCoordQuad.m
%Be sure it is placed in the current folder!

clearvars
close all

fmt=['Point %d:\n','pR = (%f, %f) in TR --> pK = (%f, %f) in TK\n',...
 'Barycentric coordinates of pR = (%f, %f)\n',...
    '\tw.r.t. the triangle TR, alphaR = (%f, %f, %f)\n',...
 'Barycentric coordinates of pK = (%f, %f)\n',...
    '\tw.r.t. the triangle TK, alphaK = (%f, %f, %f)\n'];

vertexsR = [0,0;
    1,0;
    0,1]; %vertexs of the reference triangle, R

vertexsK=[1,1; 
    3,2;
    2,4]; %vertexs on the triangle K

vplotR=[vertexsR;vertexsR(1,:)]; %Add the 1st. point at the last row,
vplotK=[vertexsK;vertexsK(1,:)]; %just to plot closed triangles. 

%plot the reference triangle, R, and point pR: 
hf=figure()
plot(vplotR(:,1),vplotR(:,2),'-','color','red')
hold on
axis equal
%plot triangle K; and point pK, the image of the point pR
plot(vplotK(:,1),vplotK(:,2),'-','color','blue')
marker = 'o';

point = 0;
while true
    [x,y,button]=ginput(1);
    if button ~= 1
        break
    end
    pR=[x,y];
    point = point + 1;
    [alphasR,isInside]=baryCoord(vertexsR,pR);
    
    if min(alphasR) < -1.0e-10
        marker = 's';
        %error('Please, select **only** points in the reference triangle!')
    end
    
    pK=alphasR*vertexsK; %image of pR on the triangle, K
    [alphasK,isInsideK] = baryCoord(vertexsK, pK);
    fprintf(fmt,point,pR,pK,pR,alphasR,pK,alphasK) 
    fprintf('...Click the right button to end\n\n')
    linePlot=[pR;pK];%to plot a line joining pR on R 
                     %and its image, pK on K

    plot(pR(1,1),pR(1,2),'o','Marker',marker,'MarkerFaceColor','red',...
         'MarkerEdgeColor','black','lineWidth',1)
    plot(pK(1,1),pK(1,2),'o','Marker',marker,'MarkerFaceColor','blue',...
        'MarkerEdgeColor','black','lineWidth',1)

    %Finaly, we plot a line joining pR and pK
    plot(linePlot(:,1),linePlot(:,2),'-','color','black')
    titleTxt = ['Image of the point $\hat{p} = ($',...
        num2str(pR(1,1)),', ',...
        num2str(pR(1,2)),'$)\in T^{R}\mapsto p = ($',...
        num2str(pK(1,1)),', ',...
        num2str(pK(1,2)),'$)\in T^{K}$'];
    title(titleTxt,'interpreter','LaTeX')
end
hold off