use <rail/12mmrail.scad>
use <ballscrew/leadscrew600mm.scad>;
use <ballscrew/sfu1604.scad>;
use <MCAD/motors.scad>
module side_rails(){
	sbr12(600);
	translate([0,0,80])sbr12uu();
	translate([0,0,0])sbr12uu();
}


translate([55,-2.5,-365])rotate([0,0,0])stepper_motor_mount(23);

translate([55,-2.5,0]){
	rotate([0,0,-90])leadscrew600mm();
	rotate([0,0,-90])translate([0,0,0])sfu1604();
}



translate([0,200,0])side_rails();
translate([0,-200,0])mirror([0,1,0])side_rails();


translate([-150,0,0])rotate([90,0,0])sbr12(400);
translate([-150,0,0])rotate([90,0,0])sbr12(400);
translate([30,0,40+0])cube([10,450,120], center=true);



color([0.7,0.5,0.0])cube([10,360,600], center=true);
