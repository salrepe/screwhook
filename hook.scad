// globals
co_radius = 40;
co_height = 10;
tab_width = 40;
tab_thickness = 10;
base_thickness = 6;

module complexObject() {
  difference() {

    union() {
      //cylinder(r=(co_radius-10), h=co_height, center=true);
      cube([70, tab_width, base_thickness], center=true);

      //lower tab hook
        translate([-35, 0, 12])
        cube([tab_thickness, tab_width, 30], center=true);
      //end

      //middle upper tab hook
        translate([-25, 0, 33])
        rotate([0, 45, 0])
	cube([tab_thickness, tab_width, 30], center=true);
      //end

      //upper tab hook
        translate([-5, 0, 35])
        rotate([0, 35, 0])
        resize([50, 40, 12])
        cylinder(r1=35, r2=1, h=tab_thickness*.75, $fn=3);
	//cube([tab_thickness, tab_width, 30], center=true);
      //end

    }

    union() {
      cylinder(r=10, h=base_thickness*1.1, center=true);

      //upper screw slot
        translate([15,0,0])
        cube([12,9,base_thickness*1.1], center=true);

        translate([20,0,0])
        cylinder(r=4.5, h=base_thickness*1.1, center=true);
      //end

    }

  }
}
rotate([90, 0, 0])
translate([0,20,0])
complexObject();

// include this file with
// include <screwhook/hook.scad>
// resize([0,10,10]) cylinder(h=10, r=20, center=true, $fn=3);

