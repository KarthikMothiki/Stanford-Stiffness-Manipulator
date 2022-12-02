# Stiffness computation and stiffness map generation for the 6-DOF manipulator

## Matlab Code Explaination
In this File: stiffness_stanford.m we are going to compute the Stiffness matrix and plot Force Ellipsoid from the given inputs.

First to execute the code you need to have 
- Robotics Toolbox 
- Control System Toolbox

After installing them in your system, you are free to execute the code. Here's few things you need to understand while working on this code.

```
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
```

In the above code the line **mdl_stanford** loads the code of Stanford Manipulator from Robotics Toolbox. Make sure that you add the file to the same folder.

```
% Angles - theta
t = stanf.theta;
```

After loading the file we're using the theta values from the mdl_stanford code into our code via *"."* operator

```
Comp_matrix = J_inv\Comp_matrix_1;
```

The above equation represensts *inv(Comp_matrix_1) * J_inv*. This is done to reduce the computation and get exact values with precision.

These are few lines that needs a bit of explaination.
