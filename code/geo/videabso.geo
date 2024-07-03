// Gmsh project created on Mon Apr 22 16:01:31 2024

h = 0.02;

a = newp ; Point(a) = {-1,0,0,h};
b = newp ; Point(b) = {-1,2,0,h};
c = newp ; Point(c) = {1,0,0,h};
d = newp ; Point(d) = {1,2,0,h};

l2 = newl ; Line(l2) = {a,b};
l3 = newl ; Line(l3) = {b,d};
l4 = newl ; Line(l4) = {d,c};
l1 = newl ; Line(l1) = {c,a};
Curve Loop(1) = {l1,l2,l3,l4};


nb_layer = 16;
epaisseur = 0.6;
For i In {1:nb_layer}
    a = newp ; Point(a) = {-1-i*epaisseur/nb_layer,0,0,h};
    l1 = newl ; Line(l1) = {a-4,a};
    b = newp ; Point(b) = {-1-i*epaisseur/nb_layer,2+i*epaisseur/nb_layer,0,h};
    l2 = newl ; Line(l2) = {a,b};
    c = newp ; Point(c) = {1+i*epaisseur/nb_layer,0,0,h};
    d = newp ; Point(d) = {1+i*epaisseur/nb_layer,2+i*epaisseur/nb_layer,0,h};
    l3 = newl ; Line(l3) = {b,d};
    l4 = newl ; Line(l4) = {d,c};
    l5 = newl ; Line(l5) = {c,c-4};
    Curve Loop(i+1) = {l1,l2,l3,l4,l5,-(l1-2),-(l1-3),-(l1-4)};
EndFor

For i In {1:nb_layer+1}
    Plane Surface(i) = {i};
EndFor

Physical Surface("Screen") = {1};
Physical Surface("layer1") = {2};
Physical Surface("layer2") = {3};
Physical Surface("layer3") = {4};
Physical Surface("layer4") = {5};
Physical Surface("layer5") = {6};
Physical Surface("layer6") = {7};
Physical Surface("layer7") = {8};
Physical Surface("layer8") = {9};
Physical Surface("layer9") = {10};
Physical Surface("layer10") = {11};
Physical Surface("layer11") = {12};
Physical Surface("layer12") = {13};
Physical Surface("layer13") = {14};
Physical Surface("layer14") = {15};
Physical Surface("layer15") = {16};
Physical Surface("layer16") = {17};

l = newl;
Physical Curve("Left") = {l-4};
Physical Curve("Top") = {l-3};
Physical Curve("Right") = {newl-2};
//Physical Curve("emetteur") = {4};
//Physical Curve("Bottom") = {80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,9,14,19,24,29,34,39,44,49,54,59,64,69,74,79,84};
Physical Curve("emetteur") = {80,75,70,65,60,55,50,45,40,35,30,25,20,15,10,5,4,9,14,19,24,29,34,39,44,49,54,59,64,69,74,79,84};