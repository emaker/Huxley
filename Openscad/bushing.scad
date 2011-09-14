// PRUSA Mendel 
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
// Ribs added by Adrian 12/9/11
include <configuration.scad>
/**
* @name Bushing
* @category Printed
* @link bushing
*/ 
rodsize = 7.2+0.2;
outerDiameter = bushing_outerDiameter;
lenght = bushing_lenght;
//type = bushing_type;
cutoutWidth=1.2;
rib_width=lenght-4;

module bushing(stiff=true, ribs=true, lenght=10){
difference(){
	union(){
		translate([outerDiameter/2, -6,(lenght)/2 ]) 
		rib();
		translate([-(outerDiameter/2), -6,(lenght)/2 ]) 
		mirror([1,0,0])
			rib();
		translate(v=[-outerDiameter/2,-8,0]) cube(size = [outerDiameter,8,lenght]);
		cylinder(h = lenght, r=outerDiameter/2);
		translate(v=[-outerDiameter/2,-10,0]) cube(size = [outerDiameter,3,lenght]);
	}
	translate(v=[0,5,(lenght+2)/2]) cube(size = [outerDiameter/2,8,lenght+2], center=true);
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(rodsize)/2);
}
}


module rib(){
difference(){
	cube([4,20,rib_width], center=true);
	translate([0,10.5,0])
		rotate([0,0,45])
			cube([4,16,rib_width+2], center=true);
	translate([0,-10.5,0])
		rotate([0,0,-45])
			cube([4,16,rib_width+2], center=true);
	}
}
bushing(true, true, 11);
