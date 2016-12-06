use <bk12.scad>;
use <bf12.scad>;

module leadscrew400mm(){
	color([0.85,0.85,0.85])union(){
		translate([0,0,173])cylinder(h=11, r=5, center=true, $fn=40);
		translate()cylinder(h=335, r=8, center=true, $fn=40);
		translate([0,0,-197])cylinder(h=59, r=5, center=true, $fn=40);	
	}
	translate([0,0,-185])bk12();
	translate([0,0,177.5])mirror([0,0,1])bf12();
}

module leadscrew400mmbolts(){
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
	leadscrew400mm();
	leadscrew400mmbolts();
}

