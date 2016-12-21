use <rail/12mmrail.scad>
use <ballscrew/leadscrew600mm.scad>
use <ballscrew/sfu1604.scad>
use <gantry/gantry.scad>
use <base/base.scad>
use <MCAD/motors.scad>
use <motors/motor_mount.scad>

module dimension_peices(){
	//rail mount to rail mount
	cube([30,435,10], center=true);
	translate([50,0,-5])cube([50,10,633], center=true);
}

//dimension_peices();

// Cutting bed dimensions
// ----------------------
// 290 x 540 x 60
//
//translate([-25,0,0])cube([60,290,540],center=true);

gantry_position = -270;
y_position = 0;
z_position = 20;


module side_rails(gantry_position=0){
	difference(){
		rotate([0,0,90])sbr12(700);	
		for(pos = [-300 : 150 : 300]){
			translate([20,11,pos])rotate([0,90,0])cylinder(r=1.5, h=10, center=true, $fn=30);
			translate([20,-11,pos])rotate([0,90,0])cylinder(r=1.5, h=10, center=true, $fn=30);
		}	
	}
	rotate([0,0,90])translate([0,0,50.5+gantry_position])sbr12uu();
	rotate([0,0,90])translate([0,0,-50.5+gantry_position])sbr12uu();
}


module y_hardware(gantry_position=0){
	translate([77.5,0,-365])rotate([0,0,0])stepper_motor_mount(23);
	translate([77.5,0,0]){
		rotate([0,0,90])leadscrew600mm();
		rotate([0,0,-90])translate([0,0,gantry_position])sfu1604();
	}


	translate([80,180,0])side_rails(gantry_position);
	translate([80,-180,0])mirror([0,1,0])side_rails(gantry_position);	
}

module bed(){
	translate([-20,0,0]){
		bed_supports();
		color([0.7,0.5,0.0])translate([29,0,0])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
            import (file = "frame.dxf", layer = "bed");
	}
}

module drag_chain_shelf(length=700){
	color([0.6,0.6,0.6]){
		translate([11.5,0,0])cube([25,2,length], center=true);
		translate([0,11.5,0])cube([2,25,length], center=true);	
	}
}

module drag_chain_shelves(){
	translate([-40,180.5,0])drag_chain_shelf(700);
	translate([-41,-180.5,0])rotate([180,0,0])drag_chain_shelf(700);
}

module gantry_base(){ 
	translate([57-12,0,gantry_position])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
        import (file = "frame.dxf", layer = "gantry_base_main");
	translate([57,0,gantry_position])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
        import (file = "frame.dxf", layer = "gantry_base_sides");
}

module main_base(){
	color([0.7,0.5,0.0])translate([108.5,0,0])rotate([90,0,90])linear_extrude(height = 12, center = true, convexity = 10, $fn=40)
        import (file = "frame.dxf", layer = "base");
}

main_base();
gantry_base();

translate([0,0,gantry_position])gantry(y_position, z_position);
bed();
 y_hardware(gantry_position);


