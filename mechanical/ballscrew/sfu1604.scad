module sfu1604() {
	difference(){
		color([0.6,0.6,0.6])linear_extrude(height = 39, center = true, convexity = 10, $fn=40)
	   		import (file = "sfu1604.dxf", layer = "0");
	   	translate([19.5,0,12])rotate([90,0,0])cylinder(h=30, r=2, center=false, $fn=20);
	   	translate([-19.5,0,12])rotate([90,0,0])cylinder(h=30, r=2, center=false, $fn=20);
	   	translate([-19.5,0,-12])rotate([90,0,0])cylinder(h=30, r=2, center=false, $fn=20);
	   	translate([19.5,0,-12])rotate([90,0,0])cylinder(h=30, r=2, center=false, $fn=20);
	}
}

sfu1604();
