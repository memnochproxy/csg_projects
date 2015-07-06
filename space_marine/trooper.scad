// this is a crude trooper model
//
$fa=0.75;
$fs=1.5;

fig_h = 70;

include <helmet.scad>
translate([0, 0, (fig_h-4)])  helmet(10);

include <shoulder.scad>
translate([ 9, 0, (fig_h-22)]) shoulder_pad(21);
translate([-9, 0, (fig_h-22)]) mirror([-1, 0, 0]) shoulder_pad(21);

include <torso.scad>
translate([0, 0, (fig_h-24)]) torso();

include <belt.scad>
translate([0, 0, (fig_h-28)]) belt();

include <upper-leg.scad>
translate([ 6, 0, (fig_h-46)]) upper_leg();
translate([-6, 0, (fig_h-46)]) rotate([0, 0, 180]) upper_leg();

include <lower-leg.scad>
translate([ 9, 0, (fig_h-67)]) lower_leg();
translate([-9, 0, (fig_h-67)]) mirror([ 1, 0, 0]) lower_leg();

include <boot.scad>
translate([ 9, 0, (fig_h-70)]) boot();
translate([-9, 0, (fig_h-70)]) mirror([ 1, 0, 0]) boot();

// eof
