# Stanford-Stiffness-Manipulator

## Stanford Manipulator
Stanford’s arm is an industrial robot with six degrees of freedom, designed in 1969. The Stanford’s arm is a serial manipulator whose kinematic chain consists of two revolute joints at the base, a prismatic joint, and a spherical joint. Because it includes several kinematic pairs, it is often used as an educational example in robot kinematics.

![photo_2022-12-02_12-30-50](https://user-images.githubusercontent.com/62557178/205234556-b4364210-5383-421a-a0e8-10341d2370c5.jpg)

This is the implementation of the forward kinematics problem for a 6-DOF Stanford Manipulator. The forward kinematics problem involves finding the end-tip position of a manipulator in a coordinate space given its joint parameters (i.e., joint angles for revolute joints and link offset for prismatic joints). This means that given a certain pose of a robotic arm, the xyz coordinates of the hand must be determined. The Stanford Manipulator for which we are considering is in its home configuration.
After obtaining the forward kinematics, we need to find the Jacobian matrix. By using the Jacobian matrix, we need to construct the stiffness matrix for the manipulator. A compliance matrix is then formulated and a force ellipsoid with the specified major and minor axis is acquired. We have out found the eigenvalues from the force ellipsoid.

## Outputs:

```
>>>stiffness_stanford.m

Jacobian Matrix:

J =

    1.0000    0.0000    0.0000         0         0         0
    1.0000    0.0000   -1.0000         0         0         0
         0   -1.0000    0.0000         0         0         0
         0    1.0000         0    0.0000   -1.0000   -0.0000
         0    0.0000         0   -1.0000   -0.0000   -1.0000
    1.0000         0         0    0.0000   -0.0000    1.0000

Force Matrix
    9.3000
   -9.0000
   -8.3000
   -3.5000
   -2.3000
    4.7000


k_in =

      250000           0           0           0           0           0
           0      150000           0           0           0           0
           0           0      400000           0           0           0
           0           0           0      380000           0           0
           0           0           0           0      560000           0
           0           0           0           0           0      190000


Comp_matrix =

   1.0e+05 *

    2.5000    2.5000   -0.0000    0.0000    0.0000    2.5000
    2.5000    6.5000   -0.0000    0.0000   -0.0000    2.5000
    0.0000   -0.0000    1.5000   -1.5000   -0.0000    0.0000
   -0.0000    0.0000   -1.5000    7.1000    0.0000    0.0000
   -0.0000    0.0000   -0.0000    0.0000    5.7000   -1.9000
    2.5000    2.5000    0.0000    0.0000   -1.9000    4.4000

Stiffness Matrix:
   1.0e-04 *

    0.1439   -0.0250   -0.0000    0.0000   -0.0263   -0.0789
   -0.0250    0.0250    0.0000    0.0000    0.0000    0.0000
   -0.0000    0.0000    0.0845    0.0179   -0.0000   -0.0000
    0.0000    0.0000    0.0179    0.0179   -0.0000   -0.0000
   -0.0263   -0.0000   -0.0000   -0.0000    0.0263    0.0263
   -0.0789   -0.0000   -0.0000   -0.0000    0.0263    0.0789

Eigen Values:
   2.0655e+13

Eigen Vectors of C^T*C:

V =

     1

del_x^T * C^T * C * del_x = 
   2.0655e+13


lambda1 =

   2.0655e+13


lambda2 =

   2.0655e+13

```

