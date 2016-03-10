GLOBAL_REFINEMENT = 50;

CENTER = [ 0, 0, 0];

BLACK = "Black";
WHITE = "White";
GREY = "Grey";
PURPLE = "Purple";

module cfk_base(){
    file = "nanoquad-v4.dxf";
    layout_id_in_file = "0";
    height = 2;
    
    color(BLACK)
    translate(CENTER)
    linear_extrude(height = height, center = true)

    import(file = file, layer = layout_id_in_file);
}

module naze32(){
    height = 1;
    border_radius = 2;
    side = 32;
    offset_x = negative(side/2);
    offset_y = negative(side/2);
    offset_z = 5;
    
    color(WHITE)
    difference() {
        translate([offset_x, offset_y, offset_z])
        rounded_cube(side, heigth, border_radius);
    }
}

module rounded_cube(side, heigth, border_radius){
    minkowski()
        {
            cube([side,side,height]);
            cylinder(r=border_radius,h=height);
        }
}


module mount(offset_x, offset_y){
    offset_z = -2;
    height = 18;
    radius =  1.6;
    
    color(GREY)
        translate([ offset_x, offset_y, offset_z])
            cylinder(height,radius,radius);
}

module mounts(){
    FROM_MOUNT_TO_CENTER = 15.25;
    distance = FROM_MOUNT_TO_CENTER;
    
    mount(negative(distance), negative(distance));
    mount(negative(distance), distance);
    mount(distance, negative(distance));
    mount(distance, distance);
}



module cfk(){
    file = "upperv4.dxf";
    layout_id_in_file = "0";
    offset_x = -62;
    offset_y = -42;
    offset_z = 10;
    
    color(BLACK)
        translate([ offset_x, offset_y, offset_z])
            linear_extrude(height = 1, center = true)
                import(file = file, layer = layout_id_in_file);
}

module motor_base(offset_x, offset_y){
    offset_z = 4;
    height = 6;
    bottom_radius = 8;
    top_radius = 10.5;
    
    
    color(BLACK)
        translate([ offset_x, offset_y, offset_z])
            cylinder(heigth, bottom_radius, top_radius, center = true);
}
    
module motor_middle(offset_x, offset_y){
    offset_z = 7;
    radius = 10.5;
    height = 5;
    
    color(PURPLE)
        translate([ offset_x, offset_y, offset_z])
            cylinder(height, radius, radius);
}

module motor_top(offset_x, offset_y){
    height = 9;
    bottom_radius = 10.5;
    top_radius = 5;
    offset_z = 16;
    
    color(BLACK)
        translate([ offset_x, offset_y, offset_z])
            cylinder(height, bottom_radius, top_radius, center = true);
}

module motor_prop(offset_x, offset_y){
    lower_opacity = 0.2;
    transparent_gray = [0, 0, 0, lower_opacity];
    offset_z = 21;
    height = 2;
    radius = 50;
    
	color(transparent_gray)
        translate([ offset_x, offset_y, offset_z])
            cylinder(height, radius, radius);    
}

module motor(offset_x, offset_y)
union(){
    motor_base(offset_x, offset_y);
	motor_middle(offset_x, offset_y);
    motor_top(offset_x, offset_y);
    motor_prop(offset_x, offset_y);
}

module motors(){
    motor(-54, -53);
    motor(54, 53);
    motor(-54, 53);
    motor(54, -53);
}



module main(){
    $fn=GLOBAL_REFINEMENT;
    cfk_base();
    naze32();
    mounts();
    cfk();
    motors();
}

function negative(number) = number * -1;

main();