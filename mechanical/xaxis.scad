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

gantry_position = 0;
y_position = 50;
z_position = 20;

module side_rails(gantry_position=0){
	difference(){
		rotate([0,0,90])sbr12(700);	
		for(pos = [-300 : 150 : 300]){
			translate([20,11,pos])rotate([0,90,0])cylinder(r=2.25, h=10, center=true, $fn=30);
			translate([20,-11,pos])rotate([0,90,0])cylinder(r=2.25, h=10, center=true, $fn=30);
		}	
	}
	rotate([0,0,90])translate([0,0,50+gantry_position])sbr12uu();
	rotate([0,0,90])translate([0,0,-50+gantry_position])sbr12uu();
}


module y_hardware(gantry_position=0){
	translate([77.5,-2.5,-365])rotate([0,0,0])stepper_motor_mount(23);
	translate([77.5,-2.5,0]){
		rotate([0,0,90])leadscrew600mm();
		rotate([0,0,-90])translate([0,0,gantry_position])sfu1604();
	}


	translate([80,180,0])side_rails(gantry_position);
	translate([80,-180,0])mirror([0,1,0])side_rails(gantry_position);	
}


//translate([30,0,0])cube([10,435,120], center=true);

module bed(){
	translate([-20,0,0]){
		bed_supports();
		difference(){
			color([0.7,0.5,0.0])translate([30,0,0])cube([10,360-24,700], center=true);
			for(y = [-6 : 6]){
				for(x = [-3: 3])
					translate([30, x*50, y*50])rotate([0,90,0]) cylinder(h=20, r=7.6/2, center=true, $fn=20);
			}	
		}
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

translate([57,180,0])cube([12,40,140], center=true);
translate([57-12,0,0])cube([12,400,140], center=true);

//drag_chain_shelves();
gantry(y_position, z_position);
bed();
y_hardware(gantry_position);
//dimension_peices();
//base();
//translate([-140,-218,gantry_position-120])rotate([90,0,0])stepper_motor_mount(23);
