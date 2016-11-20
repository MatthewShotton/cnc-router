use <MCAD/motors.scad>


//stepper_motor_mount(17);
module nema17_motor_mount(){
	difference(){
		union(){
			cylinder(h=50, r1=16, r2=20, center=false, $fn=60);
			translate([0, 0, 2])cube(size=[41,31,4], center=true);
			translate([0, 0, 2])cube(size=[31,41,4], center=true);
			translate([ 15.5, 15.5, 0])cylinder(h=4, r=5, center=false, $fn=20);	
			translate([ 15.5,-15.5, 0])cylinder(h=4, r=5, center=false, $fn=20);	
			translate([-15.5, 15.5, 0])cylinder(h=4, r=5, center=false, $fn=20);	
			translate([-15.5,-15.5, 0])cylinder(h=4, r=5, center=false, $fn=20);	

		}
		translate([0, 0, -0.5])cylinder(h=51, r=11, center=false, $fn=60);

		translate([15.5, 15.5, -0.5])cylinder(h=50, r=1.5, center=false, $fn=20);	
		translate([15.5, -15.5, -0.5])cylinder(h=50, r=1.5, center=false, $fn=20);
		translate([-15.5, 15.5, -0.5])cylinder(h=50, r=1.5, center=false, $fn=20);
		translate([-15.5, -15.5, -0.5])cylinder(h=50, r=1.5, center=false, $fn=20);

		translate([11, 11, 31])cylinder(h=20, r=2, center=false, $fn=20);
		translate([11, -11, 31])cylinder(h=20, r=2, center=false, $fn=20);
		translate([-11, 11, 31])cylinder(h=20, r=2, center=false, $fn=20);
		translate([-11, -11, 31])cylinder(h=20, r=2, center=false, $fn=20);

		translate([11, 11, -1])cylinder(h=43.1, r=4, center=false, $fn=20);
		translate([11, -11, -1])cylinder(h=43.1, r=4, center=false, $fn=20);
		translate([-11, 11, -1])cylinder(h=43.1, r=4, center=false, $fn=20);
		translate([-11, -11, -1])cylinder(h=43.1, r=4, center=false, $fn=20);
		
		translate([11, 11, 42])cylinder(h=3, r1=4, r2=2, center=false, $fn=20);
		translate([11, -11, 42])cylinder(h=3, r1=4, r2=2, center=false, $fn=20);
		translate([-11, 11, 42])cylinder(h=3, r1=4, r2=2, center=false, $fn=20);
		translate([-11, -11, 42])cylinder(h=3, r1=4, r2=2, center=false, $fn=20);

		translate([0, 0, 10])rotate([90,0,0])cylinder(h=20, r=4, center=false, $fn=20);
		translate([0, 0, 40])rotate([90,0,0])cylinder(h=20, r=4, center=false, $fn=20);
		translate([0,-10,25])cube(size=[8,20,30], center=true);
	}
}


nema17_motor_mount();