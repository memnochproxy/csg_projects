// upper leg module
leg_r = 4.20;
leg_h = 16;
module upper_leg() {
   difference() {
      difference() {
         rotate([0, -6, 0]) union() {
            cylinder(leg_h,     leg_r* 1.25, leg_r);
            cylinder(leg_h*0.1, leg_r* 1.3,  leg_r*1.3);
         }
         rotate([0, -6, 0])  union() {
            translate([0, 0, -0.1]) cylinder(leg_h+0.2, leg_r, leg_r*0.9);
            translate([-leg_r*0.95, -0.2* leg_r,   leg_h*1.05])
               sphere(leg_r*2.1);
              translate([0, leg_r*1.5, 0]) rotate([90, 0, 0])
                 cylinder(leg_r*3, leg_r*0.7, leg_r*0.7);
              translate([0, -leg_r*1.25, -0]) rotate([-90, 0, 0])
                 intersection() {
                    cylinder(leg_r*3, leg_r*0.9, leg_r*0.9);
                    translate([-leg_r*0.65, -leg_r*0.8, 0])
                       cube([leg_r*1.3, leg_r, leg_r*2.5] );
              }
            }
         }
   }
}
