use <bk12.scad>;
use <bf12.scad>;

module leadscrew300mm(){
	color([0.85,0.85,0.85])union(){
		translate([0,0,123])cylinder(h=11, r=5, center=true, $fn=40);
		translate()cylinder(h=235, r=8, center=true, $fn=40);
		translate([0,0,-147])cylinder(h=59, r=5, center=true, $fn=40);	
	}
	translate([0,0,-135])bk12();
	translate([0,0,128])mirror([0,0,1])bf12();
}


rotate([90,0,0])leadscrew300mm();

// translate([0,0,-117.5]){
// 	translate([0,0,235])rotate([90,0,0])cylinder(r=4, h=50, center=true);
// 	translate([0,0,0])rotate([90,0,0])cylinder(r=4, h=50, center=true);	
// }
