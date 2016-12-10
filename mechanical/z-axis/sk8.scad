module sk8() {
    difference(){
        color([0.7,0.7,0.7])linear_extrude(height = 14, center = true, convexity = 10, $fn=40)
            import (file = "sk8.dxf", layer = "0");
       translate([16,-17,0])rotate([90,0,0])cylinder(h=14, r=2, center=true, $fn=20);
       translate([-16,-17,0])rotate([90,0,0])cylinder(h=14, r=2, center=true, $fn=20);
    }
}

sk8();
