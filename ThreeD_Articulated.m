a1 = 1; a2 = 1; a3 = 2;
px = 2; py =3; pz=2;
phiDeg = 45; phi = phiDeg*pi/180;
wx = px - a3*cos (phi); 
wy = py - a3*sin(phi);
c2 = (wx*wx + wy*wy - a1*a1 - a2*a2)/ (2*a1*a2);
if c2 <= 1
    s2_1 = sqrt(1-c2*c2); 
    theta2_1 = atan2(s2_1,c2); 
    denom_1 = a1*a1 + a2*a2 + 2*a1*a2*cos(theta2_1);
    
    s1_1 = (wy*(a1+a2*cos(theta2_1))-a2*sin(theta2_1)*wx)/denom_1;
    c1_1 = (wx*(a1+a2*cos(theta2_1))+a2*sin(theta2_1)*wy)/denom_1;
    
    
    theta1_1 = atan2(s1_1, c1_1); theta3_1 = phi - theta1_1;
    
    display(rad2deg(theta1_1));
    display(rad2deg(theta2_1));
    display(rad2deg(theta3_1));
    
    
    ax_1 = a1*cos (theta1_1);
    ay_1 = a1*sin(theta1_1);
   
    bx = ax_1 + a2*cos(theta1_1 + theta2_1);by = ay_1 + a2*sin(theta1_1 + theta2_1); 

    cx = px; cy = py;

    xAxisArrayXCoords = [-2.5 2.5];xAxisArrayYCoords = [0 0];
    yAxisArrayXCoords = [0 0];yAxisArrayYCoords = [-2.5 2.5];

    link1XCoords_1 = [0 ax_1];link1YCoords_1 = [.5 ay_1];
    link2XCoords_1 = [ax_1 bx];link2YCoords_1 = [ay_1 by];
    link3XCoords = [bx px];link3YCoords = [by py];

   
    %plot(xAxisArrayXCoords,xAxisArrayYCoords,'black',yAxisArrayXCoords,yAxisArrayYCoords,'black' ...
    %,link1XCoords_1,link1YCoords_1,'red',link2XCoords_1,link2YCoords_1,'g',link3XCoords,link3YCoords,'b' );
   % hold on;
else
    disp("Not possible");
    return;
end

all_z=atan2(pz,px);
all_z_ang=rad2deg(all_z)

figure;
h = plot3(0,0,0);
p = get(h,'Parent');
xlim(p,'manual');
xlim(p,[0 3]);
ylim(p,'manual');
ylim(p,[0 3]);
zlim(p,'manual');
zlim(p,[0 3]);
axis vis3d;
grid on;
point1.x = 0;
point1.y = 0;
point1.z = 0;

point2.x = ax_1;
point2.y = ay_1;
point2.z = 1;

point3.x = bx;
point3.y = by;
point3.z = 1.2;

point4.x = px;
point4.y = py;
point4.z = pz;

l1= line([point1.x, point2.x],[point1.y,point2.y],[point1.z,point2.z],'Color','r','LineWidth',4);
l2 =line([point2.x, point3.x],[point2.y,point3.y],[point2.z,point3.z],'Color','b','LineWidth',4);
l3= line([point3.x, point4.x],[point3.y,point4.y],[point3.z,point4.z],'Color','c','LineWidth',4);

l1z= line([point1.x, point2.x],[point1.y,point2.y],[3,3],'Color','g','LineWidth',1); 
l1y= line([point1.x, point2.x],[3,3],[point1.z,point2.z],'Color','g','LineWidth',1);
l1x= line([3,3],[point1.y,point2.y],[point1.z,point2.z],'Color','g','LineWidth',1);
l1x.LineStyle='--';l1y.LineStyle='--';l1z.LineStyle='--';

l2z =line([point2.x, point3.x],[point2.y,point3.y],[3,3],'Color','g','LineWidth',1);
l2y =line([point2.x, point3.x],[3,3],[point2.z,point3.z],'Color','g','LineWidth',1);
l2x =line([3,3],[point2.y,point3.y],[point2.z,point3.z],'Color','g','LineWidth',1);
l2x.LineStyle='--';l2y.LineStyle='--';l2z.LineStyle='--';

l3z = line([point3.x, point4.x],[point3.y,point4.y],[3,3],'Color','g','LineWidth',1);
l3y = line([point3.x, point4.x],[3,3],[point3.z,point4.z],'Color','g','LineWidth',1);
l3x = line([3,3],[point3.y,point4.y],[point3.z,point4.z],'Color','g','LineWidth',1);
l3x.LineStyle='--';l3y.LineStyle='--';l3z.LineStyle='--';

%{
for i =0.1:0.1:5
    set(l,'ZData',[point1.z,i],'YData',[point1.y,i]);
    set(l1,'ZData',[i,point3.z],'YData',[i,point3.y]);
    pause(0.1);
end
%}
