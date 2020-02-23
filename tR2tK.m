function tR2tK(vertexsK)
% tR2tK
%
% INPUT:
% vertexsK: 3x2 matrix. Each row holds a vertexs' coordinates of the 
%           triangle TK, i.e. if the vertexs of the triangle TK are 
%           v1 =[x1,y1], v2 = [x2,y2], and v3 = [x3,y3]; then 
%           vertexsK = [x1, y1; x2, y2; x3, y3].
%
% ACTIONS:
% The function draws the reference triangle TR, defined by the vertexs 
% [0,0;1,0;0,1], and the triangle with vertexsK, waits for the user to 
% select a point on TR with the mouse, then marks the selected point 
% and its image on TK with a circle, and joins both points with a line. 
% The user can drag the points thorugh the graphic window holding down the
% mouse button. Either the point has been selected outside the triangle 
% at the onset or it is dragged, the markers change from circles to boxes.
% The motion of the points ends when the user stops pressing the mouse 
% button. If later on, she press down the mouse button again, then the 
% former points (and the line) fade off and the new ones come up.
%
% References:
% I've stolen the method for tracking the mouse from professor Rafael 
% Ramírez; so all the credits must go to him! 

vertexsR = [0,0;
    1,0;
    0,1]; %vertexs of the reference triangle, TR

A=[ones(3,1),vertexsR];
C=A\eye(3); %To compute the barycentric coordinates

fig = figure;
ax = axes(fig);

%Plot the triangles
vplotR=[vertexsR;vertexsR(1,:)];
vplotK=[vertexsK;vertexsK(1,:)];
plot(vplotR(:,1),vplotR(:,2),'-','color','red');
hold on
axis equal
plot(vplotK(:,1),vplotK(:,2),'-','color','blue');
XL=xlim;
YL=ylim;  %we copy the limits of the current frame to keep it fixed
hold off

set(fig,'WindowButtonDownFcn',@startDraw)
uiwait(fig)

    function startDraw(src,~)
        cp = get(ax,'CurrentPoint');
        pR = [cp(1,1),cp(1,2)];
        Draw;
        set(src,'WindowButtonMotionFcn',@moveLines) %dragging
        set(src,'WindowButtonUpFcn',@endDraw)       %mouse button released
        function moveLines(~,~)
            cp = get(ax,'CurrentPoint');
            pR = [cp(1,1),cp(1,2)];
            Draw;
            %drawnow
        end
        function endDraw(src,~)
            set(src,'WindowButtonMotionFcn',[]) 
            set(src,'WindowButtonUpFcn',[])
            uiresume(fig)
        end
        function Draw
            alphas=[1,pR]*C;      %get the barycentric coordinades
            pK = alphas*vertexsK; %compute pK, the image of the point pR
            linepRpK = [pR;pK];
        
            if min(alphas) < -1.0e-10
                marker = 's';
            else
                marker = 'o';
            end
            
            %Draw the frame
            plot(vplotR(:,1),vplotR(:,2),'-','color','blue')
            hold on
            axis equal
            axis([XL,YL])
            plot(vplotK(:,1),vplotK(:,2),'-','color','red') 
            plot(pR(1,1),pR(1,2),'o','Marker',marker,...
                'MarkerFaceColor','blue','MarkerEdgeColor',...
                'black','lineWidth',1)
            plot(pK(1,1),pK(1,2),'o','Marker',marker,...
                'MarkerFaceColor','red','MarkerEdgeColor',...
                'black','lineWidth',1)
            plot(linepRpK(:,1),linepRpK(:,2),'-g');
            hold off
        end
    end
end