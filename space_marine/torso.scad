// torso module
module torso() {
   height=6.7;
   depth=3.6;
   width=4.7;
   arm_r=3.8;
   head_r=6;
   // neck ring
   translate([0, 0, height*2.18]) rotate([5, 0, 0]) difference() {
      cylinder(head_r/2, head_r, head_r);
      translate([0, 0, -0.1]) cylinder(head_r/2+0.2, head_r*0.9, head_r*0.9);
      
   }

   // chest
   intersection() {
      difference() {
         translate([0,0,3.5]) scale([width,depth,height])
            sphere($fa=0.50,$fs=0.80, r=width/1.9);
         union() {
            translate([0,  0,  16])
               sphere(head_r); // head
            translate([0, 10,  -11]) rotate([90, 0, 0])
               cylinder(26, 8, 18); // abdomen
            translate([width*2, 0, height+width])  sphere(arm_r);
            translate([-width*2, 0, height+width]) sphere(arm_r);
            scale([width*0.95, depth * 0.95, height *0.95]) sphere(width/1.9);
         }
      }
      translate([-18, 0, 19.5]) rotate([0, 90, 0])
         cylinder(36, 20, 20); // abdomen
   }
}
