// belt module
belt_h=3;
module belt_pouch() {
   difference() {
      translate([-belt_h*0.75, 0, 0]) cube([belt_h*1.5, belt_h*0.2, belt_h]);
      translate([-belt_h/4, -belt_h*0.3, belt_h/4]) cube([belt_h*.5, belt_h*0.45, belt_h*0.5]);
   }
}
module belt() {
   belt_r         = 10;
   pouch_offset   = belt_r * -1.05;
   leg_r          = belt_r/1.22;
   groin_r        = belt_r*1.1;

   scale([1, 0.8, 1]) union() {
      difference() {
         cylinder(belt_h, belt_r, belt_r);
         translate([0,0, -0.25])cylinder(belt_h+0.5, belt_r*0.9, belt_r*0.9);
      }
      rotate([0, 0,   0]) translate([0, pouch_offset, -3]) scale([1.4, 1.4, 2.4]) belt_pouch();
      rotate([0, 0,  45]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0,  90]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0, 135]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0, 180]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0, 225]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0, 270]) translate([0, pouch_offset, 0]) belt_pouch();
      rotate([0, 0, 315]) translate([0, pouch_offset, 0]) belt_pouch();

      // groin
      difference() {
         translate([0, 0, -2]) sphere(belt_r*0.94);
         union() {
            sphere(belt_r * 0.91);
            translate([0, 0, -0.2]) cylinder(belt_r*1.5, groin_r+1, groin_r+1);
            scale([ 0.7, 1.5, 1]) translate([ 1.2*leg_r, -1, -1.3* leg_r]) sphere(leg_r);
            scale([ 0.7, 1.5, 1]) translate([-1.2*leg_r, -1, -1.3* leg_r]) sphere(leg_r);
            translate([0, 5, -6]) rotate([90, 0, 0]) cylinder(10, leg_r*0.75, leg_r*0.75);
         }
      }
   }
}
//belt();
