// Gmsh project created on Mon Apr 22 16:01:31 2024
//+
h = 0.01;
//+
Point(1) = {-1, 0, 0, h};
//+
Point(2) = {1, 0, 0, h};
//+
Point(3) = {1, 2, 0, h};
//+
Point(4) = {-1, 2, 0, h};
//+
Point(5) = {-0.8, -0, 0, h};
//+
Point(6) = {0.8, -0, 0, h};
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

//Point(7) = {0,0.4,0,h};



//PARTICULE SPHERIQUE//
cl = 0;
r = 0.1;
x = 0;
y = 0.6;
p1 = newp; Point(p1) = {0,0,0,h};
p2 = newp; Point(p2) = {-r,0,0,h};
p3 = newp; Point(p3) = {r,0,0,h};
p4 = newp; Point(p4) = {0,r,0,h};
Translate{x,y,0}{Point{p1};Point{p2};Point{p3};Point{p4};}
c1 = newc; Circle(c1) = {p2,p1,p3};
c2 = newc; Circle(c2) = {p3,p1,p4};
c3 = newc; Circle(c3) = {p4,p1,p2};
Curve Loop(5) = {c1, c2, c3};
s1 = news; Surface(s1) = {5};
//Physical Surface("Particle") = {s1}; 

//PARTICULE ALEATOIRE//

x = 0;
y = 0;

nombre_sommet = Round(Rand(12))+3;
angle = 2*Pi/nombre_sommet;
For i In {0:nombre_sommet-1}
    r = Rand(0.08)+0.02;
    p = newp; Point(p)={r*Cos(angle*i),0.4+r*Sin(angle*i),0,h};
    Translate{x,y,0}{Point{p};}

EndFor

k = newp-nombre_sommet;
np = k+nombre_sommet-1;

For i In {0:nombre_sommet-2}
    l = newl; Line(l) = {k+i,k+i+1};
EndFor

l = newl; Line(l) = {np,k};
Curve Loop(1) = {k:l};
s2 = news; Plane Surface (s2) = {1};
Physical Surface("Particle")={s1,s2};


Curve Loop(2) = {1,2,5,6,3,4};
Plane Surface (2) = {1,2};
Physical Surface("Screen") = {2};

