clc;
clear all;

mdl_stanford
% Stifness values of links
k1 = 2.5*power(10,5);
k2 = 1.5*power(10,5);
k3 = 4*power(10,5);
k4 = 3.8*power(10,5);
k5 = 5.6*power(10,5);
k6 = 1.9*power(10,5);

% Torque Matrix
tou1 = 5;
tou2 = 4.8;
tou3 = 9;
tou4 = 2.3;
tou5 = 3.5;
tou6 = 7;

tou = [tou1; tou2; tou3; tou4; tou5; tou6];

% Angles - theta
t = stanf.theta;
t1 = t(1);
t2 = t(2);
t3 = t(3);
t4 = t(4);
t5 = t(5);
t6 = t(6);

% Link Lengths
dx = stanf.d;
disp(dx)
d2 = 1;
d3 = 1;

% Jacobian Matrix values
j11 = (-(d3*sin(t1)*sin(t2)) - (d2*cos(t1)));
j12 = d3*cos(t1)*cos(t2);
j13 = cos(t1)*cos(t2);
j21 = (d3*cos(t1)*sin(t2) - (d2*sin(t1)));
j22 = -(d3*sin(t1)*cos(t2));
j23 = sin(t1) * sin(t2);
j32 = -d3*sin(t2);
j33 = cos(t2);
j42 = -sin(t1);
j44 = cos(t1)*sin(t2);
j45 = ((-sin(t1)*sin(t4))+cos(t1)*cos(t2)*cos(t4));
j46 = ((sin(t1)*cos(t4)*sin(t5))+(cos(t1)*cos(t2)*sin(t4)*sin(t5))+((cos(t1)*sin(t2)*cos(t5))));
j52 = cos(t1);
j54 = sin(t1)*sin(t2);
j55 = ((cos(t1)*sin(t4)) + (sin(t1)*cos(t2)*cos(t4)));
j56 = ((-cos(t1)*cos(t4)*sin(t5))+(sin(t1)+cos(t2)*sin(t4)*sin(t5))+(sin(t1)*sin(t2)*cos(t5)));
j64 = cos(t2);
j65 = -sin(t2)*cos(t4);
j66 = ((-sin(t2)*sin(t4)*sin(t5))+(cos(t2)*cos(t5)));

% Construction of Jacobian Matrix
J = [j11 j12 j13 0 0 0;j21 j22 j23 0 0 0;0 j32 j33 0 0 0;0 j42 0 j44 j45 j46; 0 j52 0 j54 j55 j56;1 0 0 j64 j65 j66];
disp("Jacobian Matrix:");
display(J)

J_inv = inv(J);
J_trans = transpose(J);

% Formulation of Force Matrix
F = J_trans\tou;
disp("Force Matrix")
disp(F)

% Construction of Stiffness Matrix
k = [k1 k2 k3 k4 k5 k6];
k_in = diag(k);
display(k_in)

% Formulation of Compliance Matrix
Comp_matrix_1 = k_in*J_trans;
Comp_matrix = J_inv\Comp_matrix_1;
display(Comp_matrix)
stiffness_matrix = inv(Comp_matrix);
disp("Stiffness Matrix:")
disp(stiffness_matrix)
del_x = Comp_matrix * F;

new = transpose(del_x) * del_x; 

% Finding out the eigen values from Force Ellipsoid
B = transpose(Comp_matrix) * Comp_matrix;
[V, D] = eig(new);
disp("Eigen Values:");
disp(eig(new));
disp("Eigen Vectors of C^T*C:");
display(V)
disp("del_x^T * C^T * C * del_x = ");
disp(new)
lambda1 = max(eig(new));
lambda2 = min(eig(new));
display(lambda1)
display(lambda2)

major_axis = 1/sqrt(lambda1);
minor_axis = 1/sqrt(lambda2);

tiledlayout(1,1);
ax1 = nexttile;
ellipsoid(ax1,major_axis,minor_axis,0,2,1,1,50)
% ellipsoid(1, 1, 1, major_axis, minor_axis,1, 50)
axis equal
title('Force Ellipsoid constituted by Stiffness of Stanford Manipulator')
