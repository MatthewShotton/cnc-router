module base(){
	translate([0,173.5,0])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "side");
	translate([0,-173.5,0])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "side");
}

base();