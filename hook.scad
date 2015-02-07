TAB_WIDTH = 40;
TAB_THICKNESS = 10;
SUPPORT_THICKNESS = 6;
SUPPORT_HEIGHT = 70;

function radius(value) = value/2;

module screwHole() {
  module narrowHole() {
    WIDTH = 9;

    module head() {
      translate([20,0,0])
        cylinder(r=radius(WIDTH), h=SUPPORT_THICKNESS, center=true);
    }

    module body() {
      height = 12;
      translate([15,0,0])
        cube([height, WIDTH, SUPPORT_THICKNESS], center=true);
    }

    head();
    body();
  }

  module wideHole() {
   cylinder(r=10, h=SUPPORT_THICKNESS, center=true);
  }

  narrowHole();
  wideHole();
}

module hook() {
  module supportTab() {
    cube([SUPPORT_HEIGHT, TAB_WIDTH, SUPPORT_THICKNESS], center=true);
  }

  module baseTab() {
    length = 30;

    translate([-35, 0, 12])
     cube([TAB_THICKNESS, TAB_WIDTH, length], center=true);
  }

  module inclinedTab() {
    length = 30;
    fourty_five_degrees_vertically_right = [0, 45, 0];

    translate([-25, 0, 33])
      rotate(fourty_five_degrees_vertically_right)
        cube([TAB_THICKNESS, TAB_WIDTH, length], center=true);
  }
  
  module bridgeTab() {
    length = 28;
    thirty_degrees_vertically_left = [0, -30, 0];

    translate([-23, 0, 12])
      rotate(thirty_degrees_vertically_left)
        cube([TAB_THICKNESS, TAB_WIDTH, length], center=true);
  }

  module tip() {
    thirty_five_degrees_vertically_right = [0, 35, 0];
    
    translate([-5, 0, 35])
      rotate(thirty_five_degrees_vertically_right)
        resize([50, 40, 12])
          cylinder(r1=35, r2=1, h=TAB_THICKNESS*.75, $fn=3);
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

