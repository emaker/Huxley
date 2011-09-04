include<configuration.scad>;
use<library.scad>

bushing_height=7.8;
socket_width=8;
socket_depth=4;
bushing_width=12;
bushing_rodsize=7.8;//6.2;
bearing_length=4;
body_chamfers=1;
rod_clearance=0;//dia
thickness=0.51;
flange=1;

side=0;

module ptfe_bushing(a=45,b=0,c=10)
{
//body
difference()
{
	//positive
	union()
	{
		translate([0,socket_depth/2+6,bushing_height/2]) cube([socket_width,socket_depth,bushing_height],center=true);
		translate([0,bushing_width/4,bushing_height/2]) cube([bushing_width,bushing_width/2,bushing_height],center=true);
		//cylinder(h=bushing_height,r=bushing_width/2);
		polyhole(bushing_height,bushing_rodsize+thickness*4);
	}
	//negative
	union()
	{
		//groove
		polyhole(bushing_height, bushing_rodsize+rod_clearance);
		//body chamfers
		for(j=[0,1])
		{
			mirror([j,0,0]) union()
			{
				translate([bushing_width/2,bushing_width/2,0]) rotate([0,0,45]) cube([body_chamfers*sqrt(2),body_chamfers*sqrt(2),bushing_height*2],center=true);
				translate([socket_width/2,bushing_width/2+socket_depth,0]) rotate([0,0,45]) cube([body_chamfers*sqrt(2),body_chamfers*sqrt(2),bushing_height*2],center=true);
			}
		}
		//screw hole
		translate([0,(bushing_rodsize+rod_clearance)/2+1.5,bushing_height/2]) rotate([-90,0,0])
			cylinder(h=socket_depth*1.6,r=2.7/2, $fn=8);
		//slot
		translate([0,0,0]) rotate([0,0,45])
			linear_extrude(height = bushing_height, convexity = 10, twist = 90)
			translate([0, -bushing_rodsize+thickness*8-2.1, 0])
			square(size=[0.5,2.2]);//circle(r = 4);
		//outer rads
		for(j=[0,1])
		{
			mirror([j,0,0]) union()
			{
		translate([bushing_width/2,0,0]) cylinder(h=bushing_height,r=(bushing_width-(bushing_rodsize+thickness*4))/2, $fn=20);
			}
		}
		//igus flange clearance
		translate([0,0,bushing_height])
			cube([16,12,flange], center=true);

	}
}
}//end module ptfe_bushing

if(side==1)
{
	ptfe_bushing(130,-90,0);
}else{
	ptfe_bushing();
}
