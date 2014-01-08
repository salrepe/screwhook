// globals
co_radius = 40;
co_height = 10;
tab_width = 40;
tab_thickness = 10;

module complexObject() {
  difference() {
    
    union() {
      //cylinder(r=(co_radius-10), h=co_height, center=true);
      cube([70, tab_width, tab_thickness], center=true);
      
      // lower tab hook
        translate([-35, 0, 10])
        cube([tab_thickness, tab_width, 30], center=true);
      // end

      // middle upper tab hook
        translate([-35, 0, 10])
        rotate

      // end
        
    }

    union() {
      cylinder(r=10, h=co_height*1.1, center=true);
      
      // upper screw slot
        translate([ 10, 0, -6 ]) 
        resize([0,15,0]) 
        cylinder(r=15, h=co_height*20, $fn=3);
      // end

    }

  }
}

complexObject();

// include this file with
// include </Users/spider/Documents/try_openscad/hook.scad>
// resize([0,10,10]) cylinder(h=10, r=20, center=true, $fn=3);

