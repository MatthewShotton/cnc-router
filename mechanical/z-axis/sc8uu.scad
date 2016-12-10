module sc8uu() {
    difference(){
        color([0.7,0.7,0.7])linear_extrude(height = 30, center = true, convexity = 10, $fn=40)
            import (file = "sc8uu.dxf", layer = "0");
       translate([12,2,9])rotate([90,0,0])cylinder(h=24, r=2, center=true, $fn=20);
       translate([-12,2,9])rotate([90,0,0])cylinder(h=24, r=2, center=true, $fn=20);
       translate([-12,2,-9])rotate([90,0,0])cylinder(h=24, r=2, center=true, $fn=20);
       translate([12,2,-9])rotate([90,0,0])cylinder(h=24, r=2, center=true, $fn=20);
    }
}

sc8uu();