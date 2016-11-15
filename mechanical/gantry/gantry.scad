
module gantry(){
	translate([30,0,0])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-base");

	translate([36,223.5,0])rotate([0,90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-side");

	translate([36,-223.5,0])rotate([0,90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-side");	
}


gantry();