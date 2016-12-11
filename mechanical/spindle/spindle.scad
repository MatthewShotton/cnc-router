module spindle(){
	color([0.4,0.4,0.4])union(){
		cylinder(h=100, r=26, center=true, $fn=20);
		translate([0,0,-50-33/2])cylinder(h=33, r=24, center=true, $fn=20);
		translate([0,0,53.25])cylinder(h=6.5, r=35/2, center=true, $fn=20);
		translate([0,0,76])cylinder(h=52, r=10, center=true, $fn=20);	
	}
}


module spindle_mount(){
	difference(){
		color([0.7,0.7,0.7])linear_extrude(height = 40, center = true, convexity = 10, $fn=40)
		    import (file = "spindle_mount.dxf", layer = "0");
		translate([35,-20,10])rotate([90,0,0])cylinder(h=100, r=6.5/2, center=true, $fn=20);
		translate([35,-20,-10])rotate([90,0,0])cylinder(h=100, r=6.5/2, center=true, $fn=20);
		translate([-35,-20,-10])rotate([90,0,0])cylinder(h=100, r=6.5/2, center=true, $fn=20);
		translate([-35,-20,10])rotate([90,0,0])cylinder(h=100, r=6.5/2, center=true, $fn=20);
	}
}
