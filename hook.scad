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
        translate([-10, 0, 38])
        rotate([0, 25, 0])
        resize([-10, 20, 20]) 
        cylinder(r1=23, r2=1, h=tab_thickness*1.1, $fn=3);
	//cube([tab_thickness, tab_width, 30], center=true);
      //end
        
    }

    union() {
      cylinder(r=10, h=base_thickness*1.1, center=true);
      
      //upper screw slot
        translate([ 10, 0, -6 ]) 
        resize([0, 15, 0]) 
        cylinder(r=15, h=base_thickness*2, $fn=3);
      //end

    }

  }
}

complexObject();

// include this file with
// include </Users/spider/Documents/screwhook/hook.scad>
// include </home/spider/Documents/screwhook/hook.scad>
// resize([0,10,10]) cylinder(h=10, r=20, center=true, $fn=3);

