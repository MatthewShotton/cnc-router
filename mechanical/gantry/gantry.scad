use <../rail/12mmrail.scad>
use <../ballscrew/leadscrew400mm.scad>
use <../ballscrew/sfu1604.scad>
use <../z-axis/fl08.scad>
use <../z-axis/sc8uu.scad>
use <../z-axis/sk8.scad>
use <../spindle/spindle.scad>
use <MCAD/motors.scad>

module nut() {
	difference(){
		union(){
			rotate([90,0,90])cylinder(h=3.75, r=22.2/2, center=true, $fn=100);
			translate([6.8,0,0])rotate([90,0,90])cylinder(h=10, r=10.25/2, center=true, $fn=20);			
		}
		rotate([-90,0,90])cylinder(h=50, r=4, center=true, $fn=20);
		translate([0,8,0])rotate([90,0,90])cylinder(h=10, r=1.5, center=true, $fn=20);
		translate([0,-8,0])rotate([90,0,90])cylinder(h=10, r=1.5, center=true, $fn=20);
		translate([0,0,8])rotate([90,0,90])cylinder(h=10, r=1.5, center=true, $fn=20);
		translate([0,0,-8])rotate([90,0,90])cylinder(h=10, r=1.5, center=true, $fn=20);
	}
}


module nut_holder(){
	difference(){
		color([0.7,0.3,0.8])cube([20,24,24], center=true);

		translate([0,0,0])rotate([90,0,90])cylinder(h=25, r=10.25/2, center=true, $fn=20);			
		translate([0,8,0])rotate([90,0,90])cylinder(h=25, r=1.5, center=true, $fn=20);
		translate([0,-8,0])rotate([90,0,90])cylinder(h=25, r=1.5, center=true, $fn=20);
		translate([0,0,8])rotate([90,0,90])cylinder(h=25, r=1.5, center=true, $fn=20);
		translate([0,0,-8])rotate([90,0,90])cylinder(h=25, r=1.5, center=true, $fn=20);

		translate([0,8,0])rotate([0,0,90])cylinder(h=30, r=2, center=true, $fn=20);
		translate([0,-8,0])rotate([0,0,90])cylinder(h=30, r=2, center=true, $fn=20);
		translate([0,-8,-21])rotate([0,0,90])cylinder(h=30, r=3.5, center=true, $fn=20);
		translate([0,8,-21])rotate([0,0,90])cylinder(h=30, r=3.5, center=true, $fn=20);
	}
}

module gantry_wood(y_position=0, forward_offset=0){
	color([0.5,0.3,0.1])translate([-109,0,forward_offset-63])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_bottom");
	color([0.5,0.3,0.1])translate([-181,0,forward_offset-63])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_top");


	translate([-145,0,forward_offset-83])rotate([0,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_back");


	color([0.5,0.3,0.5])translate([-145,y_position,forward_offset-96])rotate([0,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_rear");
	color([0.5,0.3,0.5])translate([-145,y_position,forward_offset-26])rotate([0,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_front");



	translate([-232.5,y_position,forward_offset-42])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_top");

	translate([-270,y_position,forward_offset-42])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_motor_mount");

	color([0.3,0.7,0.5])translate([-257.25,y_position-45,forward_offset-1])rotate([90,0,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_motor_spacer");

	color([0.3,0.7,0.5])translate([-257.25,y_position+45,forward_offset-1])rotate([90,0,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_motor_spacer");


	translate([-57.5,y_position,forward_offset-42])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "head_bottom");
	//translate([-191,0,forward_offset-77])cube(size=[10,400,10], center=true);
	//translate([-145,y_position+50,forward_offset-50])cube(size=[163,12,60], center=true);


	color([0.1,0.5,0.3])translate([45,-206,forward_offset+60])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_side");
	color([0.1,0.5,0.3])translate([45,206,forward_offset+60])rotate([90,-90,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_side_motor");

}

module gantry(y_position = 0, z_position=0){

	forward_offset = -60;

	gantry_wood(y_position, forward_offset);

	translate([-92.5 + 12,0,-68+forward_offset+16])rotate([270,-90,0]){
		translate([0,0,0])sbr12(400);
		translate([0,0,-20 + y_position])sbr12uu();
		translate([0,0,20 + y_position])sbr12uu();

	}
	translate([-197.5 - 12,0,-68+forward_offset+16])rotate([270,90,0]){
		sbr12(400);
		translate([0,0,-20 + y_position])sbr12uu();
		translate([0,0,20 + y_position])sbr12uu();

	}
	translate([-145,0,-68+forward_offset+16])rotate([90,0,0])leadscrew400mm();
	translate([-145,y_position,-68+forward_offset+16])rotate([-90,0,0])sfu1604();

	translate([-65.5,y_position,forward_offset-1])rotate([90,0,90])fl08();
	translate([-224.5,y_position,forward_offset-1])rotate([-90,0,90])fl08();
	
	translate([-145+z_position,y_position,forward_offset-1]){
		nut();
		translate([12,0,0])nut_holder();
	}

	color([0.8,0.8,0.8]){
		translate([-145,y_position,forward_offset-1])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
		translate([-145,y_position+30,forward_offset])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
		translate([-145,y_position-30,forward_offset])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
	}

	translate([-145+z_position,y_position,forward_offset+17])rotate([0,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "spindle_plate");


	translate([-145+z_position-15.5, y_position+30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position-15.5, y_position-30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position+15.5, y_position+30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position+15.5, y_position-30, forward_offset])rotate([90,0,90])sc8uu();

	translate([-145-70, y_position+30, forward_offset])rotate([90,0,90])sk8();
	translate([-145-70, y_position-30, forward_offset])rotate([90,0,90])sk8();
	translate([-145+70, y_position+30, forward_offset])rotate([90,0,90])sk8();
	translate([-145+70, y_position-30, forward_offset])rotate([90,0,90])sk8();


	translate([-145+z_position, y_position, forward_offset+57])rotate([90,0,90])spindle();
	translate([-145+z_position, y_position, forward_offset+57])rotate([90,0,90])spindle_mount();

	translate([-145, 251, forward_offset-52])rotate([90,0,0])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_motor_mount");


	color([0.5,0.8,0.2])translate([-109, 230, forward_offset-52])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	    import (file = "../frame.dxf", layer = "gantry_motor_mount_side");

	translate([-276, y_position, forward_offset - 1])rotate([90,0,90])stepper_motor_mount(17);
	translate([-145, 257, forward_offset-52])rotate([90,0,0])stepper_motor_mount(23);

}


gantry();

// nut_holder();