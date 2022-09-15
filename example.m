% Correspondence with the referenca triangle

TR = [0,0;
    1,0;
    0,1]; % Reference triangle

TK = [1,1;
    3,2;
    2,4];

p = [2,2];

[alphas,isInside]=baryCoord(TK,p);
alphas
q = alphas*TR

%plot the triangle K
TK1 = [TK;
    TK(1,:)];
plot(TK1(:,1),TK1(:,2),'-','Color','blue');
hold on

%plot the reference triangle
TR1 = [TR;
    TR(1,:)];
plot(TR1(:,1),TR1(:,2),'-','Color','red');
hold on

points = [p;q];

%plot the point p 
plot(points(1,1),points(1,2),'o','MarkerFaceColor','blue');
hold on

%plot the point q 
plot(points(2,1),points(2,2),'o','MarkerFaceColor','red');

%plot the line joining q and p
plot(points(:,1),points(:,2),'-','Color','black');




