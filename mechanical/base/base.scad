module base(){
	translate([0,173.5,0])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "side");
	translate([0,-173.5,0])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "side");
}

module bed_support(offset){
	color([0.3,0.3,0.3])translate([45,offset,0])difference(){
		cube([20,20,724], center=true);
		cube([17,17,725], center=true);
	}
}

module bed_supports(){
	bed_support(125);
	bed_support(-125);
}

base();