// Modify these
TOTAL_HEIGHT=40;
TOTAL_DIAMETER=30;

// Not these
RADIUS=TOTAL_DIAMETER/2;
CYL_HEIGHT=TOTAL_HEIGHT - RADIUS;

module mainCylinder()
{
    color("red")
        cylinder(CYL_HEIGHT, RADIUS, RADIUS);
}

module baseCylinder()
{
    color("green")
    union()
    {
        cylinder(10, RADIUS, RADIUS); 
        translate([0, 0, 10])
            cylinder(10, RADIUS * 0.75, RADIUS * 0.75);
        translate([0, 0, 20])
            cylinder(13, 4.1, 4.1);
    }
}

module endCap()
{
    color("blue")
        sphere(RADIUS);
}

difference()
{
    union()
    {
        endCap();
        mainCylinder();
    }
    translate([0, 0, -22])
        baseCylinder();
}

translate([0, 0, CYL_HEIGHT])
    endCap();