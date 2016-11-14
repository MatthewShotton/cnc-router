use <bk12.scad>;
use <bf12.scad>;
use <sfu1604.scad>;

module leadscrew600mm(){
	color([0.85,0.85,0.85])union(){
		translate([0,0,297])cylinder(h=11, r=5, center=true, $fn=40);
		translate()cylinder(h=583, r=8, center=true, $fn=40);
		//translate([0,0,-321])cylinder(h=59, r=5, center=true, $fn=40);
		translate([0,0,-332])cylinder(h=21, r=5, center=true, $fn=40);
	}


	translate([0,0,-309])bk12();
	translate([0,0,301.5])mirror([0,0,1])bf12();
}


leadscrew600mm();

// translate([0,0,-117.5]){
// 	translate([0,0,235])rotate([90,0,0])cylinder(r=4, h=50, center=true);
// 	translate([0,0,0])rotate([90,0,0])cylinder(r=4, h=50, center=true);	
// }
