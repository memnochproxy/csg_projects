// helmet module

module helmet(diameter) {


   translate([0, 0, diameter/2]) sphere(diameter/2);
   translate([0, 0, 0]) cylinder(diameter/2, diameter/2, diameter/2);

   // rear half bell
   half_bell_r=diameter*0.55;
   half_bell_h=diameter/3;
   intersection() {
      union() {
         translate([0, 0, half_bell_h]) cylinder(diameter/8, half_bell_r, diameter/2);
         cylinder(half_bell_h, half_bell_r, half_bell_r);
      }
      translate([-diameter/1.75, 0, 0]) cube([diameter*1.15, diameter,diameter]);
   }
}
module ear(diameter) {

}

$fa=0.5;
$fs=0.5;
helmet(5);

