// boot module

foot_w = 12;
foot_l = 16;
module boot() {

   intersection() {
      // boot sole boundary
      translate([0, -foot_l*0.45, 0]) cylinder(foot_w, foot_l*0.9, foot_l*0.9);

      // rounding of toe and heel
      translate([-10, -3, -4]) rotate([0,90,0]) cylinder(foot_l, foot_l*0.8, foot_l*0.8);

      union() {
        // upper sole
         intersection() {
            scale([1, 3, 1.5])               sphere(foot_w/2);
            scale([0.9, 2.9, 2])             sphere(foot_w/2);
            translate([0, -foot_l*0.45, 1])  cylinder(foot_w, foot_l*0.9, foot_l*0.9);
            // toe-heel rounding
            translate([0, -0.25*foot_l, 0])  cylinder(foot_w, foot_l*0.66, foot_l*0.66);
         }

         difference() {
            // boot tread
           intersection() {
               scale([1, 3, 1.4])               sphere(foot_w/2);
               scale([1.2, 3.3, 1.5])           sphere(foot_w/2);
               translate([0, -foot_l*0.45, 0]) cylinder(foot_w, foot_l, foot_l);
            }

            union() {
               // arch
               translate([-foot_w/2, 0, 0]) rotate([0,90,0]) cylinder(foot_w, foot_w/9, foot_w/9);
               // toe-heel rounding
               translate([0, -foot_l*0.45, 1]) cylinder(foot_w, foot_l*0.9, foot_l*0.9);
            }
         }
      }
   }
}
