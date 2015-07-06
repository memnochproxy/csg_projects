// lower_leg module
lleg_h=20;
lleg_rl=8;
lleg_ru=6;
module lower_leg() {

  intersection() {
     translate([-lleg_h*0.5, 0, lleg_h*0.95]) rotate([0, 83, 0])
         cylinder(lleg_h, lleg_h, lleg_h);
 
     rotate([0, -7, 0]) union() {
         // leg
         difference() {
            cylinder(lleg_h, lleg_rl, lleg_ru);
            union() {
               translate([0, 0, -0.1])
                  cylinder(lleg_h+0.2, lleg_rl*0.85, lleg_ru*0.85);

                translate([-0.05*lleg_rl, -lleg_rl, lleg_h*1.0]) 
                  intersection() {
                     rotate([-90, 0, 0])
                        cylinder(lleg_ru*2.8, lleg_ru*0.9, lleg_ru*0.9);
                     translate([ -lleg_ru*0.8, 0, -lleg_ru*0.8])
                        cube([lleg_ru*1.6, lleg_ru*2.8, lleg_ru*1.6]);
               }
               translate([-0.05*lleg_rl, -lleg_rl, 1.0]) 
                  rotate([0, 7, 0]) intersection() {
                     rotate([-90, 0, 0])
                        cylinder(lleg_ru*2.8, lleg_ru*1.1, lleg_ru*1);
                     translate([ -lleg_ru*0.8, 0, -lleg_ru*0.8])
                        cube([lleg_ru*1.75, lleg_ru*2.8, lleg_ru*1.75]);
               }
            
            } //~u
         }
         // knee
         translate([0, -lleg_ru*0.45, lleg_h]) rotate([-180, 0, 0]) intersection() {
            scale([1.2, 0.8, 2.1]) sphere(lleg_ru);
            rotate([-90, 0, 0])
               cylinder(lleg_ru*2.8, lleg_ru*0.9, lleg_ru*0.9);
            translate([ -lleg_ru*0.8, lleg_ru*0.4, -lleg_ru*0.8])
               cube([lleg_ru*1.6, lleg_ru*2.7, lleg_ru*1.6]);
         }
      } //~u
   } //~i
}
