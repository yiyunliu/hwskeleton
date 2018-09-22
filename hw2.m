## HW 2
# Author: Yiyun Liu
#
# In case you are wondering, this homework is published with GNU
# Octave. Some of the code here might not be compatible with
# Matlab.

## 3.9
# First we define the matrix representing the vertices

M = [6 3 1; 4 1 1; 7 1 1]'
##
# and the parameterized translation/rotation matrices in 2D
R2D = @(theta) [cos(theta) -sin(theta) 0;
                sin(theta) cos(theta) 0;
                0 0 1]

T2D = @(x,y) [1 0 x;
              0 1 y;
              0 0 1]
##
# Now we can compute the transformation, and apply it to the
# points. 
trans39 = T2D(8,2) * R2D(pi/3) * T2D(-8,-2)
points39 = trans39 * M
figure(1);
hold on;
plot(points39(1,:),points39(2,:),'*b',"markersize",15);
plot([8],[2], '*g',"markersize",15);
plot(M(1,:),M(2,:),'*r',"markersize",15);
axis([-10 10 -10 10],"square");
hold off;
##
# The green point is the origin of rotation. The red/blue
# represent the before/after.

## 3.20
# Now we're in 3D, so we need to define the 3D versions accordingly.
# I copy/pasted the RY from textbook.
RY = @(theta) [cos(theta) 0 sin(theta) 0;
               0 1 0 0;
               -sin(theta) 0 cos(theta) 0;
               0 0 0 1]

T = @(x,y,z) [1 0 0 x;
              0 1 0 y;
              0 0 1 z;
              0 0 0 1]

##
# We do as what the problem says. Since we are rotating with direction
# opposite to the y-axis, we rotate the negation of $2\pi/3$

trans320 = T(-2,0,4) * RY(-2*pi/3) * T(2,0,-4)

## 3.23
# Observe that $A$ is on the zy-plane the angle between $A$ and $z$ axis is $\pi/6$, which
# can be calculated in the following way:
A = [0 1 sqrt(3)]';
Z = [0 0 1]';
acos(dot(A/norm(A),Z));


RX = @(t) [1 0 0 0;
           0 cos(t) -sin(t) 0;
           0 sin(t) cos(t) 0;
           0 0 0 1]

RZ = @(t) [cos(t) -sin(t) 0 0;
           sin(t) cos(t) 0 0;
           0 0 1 0;
           0 0 0 1]

trans323 =  RX(-pi/6) * RZ(pi/3)* RX(pi/6)

## 3.25
# First we define the matrix P, as given in text book
P = @(d) [1 0 0 0;
          0 1 0 0;
          0 0 0 0;
         0 0 -1/d 1]

##
# (a)
#
# To rotate the y-axis to the z-axis, we simply rotate around x-axis
# by $\pi/2$
trans325a = RX(-pi/2) * P(10) * RX(pi/2)

##
# (b)
M = [1 2 3 1; 4 -1 0 1; 5 2 3 1]'
points325b = trans325a * M


## 3.28
# (a) $-1/d$ converges to $0$ when $d$ goes to infinity, and therefore
# we have
PInfty = [1 0 0 0;
          0 1 0 0;
          0 0 0 0;
          0 0 0 1]
##
# (b)
#
# $P_\infty \begin{bmatrix}x \\ y \\ z \\ 1\end{bmatrix} = \begin{bmatrix}x \\ y \\ 0 \\ 1\end{bmatrix}$
#
# It simply discard the $z$, and hence the information about
# objects' distance is completely lost. Two objects, no matter their
# $z$ value, will be stacked on the same point. This is called
# orthographic projection.
