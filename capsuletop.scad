/*##################################################################################
#       Capsule top model
#
# Based on guesswork and pixie magic
#
##################################################################################*/

// Modify these
TOTAL_HEIGHT=40;
TOTAL_DIAMETER=28.5;

// Not these
RADIUS=TOTAL_DIAMETER/2;
CYL_HEIGHT=TOTAL_HEIGHT - RADIUS;

module mainCylinder()
{
    color("red")
        cylinder(CYL_HEIGHT, RADIUS, RADIUS, $fn = 64);
}

module baseCylinder()
{
    color("green")
    union()
    {
        cylinder(6, RADIUS, RADIUS, $fn = 64); 
        translate([0, 0, 6])
            cylinder(10, RADIUS * 0.6, RADIUS * 0.6, $fn = 64);
        translate([0, 0, 16])
            cylinder(13, 4.1, 4.1, $fn = 64);
    }
}

module endCap()
{
    color("blue")
        sphere(RADIUS, $fn = 64);
}

//translate([0, 0, -12])
//    baseCylinder();

translate([0, 0, 9])
    union()
    {
        difference()
        {
            union()
            {
                endCap();
                mainCylinder();
            }
            translate([0, 0, -15])
                baseCylinder();
        }

        translate([0, 0, CYL_HEIGHT])
            endCap();
    }
