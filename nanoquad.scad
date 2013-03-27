//Detail steps
$fn=50;

//CFK
color("Black")
translate([ 0, 0, 0])
linear_extrude(height = 2, center = true, convexity = 0, twist = 0)
import(file = "nanoquad-v4.dxf", layer = "0");

//Naze32
color("White")
difference() {

	//rotate(a=[0,0,45])
	translate([ -16, -16, 5])
	minkowski()
	{
 		cube([32,32,1]);
 		cylinder(r=2,h=1);
	}
//	translate([ -25, -25, 6])
//      cylinder (h = 4, r=22, center = true, $fn=100);
//	translate([ 25, 25, 6])
//      cylinder (h = 4, r=22, center = true, $fn=100);
//	translate([ -25, 25, 6])
//      cylinder (h = 4, r=22, center = true, $fn=100);
//	translate([ 25, -25, 6])
//      cylinder (h = 4, r=22, center = true, $fn=100);
}

//Mounts
color("Grey")
translate([ -15.25,-15.25, -2])
cylinder(18,1.6,1.6,[0,0,0]);

color("Grey")
translate([ -15.25,15.25, -2])
cylinder(18,1.6,1.6,[0,0,0]);

color("Grey")
translate([ 15.25,-15.25, -2])
cylinder(18,1.6,1.6,[0,0,0]);

color("Grey")
translate([ 15.25,15.25, -2])
cylinder(18,1.6,1.6,[0,0,0]);

//CFK
color("Black")
translate([ -62, -42, 10])
linear_extrude(height = 1, center = true, convexity = 0, twist = 0)
import(file = "upperv4.dxf", layer = "0");


//Motors

module motor(x,y)
union(){
   //Base
	color("Black")
	translate([ x, y, 4])
	cylinder(h = 6, r1 = 8, r2 = 10.5, center = true);
   //Middel
	color("Purple")
	translate([ x, y, 7])
	cylinder(5,10.5,10.5,[0,0,0]);
   //Top
	color("Black")
	translate([ x, y, 16])
	cylinder(h = 9, r1 = 10.5, r2 = 5, center = true);
   //Prop
	translate([ x, y, 21])
	color([0, 0, 0, 0.2])
	cylinder(2,50,50,[0,0,0]);
}

motor(-54,-53);

motor(54,53);

motor(-54,53);

motor(54,-53);