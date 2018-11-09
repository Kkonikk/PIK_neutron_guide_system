function L2 = calc(L1,R)
%x0 = 2.549;y0 = -0.959; x1 = 13.573;y1 = -4.600;
x1 = 5;
phi = L1/R;
k = tan(phi)-1/(cos(phi))^2;
b1 = R/cos(phi);
y1 = k*x1+b1;
L2 = sqrt((x1-R*sin(phi))^2+(y1-R*cos(phi))^2);