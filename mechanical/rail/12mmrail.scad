module sbr12(length=300) {
	color([0.7,0.7,0.7])linear_extrude(height = length, center = true, convexity = 10, $fn=40)
		import (file = "../rail/12mmrail.dxf", layer = "0");
}

module sbr12uu() {
	difference(){
		color([0.6,0.6,0.6])linear_extrude(height = 39, center = true, convexity = 10, $fn=40)
			import (file = "../rail/12mmrail.dxf", layer = "sbr12uu-side");
		translate([14, 15, 13])rotate([90,0,0])cylinder(h=20, r=2, center=true, $fn=20);
		translate([14, 15, -13])rotate([90,0,0])cylinder(h=20, r=2, center=true, $fn=20);
		translate([-14, 15, 13])rotate([90,0,0])cylinder(h=20, r=2, center=true, $fn=20);
		translate([-14, 15, -13])rotate([90,0,0])cylinder(h=20, r=2, center=true, $fn=20);	
	}
}


sbr12(700);
translate([0,0,40])sbr12uu();
translate([0,0,-40])sbr12uu();

