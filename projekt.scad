use <utils.scad>
width = 1000;
filter_ratio = 0.2;
fillet_width = 10;
shell = 20;
box_width = 200;
box_height = 100;
pipe_diameter = 100;
earth_depth = 2000;
building_height = 2000;
waste_pipe_diameter = 50;
waste_pipe_length = 200;

module fillett() {
 fillet(fillet_width, width); 
}

module tank() {
    difference() {
        cube([width, width, width]);
				translate([shell/2, shell/2, shell]) cube([width - shell, width - shell, width]);
        translate([width, 0, 0]) rotate(90) fillett(); 
        translate([width, width, 0]) rotate(180) fillett(); 
    }
		translate([0, 0, width + shell]) cube([width, width, shell]);
}

module smart_unit() {
  	color("salmon") cube([width * filter_ratio, box_width, box_height]);
}

module filter() {
    difference() {
        cube([width * filter_ratio, width, width]);
        fillett();
        translate([width, 0, 0]) rotate(90) fillett();
        translate([width, width, 0]) rotate(180) fillett();
        translate([0, width, 0]) rotate(270) fillett();
				translate([shell/2, shell/2, shell]) cube([width * filter_ratio - shell, width - shell, width]);
    }
		translate([0, 0, width + shell]) cube([width * filter_ratio, width, shell]);
		translate([0, 0, width + shell]) smart_unit();
}

module pipe() color("aqua") {
    cylinder(d = pipe_diameter, h = earth_depth + building_height);
}

module earth() {
    color("sienna") square(2 * width);
}

module waste_pipe() {
    rotate(90, [1, 90, 0]) cylinder(d = waste_pipe_diameter, h = waste_pipe_length);
}

tank();
translate([- (width * filter_ratio) - shell, 0, 0]) filter();
translate([- (width * filter_ratio) / 2 - shell, box_width / 2, 0]) pipe();
translate([- width, - width, earth_depth]) earth();
translate([- (width * filter_ratio), 0, earth_depth]) smart_unit();
translate([- (width * filter_ratio) + box_width, box_width / 2, earth_depth + box_height / 2]) 
  waste_pipe();
