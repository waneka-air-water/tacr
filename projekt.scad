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
earth_layer = 200;

module fillett() {
 fillet(fillet_width, width); 
}

module tank() color("aquamarine") {
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
    color("springgreen") difference() {
        cube([width * filter_ratio, width, width]);
        fillett();
        translate([width, 0, 0]) rotate(90) fillett();
        translate([width, width, 0]) rotate(180) fillett();
        translate([0, width, 0]) rotate(270) fillett();
				translate([shell/2, shell/2, shell]) cube([width * filter_ratio - shell, width - shell, width]);
    }
		color("springgreen") translate([0, 0, width + shell]) cube([width * filter_ratio, width, shell]);
		translate([0, 0, width + 2 *shell]) smart_unit();
}

module pipe() color("aqua") {
    cylinder(d = pipe_diameter, h = earth_depth + building_height);
}

module earth() {
    color("sienna") linear_extrude(earth_layer) square(5 * width);
}

module waste_pipe() {
    color("dimgray") rotate(100, [0, 1, 0]) linear_extrude(waste_pipe_length, scale = 0.6)
        circle(d = waste_pipe_diameter);
}

module collector_pipe() color("aqua") {
    rotate([90, 0, 0]) {
    		difference() {
            cylinder(d = pipe_diameter, h = 4 * width);
						translate([- pipe_diameter / 2, 0, -1]) cube([pipe_diameter, pipe_diameter, 4 * width + 2 ]);
        } 
   }
}

module building() {
    roof_diameter = width + 3 * pipe_diameter;
    cube([2 * width, 4 * width, building_height]);
    color("slategray") translate([10, -20, 0]) cube([width, 5, building_height - 100]);
		color("brown") translate([width , 4 * width, building_height + roof_diameter / 2]) rotate([90, 0, 0]) rotate([0, 0, 90]) 
        linear_extrude(4 * width) circle(roof_diameter, $fn = 3);
}

translate([0, 0, - earth_depth]) tank();
translate([- (width * filter_ratio) - shell, 0, - earth_depth]) filter();
translate([- (width * filter_ratio) / 2 - shell, box_width / 2, - earth_depth]) pipe();
translate([-3 * width, -3 * width, - earth_layer]) earth();
translate([- (width * filter_ratio), 0, 0]) smart_unit();
translate([- (width * filter_ratio) + box_width / 2, box_width / 2, box_height / 2]) 
    waste_pipe();
translate([-2 * width - box_width - pipe_diameter, - 2 * width, 0]) building();
translate([- (width * filter_ratio) / 2 - shell, 2 * width, building_height]) collector_pipe();
