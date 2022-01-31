$fn = 200;
Height = 45;
Radius = 45;
Walls = 7;

module tube(h, r_inner, thickness) {
    difference() {
        cylinder(h, r=r_inner + thickness, center=true);
        cylinder(h + 0.01, r=r_inner, center=true);
    }
}

module Plane() {
    w = (Radius + Walls)*2;
    translate([0, Radius + Walls/2, 0])
        cube([w, Walls, Height], center=true);
}

module Crescent() {
    w = (Radius + Walls)*2;
    difference() {
        tube(h=Height, r_inner=Radius, thickness=Walls);
        translate([0, -w/4, 0])
            cube([w + 0.01, w/2, Height + 0.01], center=true);
    }
}

module All() {
    Plane();
    Crescent();
}

All();
