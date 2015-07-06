$fa=0.5;
$fs=0.75;


gun_w = 5;
gun_h = 2*gun_w;
gun_l = 5*gun_w;
wide_w = 7;
button_w = gun_w*0.5;
cspring_r = gun_w*0.2;
fgrip_r = (gun_w/2) + 0.3;
barrel_r = (cspring_r*1.5);

module bolt_gun()
{
	//laser sight
    translate([gun_w/2, gun_l - 1, gun_h - 1.5]) rotate([-90,0,0]) 
        cylinder(3, cspring_r+0.3, cspring_r+0.3);
    //button
    translate([gun_w/4, 0, gun_w*.9]) rotate([90,0,0]) 
        cube([button_w, button_w, .85]);
    //knob
	translate([-1, gun_w*.5, gun_w*1.35]) rotate([0,90,0]) 
	        cylinder(wide_w, button_w/2, button_w/2);
    //compression spring
    translate([gun_w/2, gun_l-(gun_l*0.4), gun_h*0.2]) rotate([-90,0,0])
        cylinder(gun_l/2, cspring_r, cspring_r);
    //front grip
    difference(){
        translate([gun_w/2, gun_l-(gun_l*0.4), gun_h*0.2]) rotate([-90,0,0])
            cylinder(gun_l/2.5, fgrip_r, fgrip_r);
        union(){
            translate([0, gun_l-(gun_l*0.325), 0]) grip_groove();
            translate([0, gun_l-(gun_l*0.225), 0]) grip_groove();
            translate([0, gun_l-(gun_l*0.125), 0]) grip_groove();
            translate([0, gun_l-(gun_l*0.025), 0]) grip_groove();
        }
    }
	difference()
	{
		cube([gun_w, gun_l, gun_h]);
	    union(){
		    //trigger space
		    translate([-0.05,-0.05,-0.05]) 
		        cube([gun_w + 0.1, gun_l/3, gun_h*0.4]);
	        //hammer lever area
	        translate([-0.05,0,gun_w*1.5]) rotate([45,0,0]) 
	            cube([gun_w + 0.1, gun_w + 0.2, gun_w + 0.2]);
            //frontal grip
            translate([-0.05, gun_l-(gun_l*0.4)+0.05, -0.05]) 
                cube([gun_w+0.1, gun_l*0.4, gun_h*0.2]);
        }
		
	}
}
module barrel(){
    //barrel
    difference(){
        rotate([-90,0,0])
        cylinder(4, barrel_r, barrel_r);
    translate([0,2,0]) union(){
        translate([0,-3,0]) rotate([-90,0,0]) cylinder(6, 0.8, 0.8);
        translate([-2.5,0,0]) rotate([0,90,0]) cylinder(5,0.8, 0.8);
    }
    }
}
translate([gun_w/2, gun_l - 0.1, gun_h/1.9]) barrel();
module grip_groove(){
    translate([gun_w/2, 0, fgrip_r/2]) rotate([90,0,0]) difference(){
        cylinder(1, fgrip_r, fgrip_r);
        translate([0,0,-0.1]) cylinder(1.2, gun_w*0.4, gun_w*0.4);
    }
}
//grip_groove();
bolt_gun();
