// Gmsh project created on Mon Apr 22 16:01:31 2024
//+
h = 0.05;
//+
Point(1) = {-0, 0, 0, h};
//+
Point(2) = {1, 0, 0, h};
//+
Point(3) = {1, 2, 0, h};
//+
Point(4) = {0, 2, 0, h};
//+
Point(5) = {0.1, -0, 0, h};
//+
Point(6) = {0.9, -0, 0, h};
//+
Line(1) = {4, 1};
//+
Line(2) = {1, 5};
//+
Line(3) = {2, 3};
//+
Line(4) = {3, 4};
//+
Line(5) = {5,6};
//+
Line(6) = {6,2};
//+
Physical Curve("Left") = {1};
//+
Physical Curve("Right") = {3};
//+
Physical Curve("Top") = {4};
//+
Physical Curve("Bottom_1") = {2};
//+
Physical Curve("Bottom_3") = {6};
//+
Physical Curve("Bottom_2") = {5};


//+
Point(7) = {0.5, 0.6, -0, h};
//+
Point(8) = {0.6, 0.6, 0, h};
//+
Point(9) = {0.4, 0.6, -0, h};
//+
Circle(7) = {8,7,9};
//+
Circle(8) = {9,7,8};
//+
Curve Loop(1) = {8, 7};
//+
Plane Surface(1) = {1};
//+
Physical Surface("Particle") = {1}; 
//+
Curve Loop(2) = {1, 2, 5, 6, 3, 4};
//+
Plane Surface(2) = {1, 2};
//+
Physical Surface("Screen") = {2};
