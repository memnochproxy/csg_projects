module shoulder_pad(diameter) {
   bounding_box_w = diameter * 1.2;
   rim_w = diameter * 0.06;
   rim_h = 1.08;
   scale([1, 1.2, 1.7]) difference() {
      intersection() {
         union() {
            sphere(diameter * 0.5);
            difference() { // this is the raised edge
               sphere((diameter/2)*rim_h);
               translate([rim_w, -(diameter/2)-0.8, rim_w])
                  cube(diameter+4);
            }
         }
         translate([0, -(diameter/2)-0.4, 0]) cube(diameter*1.6);
      }
      sphere(diameter * 0.4);
   }
}
//$fa=1;
//$fs=1;
//shoulder_pad(10);
