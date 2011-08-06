// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

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


module bushing(stiff, lenght=10){
	difference(){
		union(){
			translate(v=[-outerDiameter/2,-8,0]) cube(size = [outerDiameter,8,lenght]);
			cylinder(h = lenght, r=outerDiameter/2);
			translate(v=[-outerDiameter/2,-10,0]) cube(size = [outerDiameter,3,lenght]);
		}
	//cutout inside
	//Opening
	rotate(a=[0,0,45]) translate(v=[0,0,-1]) cube(size = [16,16,lenght+2]);
	//Cutouts to make it more bendy
	if(stiff){
		translate([-(rodsize)/2,-6,-1]) cube(size = [cutoutWidth,6,lenght+2]);
		translate([(rodsize)/2-cutoutWidth,-6,-1]) cube(size = [cutoutWidth,6,lenght+2]);
	}else{
		translate([-(rodsize)/2,-8,-1]) cube(size = [cutoutWidth,8,lenght+2]);
		translate([(rodsize)/2-cutoutWidth,-8,-1]) cube(size = [cutoutWidth,8,lenght+2]);
	}
	translate(v=[0,5,(lenght+2)/2]) cube(size = [outerDiameter/2,8,lenght+2], center=true);
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(rodsize)/2);
	}
}
bushing(true, 11);

