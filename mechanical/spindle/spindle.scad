module spindle(){
	color([0.4,0.4,0.4])union(){
		cylinder(h=100, r=26, center=true, $fn=20);
		translate([0,0,-50-33/2])cylinder(h=33, r=24, center=true, $fn=20);
		translate([0,0,53.25])cylinder(h=6.5, r=35/2, center=true, $fn=20);
		translate([0,0,76])cylinder(h=52, r=10, center=true, $fn=20);	
	}
}
