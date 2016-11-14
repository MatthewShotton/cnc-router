use <../ballscrew/leadscrew300mm.scad>;
use <../ballscrew/leadscrew600mm.scad>;
use <MCAD/motors.scad>




translate([0,-190,400])rotate([0,0,0]){
	leadscrew600mm();
	//leadscrew300mmbolts();
}


// translate([152,-70,75])rotate([0,90,0])linear_extrude(height = 10, center = true, convexity = 10, $fn=40)
// 	import (file = "plate.dxf", layer = "side");
// translate([-142,-70,75])rotate([0,90,0])linear_extrude(height = 10, center = true, convexity = 10, $fn=40)
//  import (file = "plate.dxf", layer = "side");

translate([0,0,400]){
	translate([160,-80,0])cube([10,270,70], center=true);
	translate([-160,-80,0])cube([10,270,70], center=true);
	translate([0,-190,40])cube([320,50,10], center=true);
	translate([0,-190,-40])cube([320,50,10], center=true);	

	translate([0,50,0])rotate([0,90,0])rotate([0,0,0])color([0.7,0.7,0.7])linear_extrude(height = 300, center = true, convexity = 10, $fn=40)
		import (file = "../rail/12mmrail.dxf", layer = "0");
	translate([0,-50,0])rotate([0,90,0])rotate([0,0,180])color([0.7,0.7,0.7])linear_extrude(height = 300, center = true, convexity = 10, $fn=40)
		import (file = "../rail/12mmrail.dxf", layer = "0");
	

	translate([0,0,-40])linear_extrude(height = 10, center = true, convexity = 10, $fn=40)
		import (file = "plate.dxf", layer = "0");

	translate([-0.5,0,-10])rotate([90,0,270]){
		leadscrew300mm();
		leadscrew300mmbolts();
	}
	translate([199,0,-10])rotate([0,270,0])stepper_motor_mount(23);

}



translate([120,-190,400])color([0.7,0.7,0.7])linear_extrude(height = 600, center = true, convexity = 10, $fn=40)
	import (file = "../rail/12mmrail.dxf", layer = "0");
translate([-120,-190,400])color([0.7,0.7,0.7])linear_extrude(height = 600, center = true, convexity = 10, $fn=40)
	import (file = "../rail/12mmrail.dxf", layer = "0");





translate([0,-160,400])cube([300,10,300],center=true);