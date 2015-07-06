$fa=0.5;
$fs=0.75;
module squircle(){
c_radius = 3;
c_height = 20;


difference(){
 intersection ()
 {
  sphere(6.5);
  translate([-5,-5,-5])cube([10,10,10]);
 }

union ()
{
translate([0,c_height/2,0])rotate([90,0,0])cylinder(c_height,c_radius,c_radius);
translate([-c_height/2,0,0])rotate([0,90,0])cylinder(c_height,c_radius,c_radius);
translate([0,0,-c_height/2])rotate([0,0,90])cylinder(c_height,c_radius,c_radius);
}
}
}
scale([6,1,6])
squircle();