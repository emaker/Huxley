include <configuration.scad>
use <huxley_gears.scad>

use <x-idler-bracket.scad>
use <x-motor-bracket.scad>

translate([58,8,0]) rotate([0,0,0]) x_motor_body();
translate([0,0,0]) rotate([0,0,0]) x_idler_body();
