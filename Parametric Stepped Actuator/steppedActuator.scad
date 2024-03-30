/*###################################################################################
#	Stepped actuator model
#
# Not much more to say so far
# Change the HEAD_OD variable to adjust outer diameter
# That's it
#
##################################################################################*/

// Inner diameter/shaft diameter
ID=7.5;
// Slim part
BASE_OD=13;
BASE_HEIGHT=9;
// Not slim part
HEAD_OD=15 ;    //Modify this
HEAD_HEIGHT=7;

module base()
{
    color("#FF0000")
        cylinder(BASE_HEIGHT, BASE_OD/2, BASE_OD/2);
}

module head()
{
    color("#0000FF")
        cylinder(HEAD_HEIGHT, HEAD_OD/2, HEAD_OD/2);
}

module innerBore()
{
    color("#00FF00")
        cylinder(BASE_HEIGHT + HEAD_HEIGHT, ID/2, ID/2);
}

difference()
{
    union()
    {
        head();
        translate([0, 0, HEAD_HEIGHT])
            base();
    }
    innerBore();
}
