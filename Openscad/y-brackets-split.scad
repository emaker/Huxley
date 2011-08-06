include <configuration.scad>


module idler_split1()
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) import_stl("../stl/y-idler-bracket.stl");
		translate([-50,-50,10.4]) cube([100,100,20]);
		translate([22.5,13.5,7]) #cylinder(r=4,h=4);
	}
}
module idler_split2()
{
	translate([0,0,-10.4]) difference()
	{
		translate([0,0,0]) rotate([0,0,0]) import_stl("../stl/y-idler-bracket.stl");
		translate([-50,-50,0]) cube([100,100,10.4]);
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

translate([0,50,0])
	idler_split1();
idler_split2();

translate([35,25,0])
	motor_split1();
translate([30,75,0])
	motor_split2();