module bearing6000zz(){
	difference(){
		cylinder(h=8, r=13, center=true, $fn=40);
		cylinder(h=9, r=5, center=true, $fn=40);	
	}
}


module bf12() {
	difference(){
		linear_extrude(height = 20, center = true, convexity = 10, $fn=40)
	   		import (file = "bf12.dxf", layer = "0");
	   	translate([23,-5,0])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,-5,0])rotate([90,0,0])cylinder(h=50, r=3.3, center=true, $fn=40);
	   	translate([-23,5.6,0])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);	
	   	translate([23,5.6,0])rotate([90,0,0])cylinder(h=4, r=10.8/2, center=true, $fn=40);
	}
	translate([0,0,5.5])bearing6000zz();
}

bf12();