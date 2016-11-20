use <../rail/12mmrail.scad>

module gantry(){
	translate([30,0,0])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-base");

	translate([36,223.5,0])rotate([0,-90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-side");

	translate([36,-223.5,0])rotate([0,-90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
		import (file = "parts.dxf", layer = "gantry-side");

	translate([-120,0,-68])rotate([270,180,0])sbr12(500);
	translate([-170,0,-68])rotate([270,180,0])sbr12(500);
}


gantry();