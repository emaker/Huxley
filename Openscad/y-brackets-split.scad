include <configuration.scad>


module idler_split1()
{
	difference()
	{
		translate([0,-215,0]) rotate([0,-90,0]) import_stl("../stl/y-idler-bracket.stl");
		translate([-50,-50,11.6]) cube([100,100,20]);
		translate([-22.1,6.4,5]) cylinder(r=4,h=8);
		#translate([-33,17,5]) cylinder(r=10,h=8);
	}
}
module idler_split2()
{
	translate([0,0,0]) difference()
	{
		translate([0,-215,15.2]) rotate([0,90,0]) import_stl("../stl/y-idler-bracket.stl");
		difference(){
			translate([-50,-50,3.6]) cube([100,100,20]);
			translate([22.3,6.3,3.6]) cylinder(r=4,h=4);
			#translate([33,17,3.6]) cylinder(r=10,h=3);
		}
	}
}
module motor_split1()
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) import_stl("../stl/y-motor-bracket.stl");
		translate([-50,-50,10.5]) cube([100,100,20]);
	}
}
module motor_split2()
{
	translate([0,0,-10.5]) difference()
	{
		translate([0,0,0]) rotate([0,0,0]) import_stl("../stl/y-motor-bracket.stl");
		translate([-50,-50,0]) cube([100,100,10.5]);
	}
}

translate([-10,15,0]) rotate([0,0,-120])
	idler_split1();
idler_split2();

//translate([35,25,0])
//	motor_split1();
//translate([30,75,0])
//	motor_split2();