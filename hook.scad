// globals
co_radius = 40;
co_height = 10;
tab_width = 40;
tab_thickness = 10;
base_thickness = 6;

module screwHole() {
  module narrowHole() {
    module head() {
      translate([20,0,0])
        cylinder(r=4.5, h=base_thickness*1.1, center=true);
    }

    module body() {
      translate([15,0,0])
        cube([12,9,base_thickness*1.1], center=true);
    }

    head();
    body();
  }

  module wideHole() {
   cylinder(r=10, h=base_thickness*1.1, center=true);
  }

  narrowHole();
  wideHole();
}

module hook() {
  module supportTab() {
    cube([70, tab_width, base_thickness], center=true);
  }

  module baseTab() {
    translate([-35, 0, 12])
     cube([tab_thickness, tab_width, 30], center=true);
  }

  module inclinedTab() {
    translate([-25, 0, 33])
      rotate([0, 45, 0])
        cube([tab_thickness, tab_width, 30], center=true);
  }
  
  module bridgeTab() {
	translate([-23, 0, 12])
      rotate([0, -30, 0])
        cube([tab_thickness, tab_width, 28], center=true);
  }

  module tip() {
    translate([-5, 0, 35])
      rotate([0, 35, 0])
        resize([50, 40, 12])
          cylinder(r1=35, r2=1, h=tab_thickness*.75, $fn=3);
  }
  
  supportTab();
  baseTab();
  inclinedTab();
  bridgeTab();
  tip();
}

module screwHook() {
  difference() {
    union() { hook(); }
	union() { screwHole(); }
  }
}

module screwHookDesign() {
  rotate([0, 270, 0])
    translate([15.5,0,0])
      resize([29,14,14])
        screwHook();
}

screwHookDesign();

// include this file with
// include <screwhook/hook.scad>
// resize([0,10,10]) cylinder(h=10, r=20, center=true, $fn=3);

