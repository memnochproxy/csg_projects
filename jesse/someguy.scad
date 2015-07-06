//arm
translate([0,40,0])rotate([90,0,0]) cylinder(80,8,8);
//head
translate([0,0,-18])sphere(15);
difference()
{
//tall clyinder 
 cylinder(100,10,10);
translate([-15,0,40]) cube([30,2,60]);
}