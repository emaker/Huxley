include <configuration.scad>

holeX = 6.5;
holeY = 6.5;

holeR = 3.4 / 2;
nutR = 5.8/sqrt(3)+0.2;
//nutR=3.25;
nutH = 3;
corner_cut = 24;

studding_dia = 5.0;
shaft_dia = 8.0;

module coupling(c){
    translate([0,0,4]) union(){
        difference(){
            cube(size = [26,25,8], center = true);

            if(c==1){
                //slot
            	*cube(size = [2,40,30], center = true);
                
                //nut holes
            	translate([ holeX,  holeY, nutH/2 - 4.01]) cylinder(h = nutH, r=nutR, $fn=6, center=true);
            	translate([ holeX, -holeY, nutH/2 - 4.01]) cylinder(h = nutH, r=nutR, $fn=6, center=true);
            	translate([-holeX,  holeY, nutH/2 - 4.01]) cylinder(h = nutH, r=nutR, $fn=6, center=true);
            	translate([-holeX, -holeY, nutH/2 - 4.01]) cylinder(h = nutH, r=nutR, $fn=6, center=true);
            }

            //shaft groves
            translate([ -16, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=studding_dia / 2, $fn=16);
            translate([-0.5, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=shaft_dia / 2,    $fn=16);

            //screw holes
            //translate([ holeX,  holeY, -10]) cylinder(h = 20, r=holeR, $fn=16);
            //translate([ holeX, -holeY, -10]) cylinder(h = 20, r=holeR, $fn=16);
            //translate([-holeX,  holeY, -10]) cylinder(h = 20, r=holeR, $fn=16);
            //translate([-holeX, -holeY, -10]) cylinder(h = 20, r=holeR, $fn=16);
            translate([ holeX,  holeY, -10]) polyhole(h = 20, d=holeR*2);
            translate([ holeX,  -holeY, -10]) polyhole(h = 20, d=holeR*2);
            translate([ -holeX,  holeY, -10]) polyhole(h = 20, d=holeR*2);
            translate([ -holeX,  -holeY, -10]) polyhole(h = 20, d=holeR*2);


            //corners
            rotate([0,0,30])   translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,-30])  translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,150])  translate([corner_cut-1, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,-150]) translate([corner_cut-1, 0, 0]) cube(size = [20,40,20], center = true);
        }
        if(c==1){
            // bridge
        	translate([ holeX,  holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
        	translate([ holeX, -holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
        	translate([-holeX,  holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
        	translate([-holeX, -holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
        }
    }
}

translate([0, 14, 0]) coupling(c=0);
translate([0, -14, 0]) rotate([0,0,180]) coupling(c=1);
