// eMAKEr Huxley
// Configuration file
// GNU GPL v3
// Jean-Marc Giacalone
// info@emakershop.com
// www.emakershop.com
// http://www.reprap.org/wiki/EMAKER_Huxley
// http://github.com/jmgiacalone/eMAKERHuxley

use <library.scad>

//Round corner diameter
round_corner_diameter = 8;

//Thin wall size
layer_height = 0.4;
perimeter_width_over_thicknes = 1.6;
infill_widht_over_thickness = 1.55;
thin_wall = 2*(perimeter_width_over_thicknes*layer_height+infill_widht_over_thickness*layer_height);
if(thin_wall<2){
	echo("Check thin wall size, its below 2mm!");
}
echo(thin_wall);

// MINI-HUXLEY VERSION (TODO, just place holder)
// include <configuration-huxley.scad>
m8_diameter=8.3;
m5_diameter=5.3;
m4_diameter=4.3;
m3_diameter=3.3;
m3_dia_clr=3.5;
m3_nut = 2.8;
m3_af = 5.8;
m6_diameter = 6;
m6_nut = 11.5;
bushing_diameter = 8;
motor_shaft=5.3;
bushing_rodsize = 6;
bushing_outerDiameter = 12;
bushing_lenght = 8;

// Some basic functions, probably should be somewhere else

