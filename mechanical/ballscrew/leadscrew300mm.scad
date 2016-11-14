use <bk12.scad>;
use <bf12.scad>;

module leadscrew300mm(){
	color([0.85,0.85,0.85])union(){
		translate([0,0,123])cylinder(h=11, r=5, center=true, $fn=40);
		translate()cylinder(h=235, r=8, center=true, $fn=40);
		translate([0,0,-147])cylinder(h=59, r=5, center=true, $fn=40);	
	}
	translate([0,0,-135])bk12();
	translate([0,0,127.5])mirror([0,0,1])bf12();
}

module leadscrew300mmbolts(){
	translate([0,0,-117.5]){
		translate([23,-10,245])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
		translate([-23,-10,245])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
		
		translate([23,-10,-11])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
		translate([-23,-10,-11])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
		translate([23,-10,-24])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
		translate([-23,-10,-24])rotate([90,0,0])cylinder(r=3, h=50, center=true, $fn=40);
	}
}


rotate([90,0,0]){
	leadscrew300mm();
	leadscrew300mmbolts();
}


// 245+11 = 256
// 245+24 = 269
// 269 - 256 = 13