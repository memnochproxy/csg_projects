$fa=0.5;
$fs=0.75;
diameter=20;
thickness=4;
ring_od=diameter * 1.02;
ring_id=diameter * 0.95;
slat_w =diameter *.21;
slat_depth = thickness * 0.9;

module wooden_slat() {
	intersection() {
	  translate([-slat_w/2, -diameter, -slat_w/2]) cube([slat_w, diameter*3, slat_depth]);
	  translate([0, diameter, -0.5]) rotate([90, 0, 0]) cylinder(diameter*2, slat_w/1.7, slat_w/1.7);
	}
}

module wooden_shield() {
   intersection() {
      translate([0,0,-slat_w/2]) cylinder(thickness, diameter, diameter);
      union() {
         translate([-4.01*slat_w, 0, 0]) wooden_slat();
         translate([-3.01*slat_w, 0, 0]) wooden_slat();
         translate([-2.01*slat_w, 0, 0]) wooden_slat();
         translate([-1.0 * slat_w, 0, 0]) wooden_slat();
         translate([ 0, 0, 0]) wooden_slat();
         translate([1.01*slat_w, 0, 0]) wooden_slat();
         translate([2.01*slat_w, 0, 0]) wooden_slat();
         translate([3.01 * slat_w, 0, 0]) wooden_slat();
         translate([4.01 * slat_w, 0, 0]) wooden_slat();
      }
   }
}
module metal_ring() {
  difference() {
    cylinder(1.1* thickness, ring_od, ring_od);
    translate(0,0,-0.2*thickness) cylinder(1.3 * thickness, ring_id, ring_id);
  }
}
module rivet() {
   intersection() {
       difference() {
         sphere(1.75);
         sphere(1);
       };
       cylinder(2, 2, 2);
   }
}
module metal_dome() {
   union() {
      translate([-diameter, -slat_w/2 ,0]) cube([2*diameter,slat_w,0.3]);
      intersection() {
         difference() {
            sphere(diameter/4);
            sphere(diameter/5);
         };
         cylinder(diameter/4, diameter/4, diameter/4);
      }
      translate([-4.0*slat_w, 0, 0]) rivet();
      translate([-3.0*slat_w, 0, 0]) rivet();
      translate([-2.0*slat_w, 0, 0]) rivet();
      translate([ 4.0*slat_w, 0, 0]) rivet();
      translate([ 3.0*slat_w, 0, 0]) rivet();
      translate([ 2.0*slat_w, 0, 0]) rivet();
   }
}
// resulting shield
union() {
  translate([0,0,slat_w/2]) wooden_shield();
  translate([0,0,-0.1]) metal_ring();
  translate([0,0,slat_depth]) metal_dome();
}
