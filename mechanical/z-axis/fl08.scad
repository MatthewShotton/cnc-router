
module fl08(){
    difference(){
        color([0.7,0.7,0.7])union(){
            linear_extrude(height = 4, center = true, convexity = 10, $fn=40)
                import (file = "fl08.dxf", layer = "0");
            translate([0,0,2])cylinder(h=8, r=25.7/2, center=true, $fn=20);    
            translate([0,0,4.25])cylinder(h=12.5, r=6, center=true, $fn=20);    
        }
        translate([0,0,2])cylinder(h=20, r=4, center=true, $fn=20);    
    }
}

fl08();