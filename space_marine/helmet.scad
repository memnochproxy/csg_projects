// helmet module
module helmet(diameter) {
   half_bell_r=diameter*0.55;
   half_bell_h=diameter/3;

   scale([1, 1.25, 1]) union() {
      difference() {
         union() { // bell shape
            translate([0, 0, diameter/2]) sphere(diameter/2);
            translate([0, 0, 0]) cylinder(diameter/2, diameter/2, diameter/2);
         }
         translate([0, -diameter*0.77, -0.1])
         union() { // face cutout
            intersection() {
               translate([-0.1, 0, 0]) cube([diameter/2, diameter/2, diameter/2+0.2]);
               translate([0, -1, -diameter*0.62]) rotate([0, -13, 0])
                  cube([diameter, diameter, diameter+0.2]);
            }
            mirror([1, 0, 0]) intersection() {
               translate([-0.1, 0, 0]) cube([diameter/2, diameter/2, diameter/2+0.2]);
               translate([0, -1, -diameter*0.62]) rotate([0, -13, 0])
                  cube([diameter, diameter, diameter+0.2]);
            }
         }
      }

      // rear half bell
      intersection() {
         union() {
            translate([0, 0, half_bell_h]) cylinder(diameter/8, half_bell_r, diameter/2);
            cylinder(half_bell_h, half_bell_r, half_bell_r);
         }
         translate([-diameter/1.75, 0, 0]) cube([diameter*1.15, diameter,diameter]);
      }
      // head crest
      intersection() {
         difference() {
            translate([half_bell_h*0.5, -0.1*half_bell_h, 1.5*half_bell_h]) rotate([0, -90, 0])
               cylinder(half_bell_h, half_bell_r*1.05, half_bell_r*1.05);
            translate([half_bell_h*0.5-0.1, -0.1*half_bell_h, 1.45*half_bell_h]) rotate([0, -90, 0])
               cylinder(half_bell_h-0.2, half_bell_r*1.04, half_bell_r*1.04);
         }
         translate([-diameter/1.75, -0.6, 0]) cube([diameter*1.15, diameter, 2*diameter]);
      }
   }
   // ears
   translate([ diameter/2.2, 0, diameter*0.36])                   ear(diameter*0.6);
   translate([-diameter/2.2, 0, diameter*0.36]) mirror([1, 0, 0]) ear(diameter*0.6);
  
   // jowl-blocks
   jowl(diameter);
   mirror([1, 0, 0]) jowl(diameter);

   translate([0, -diameter*0.32, 0]) mask(diameter);



}

module mask(diameter) {
   mask_w = diameter *0.8;
   scale([1, 0.6, 1])
   union() {
      // basic mask
      intersection() {
         union() {
            cylinder(diameter/2, mask_w/2, mask_w*0.35);
            snout(mask_w);
         }
         translate([-mask_w/2, -mask_w, 0]) cube(mask_w);
      }
   }
   // eyes
   eye(mask_w);
   mirror([1, 0, 0]) eye(mask_w);
}
module eye(mask_w) {
   translate([mask_w*0.25, -0.10*mask_w, 0.55*mask_w]) rotate([0, 0, 25]) scale([1, 0.5, 0.5]) sphere(1);
}
module snout(mask_w) {
   translate() half_snout(mask_w);
   mirror([1, 0, 0]) half_snout(mask_w);
}
module hoze(mask_w) {
  // TODO 
}

module half_snout(mask_w) {
   intersection() {
      union() {
         difference() {
            translate([0.25, -mask_w*0.38, 0.30]) rotate([-5, 0, 45]) difference() {
               scale([1, 0.6, 1.5]) sphere(mask_w*0.31);
            }
            translate([0.12, -mask_w*0.64, -0.07]) scale([1, 0.7, 1.5]) sphere(mask_w*0.30);
         }
         translate([0, -mask_w*0.53, 0]) rotate([-45,0,0]) cube(mask_w*0.216); // chin
         // grille
         translate([0, 0.4, 0]) intersection () {
            union() {
               translate([0.05, -mask_w*0.6, 0]) rotate([0,-90,0]) cube([mask_w*0.4, 0.3, 0.1]);
               translate([0.3, -mask_w*0.6, 0]) rotate([0,-90,0]) cube([mask_w*0.4, 0.3, 0.1]);
               translate([0.6, -mask_w*0.6, 0]) rotate([0,-90,0]) cube([mask_w*0.4, 0.3, 0.1]);
               translate([0.9, -mask_w*0.6, 0]) rotate([0,-90,0]) cube([mask_w*0.4, 0.3, 0.1]);
            }
            scale([1, 1, 1.7]) rotate([ 90, 0, 0]) cylinder(mask_w, mask_w*0.23, mask_w*0.23);
         }
      }
      translate([0, -mask_w*0.9, 0]) cube(5);
   }
}
module ear(diameter) {
   ear_h = diameter * 0.17;
   ear_r = diameter * 0.3;
   rotate([0, 90, 0]) union() {
      cylinder(ear_h, ear_r, ear_r );
      difference() {
         cylinder(ear_h*1.25, ear_r*0.75, ear_r*0.75 );
         union() {
            translate([0, ear_r*0.5, -0.1]) cube([ear_r*0.25, ear_r*0.25, 1.4*ear_h+0.2]);
            translate([0, -ear_r*0.75, -0.1]) cube([ear_r*0.25, ear_r*0.25, 1.4*ear_h+0.2]);
         }
      }
      translate([0, -ear_r, 0]) cube([ear_r*2, ear_r*2, ear_h]);
   }
}


module jowl(diameter) {
   jowl_h = diameter*0.32;
   jowl_w = diameter*0.15;
   jowl_d = diameter*0.27;

   translate([diameter*0.39, -jowl_d*1.37, 0]) union() {
      intersection() {
         cube([jowl_w, jowl_d, jowl_h]);
         translate([jowl_w*0.6, 0, -0.5*jowl_h]) rotate([0, -45, 0])
            cube([2*jowl_w, 2*jowl_d, 2*jowl_h]);
      }
      // air tube fitting
      translate([jowl_w*0.5, 0, 0.2*jowl_h]) rotate([90, 0, 0])
         cylinder(jowl_w*0.3, jowl_w*0.4, jowl_w*0.4);
   }
}
$fa=0.21;
$fs=0.28;
helmet(5);

