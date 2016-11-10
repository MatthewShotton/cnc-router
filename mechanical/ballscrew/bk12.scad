module bearing6000zz(){
	color([0.8,0.8,0.8])difference(){
		cylinder(h=8, r=13, center=true, $fn=40);
		cylinder(h=9, r=5, center=true, $fn=40);	
	}
}


module bk12() {
	color([0.2,0.2,0.2])difference(){
		union(){
			linear_extrude(height = 25, center = true, convexity = 10, $fn=40)
		   		import (file = "bk12.dxf", layer = "0");
			translate([0,0,15])linear_extrude(height = 5, center = true, convexity = 10, $fn=40)
		   		import (file = "bk12.dxf", layer = "bearing_plate");
		}
	   	translate([23,-5,-6.5])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,-5,-6.5])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,5.6,-6.5])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);
	   	translate([23,5.6,-6.5])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);
	   	translate([23,-5,6.5])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,-5,6.5])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,5.6,6.5])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);	
	   	translate([23,5.6,6.5])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);
	}
	translate([0,0,13])bearing6000zz();
	translate([0,0,-8])bearing6000zz();

}

bk12();