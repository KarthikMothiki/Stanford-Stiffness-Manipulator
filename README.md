# Stanford-Stiffness-Manipulator

## Done By: 
- Gangi Sravan Kumar Yadav - 123012010
- Karthik Mothiki - 123012019
- Pranav ANV - 123012030

## Stanford Manipulator
Stanford’s arm is an industrial robot with six degrees of freedom, designed in 1969. The Stanford’s arm is a serial manipulator whose kinematic chain consists of two revolute joints at the base, a prismatic joint, and a spherical joint. Because it includes several kinematic pairs, it is often used as an educational example in robot kinematics.

![photo_2022-12-02_12-30-50](https://user-images.githubusercontent.com/62557178/205234556-b4364210-5383-421a-a0e8-10341d2370c5.jpg)

This is the implementation of the forward kinematics problem for a 6-DOF Stanford Manipulator. The forward kinematics problem involves finding the end-tip position of a manipulator in a coordinate space given its joint parameters (i.e., joint angles for revolute joints and link offset for prismatic joints). This means that given a certain pose of a robotic arm, the xyz coordinates of the hand must be determined. The Stanford Manipulator for which we are considering is in its home configuration.
After obtaining the forward kinematics, we need to find the Jacobian matrix. By using the Jacobian matrix, we need to construct the stiffness matrix for the manipulator. A compliance matrix is then formulated and a force ellipsoid with the specified major and minor axis is acquired. We have out found the eigenvalues from the force ellipsoid.

## Outputs:

### ![stiffness_stanford.m](https://github.com/KarthikMothiki/Stanford-Stiffness-Manipulator/blob/main/matlab-codes/stanford_stiffness.m)
After executing the stiffness_stanford.m code this will be the output

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
   1.0e+12 *

    1.0148
    0.3751
    0.0023
    0.0584
    0.0126
    0.5590

Eigen Vectors of C^T*C:

V =

    0.4088    0.1381   -0.8097   -0.3979    0.0000    0.0000
    0.6780    0.3981    0.1115    0.6079   -0.0000    0.0000
   -0.0000    0.0000    0.0000   -0.0000   -0.9699   -0.2434
    0.0000   -0.0000    0.0000   -0.0000   -0.2434    0.9699
   -0.2434    0.8851    0.1972   -0.3443   -0.0000    0.0000
    0.5604   -0.1978    0.5414   -0.5947    0.0000   -0.0000

del_x^T * C^T * C * del_x = 
   1.0e+11 *

    1.8750    2.8750   -0.0000    0.0000   -0.4750    2.3500
    2.8750    5.4750   -0.0000    0.0000   -0.4750    3.3500
   -0.0000   -0.0000    0.4500   -1.2900   -0.0000   -0.0000
    0.0000    0.0000   -1.2900    5.2660    0.0000    0.0000
   -0.4750   -0.4750   -0.0000    0.0000    3.6100   -1.9190
    2.3500    3.3500   -0.0000    0.0000   -1.9190    3.5470


lambda1 =

   1.0148e+12


lambda2 =

   2.3430e+09

```

### Simulink Video:


https://user-images.githubusercontent.com/62557178/205236577-a0712b32-8e06-4577-b5e2-bd4ead6a4dfc.mp4

### Force Ellipsoid:
![force_ellipsoid](https://user-images.githubusercontent.com/62557178/205236717-ae95c26a-c945-4f46-8606-890256429195.png)

