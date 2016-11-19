use <rail/12mmrail.scad>
use <ballscrew/leadscrew600mm.scad>
use <ballscrew/sfu1604.scad>
use <gantry/gantry.scad>
use <base/base.scad>
use <MCAD/motors.scad>
module dimension_peices(){
	//rail mount to rail mount
	cube([30,435,10], center=true);
	translate([50,0,-5])cube([50,10,633], center=true);
}



gantry_position = 260;

module side_rails(gantry_position=0){
	sbr12(700);
	translate([0,0,40+gantry_position])sbr12uu();
	translate([0,0,-40+gantry_position])sbr12uu();
}

translate([0,0,gantry_position])gantry();



translate([55,-2.5,-365])rotate([0,0,0])stepper_motor_mount(23);

translate([55,-2.5,0]){
	rotate([0,0,-90])leadscrew600mm();
	rotate([0,0,-90])translate([0,0,gantry_position])sfu1604();
}

translate([0,200,0])side_rails(gantry_position);
translate([0,-200,0])mirror([0,1,0])side_rails(gantry_position);


translate([-120,0,68+gantry_position])rotate([270,0,0])sbr12(500);
translate([-170,0,68+gantry_position])rotate([270,0,0])sbr12(500);
//translate([30,0,0])cube([10,435,120], center=true);




module bed(){
	difference(){
		color([0.7,0.5,0.0])translate([-24,0,0])cube([10,360-24,700], center=true);
		for(y = [-6 : 6]){
			for(x = [-3: 3])
				translate([-20, x*50, y*50])rotate([0,90,0]) cylinder(h=20, r=4, center=true, $fn=20);
		}	
	}
	
}

bed();
//dimension_peices();

base();