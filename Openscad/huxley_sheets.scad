include <configuration.scad>
use <huxley_gears.scad>

use <belt-clamp.scad>
use <x-idler-bracket.scad>
use <x-motor-bracket.scad>
use <coupling.scad>
use <y-brackets-split.scad>
use <z-endstop-holder.scad>


module upplate1(){
	translate([0,0,0]) rotate([0,0,0])
	union()
	{

		translate([67,-7,0]) rotate([0,0,90]) import_stl("../stl/x-motor-bracket.stl");
		translate([77,72,0]) rotate([0,0,0]) import_stl("../stl/y-endstop-holder.stl");
		translate([77,58,0]) rotate([0,0,0]) import_stl("../stl/y-bar-clamp.stl");
		for(i=[0,1,2]){
			translate([77,i*14,0]) rotate([0,0,0]) import_stl("../stl/y-bar-clamp.stl");
		}
		translate([-7,94,0]) rotate([0,0,0]) coupling();
		translate([11,94,0]) rotate([0,0,0]) coupling();
		translate([-7,73,0]) rotate([0,0,0]) coupling();
		translate([11,73,0]) rotate([0,0,0]) coupling();
		translate([44,16,0]) rotate([0,0,0]) import_stl("../stl/idler-cover.stl");
		translate([20,-5,0]) rotate([0,0,115]) idler_split2();
		translate([45,90,0]) rotate([0,0,0]) import_stl("../stl/y-belt-tensioner.stl");
		translate([92,93,0]) rotate([0,0,0]) import_stl("../stl/y-belt-clamp.stl");
		translate([76,93,0]) rotate([0,0,0]) import_stl("../stl/y-belt-clamp.stl");
		translate([-10,44,0]) rotate([0,0,0]) import_stl("../stl/y-bar-clamp.stl");
		translate([-10,58,0]) rotate([0,0,0]) import_stl("../stl/y-bar-clamp.stl");
	}//end union
}

module upplate2(){
translate([0,0,0]) rotate([0,0,0]) union()
	{
		translate([85,100,9.5]) rotate([0,0,90]) import_stl("../stl/bearing-holder-fixed.stl");
		translate([21,48,9.5]) rotate([0,0,0]) import_stl("../stl/bearing-holder-float.stl");
		translate([-5,17,0]) rotate([0,0,-120]) import_stl("../stl/frame-vertex-foot.stl");
		translate([-5,35,0]) rotate([0,0,-120]) import_stl("../stl/frame-vertex-foot.stl");
		translate([57,46,0]) rotate([0,0,150]) import_stl("../stl/frame-vertex.stl");
		translate([57,100,0]) rotate([0,0,150]) import_stl("../stl/frame-vertex.stl");
		translate([-5,73,0]) mirror([0,1,0]) rotate([0,0,240]) import_stl("../stl/frame-vertex-foot.stl");
		translate([-5,90,0]) mirror([0,1,0]) rotate([0,0,240]) import_stl("../stl/frame-vertex-foot.stl");
		translate([72,0,0]) rotate([0,0,0]) endstop();
	}
}
module upplate3(){
	translate([0,0,0]) rotate([0,0,0]) union()
	{
		translate([-20,70,0]) rotate([0,0,0]) large_gear();
		translate([51,10,0]) rotate([0,0,0])
			union(){
				translate([-55,-23.6,0]) import_stl("../stl/M6-Block.stl");
				translate([-5,-5,5]) cube([10,10,0.3]);
				translate([13.25,-15,11.3]) cylinder(h=0.3, r=1.8, $fn=20);
			}
		translate([22,9,0]) rotate([0,0,-15]) idler_split1();
		translate([70,57,0]) rotate([0,0,100]) motor_split1();
		translate([88,42,0]) rotate([0,0,15]) motor_split2();
		translate([70,97,0]) rotate([0,0,0]) import_stl("../stl/y-bar-clamp.stl");
	}
}
module upplate4(){
	translate([0,0,0]) rotate([0,0,0]) union()
	{
		translate([86,52,0]) rotate([0,0,90]) import_stl("../stl/x-carriage.stl");

		translate([40,4,0]) rotate([0,0,90]) import_stl("../stl/z-motor-bracket.stl");
		translate([97,0,0]) rotate([0,0,90]) import_stl("../stl/z-motor-bracket.stl");
		translate([12,22,14]) rotate([180,0,0]) small_gear();
		translate([-10,116,0]) rotate([0,0,-90]) import_stl("../stl/x-idler-bracket.stl");
		translate([75,-26,6]) rotate([0,0,90]) import_stl("../stl/idler.stl");
		translate([8,-26,0]) rotate([0,0,0]) import_stl("../stl/nozzle-mounting.stl");
	}
}
module upplate5(){
//use this for y brackets with no support material
translate([0,0,0]) rotate([0,0,0]) union()
	{
//translate([0,50,0])
//	idler_split1();
//idler_split2();

//translate([30,75,0])
//	motor_split2();
	}
}
module upplate6(){
	import_stl("../stl/M6-Block.stl");
}
module upplate7(){
		translate([-10,0,0]) rotate([0,0,0]) import_stl("../stl/x-motor-bracket.stl");
		translate([-30,50,0]) rotate([0,0,0]) import_stl("../stl/x-idler-bracket.stl");
		translate([80,67,0]) rotate([0,0,90]) import_stl("../stl/x-carriage.stl");
		translate([90,67,0]) rotate([0,0,90]) import_stl("../stl/bearing-holder-fixed.stl");
		translate([80,67,0]) rotate([0,0,90]) import_stl("../stl/bearing-holder-float.stl");
}
platenum=99;
%cube(size=[130,130,0.01],center=true);
if(platenum==1)
	translate([-43,-49,0]) upplate1();
if(platenum==2)
	translate([-44,-49,0]) upplate2();
if(platenum==3)
	translate([-44,-49,0]) upplate3();
if(platenum==4)
	translate([-44,-49,0]) upplate4();
if(platenum==5)
	translate([-44,-49,0]) upplate5();
if(platenum==6)
	translate([-44,-49,0]) upplate6();
if(platenum==7)
	translate([-44,-49,0]) upplate7();
if(platenum==99){
%translate([140,0,0]) cube(size=[130,130,0.01],center=true);
%translate([0,140,0]) cube(size=[130,130,0.01],center=true);
%translate([140,140,0]) cube(size=[130,130,0.01],center=true);
	translate([-43,-49,0]) upplate1();
	translate([104,-49,0]) upplate2();
	translate([-43,94,0]) upplate3();
	translate([104,104,0]) upplate4();
	translate([244,-49,0]) upplate5();
}
