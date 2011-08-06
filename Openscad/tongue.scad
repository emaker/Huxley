include <configuration.scad>
partthick=2;
partlength=18;
hole_size=4;
gap_adjust=0.2;
difference(){
	union(){
		translate([-hole_size,-hole_size,0]) cube([8,partlength,partthick]);
		translate([0,partlength-hole_size,0]) cylinder(h=partthick,r=8/2);
	}
	polyhole(h=partthick, d=hole_size);
	translate([0,-hole_size/2,partthick/2]) cube([hole_size+gap_adjust,hole_size,partthick], center=true);
	translate([0,partlength-hole_size,0]) polyhole(h=partthick,d=hole_size);
}