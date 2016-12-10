use <../rail/12mmrail.scad>
use <../ballscrew/leadscrew400mm.scad>
use <../ballscrew/sfu1604.scad>
use <../z-axis/fl08.scad>
use <../z-axis/sc8uu.scad>
use <../z-axis/sk8.scad>
use <../spindle/spindle.scad>
use <MCAD/motors.scad>

module gantry(y_position = 0, z_position=0){
	// translate([30,0,0])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	// 	import (file = "parts.dxf", layer = "gantry-base");
	// translate([36,223.5,0])rotate([0,-90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	// 	import (file = "parts.dxf", layer = "gantry-side");
	// translate([36,-223.5,0])rotate([0,-90,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
	// 	import (file = "parts.dxf", layer = "gantry-side");

	forward_offset = -16;

	translate([-92.5 + 12,0,-68])rotate([270,-90,0]){
		sbr12(400);
		translate([0,0,-20 + y_position])sbr12uu();
		translate([0,0,20 + y_position])sbr12uu();

	}
	translate([-197.5 - 12,0,-68])rotate([270,90,0]){
		sbr12(400);
		translate([0,0,-20 + y_position])sbr12uu();
		translate([0,0,20 + y_position])sbr12uu();

	}
	translate([-145,0,-68])rotate([90,0,0])leadscrew400mm();
	translate([-145,y_position,-68])rotate([-90,0,0])sfu1604();

	translate([-65.5,y_position,forward_offset])rotate([90,0,90])fl08();
	translate([-224.5,y_position,forward_offset])rotate([-90,0,90])fl08();

	color([0.8,0.8,0.8]){
		translate([-145,y_position,forward_offset])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
		translate([-145,y_position+30,forward_offset])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
		translate([-145,y_position-30,forward_offset])rotate([-90,0,90])cylinder(h=200, r=4, center=true, $fn=20);
	}

	translate([-145+z_position,y_position,forward_offset+17])cube(size=[40,90,12], center=true);

	translate([-145+z_position-20, y_position+30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position-20, y_position-30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position+20, y_position+30, forward_offset])rotate([90,0,90])sc8uu();
	translate([-145+z_position+20, y_position-30, forward_offset])rotate([90,0,90])sc8uu();

	translate([-145-70, y_position+30, forward_offset])rotate([90,0,90])sk8();
	translate([-145-70, y_position-30, forward_offset])rotate([90,0,90])sk8();
	translate([-145+70, y_position+30, forward_offset])rotate([90,0,90])sk8();
	translate([-145+70, y_position-30, forward_offset])rotate([90,0,90])sk8();


	translate([-145+z_position, y_position, forward_offset+52])rotate([90,0,90])spindle();

	translate([-275, y_position, forward_offset])rotate([90,0,90])stepper_motor_mount(17);

}


gantry();