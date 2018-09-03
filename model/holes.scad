include <dimlines.scad>

// i need

// 5mm
// 7/16
// 3/16
// and hole saws
// 3/4
// 1 1/2??????????

TUBE_COUNT = 4;
TUBE_GAP = 22.86;
TUBE_DIAMETER = (3 / 4) * 25.4;
TUBE_MOUNTING_HOLE_WIDTH = 109.22;
TUBE_MOUNTING_HOLE_HEIGHT = 45.72;
TUBE_MOUNTING_HOLE_DIAMETER = 5;
TUBE_OFFSET_X = 20.32;
TUBE_OFFSET_Y = 22.86;
TUBE_DECIMAL_OFFSET_X = 11.43;
TUBE_DECIMAL_OFFSET_Y = 7.62;
TUBE_DECIMAL_DIAMETER = 5;

TOGGLE_SWITCH_DIAMETER = (15 / 32) * 25.4;
ROTARY_SWITCH_DIAMETER = (7 / 16) * 25.4;
ROTARY_SWITCH_MOUNT_HOLE_DIAMETER = (3 / 16) * 25.4;
ROTARY_SWITCH_MOUNT_HOLE_DISTANCE = 20 + (ROTARY_SWITCH_DIAMETER / 2) + (ROTARY_SWITCH_MOUNT_HOLE_DIAMETER / 2);
ROTARY_SWITCH_TOTAL_DIAMETER = 3 * 25.4;
CONTROL_SIDE_GAP = 15;

BOX_DEPTH = 110.5;
BOX_WIDTH_SIDE = 142.5;
BOX_WIDTH_CHANNEL = 10.5;
BOX_WIDTH = (BOX_WIDTH_SIDE * 2) + BOX_WIDTH_CHANNEL;
BOX_HEIGHT_WITH_FOOT = 80;
BOX_HEIGHT = 70.5;
BOX_HEIGHT_FOOT = BOX_HEIGHT_WITH_FOOT - BOX_HEIGHT;
BOX_WIDTH_FOOT = 29;

FRONT_LED_DIAMETER = (7 / 16) * 25.4;

TUBE_PLATE_HEIGHT = 30;

SPACING = 10;

module HOLE(d, solid)
{
  if (solid == 1)
  {
    circle(d=d, $fn=100);
  }
  else
  {
    projection()
    circle_center(radius=d / 2, size=5);
  }
}

module LED_HOLES(solid)
{
  translate([(BOX_WIDTH_SIDE / 5) + BOX_WIDTH_SIDE + BOX_WIDTH_CHANNEL, BOX_HEIGHT_FOOT + (BOX_HEIGHT / 2)])
  union()
  {
    for (i = [0 : 1 : 3])
    {
      translate([i * (BOX_WIDTH_SIDE / 5), 0])
      HOLE(d=FRONT_LED_DIAMETER, solid=solid);
    }
  }
}

//ROTARY_SWITCH_TOTAL_DIAMETER = 3 * 25.4;
//CONTROL_SIDE_GAP = 10;
module TOP_CONTROL_HOLES(solid)
{
  // toggle switch hole
  translate([CONTROL_SIDE_GAP + (TOGGLE_SWITCH_DIAMETER / 2), BOX_DEPTH / 2])
  HOLE(d=TOGGLE_SWITCH_DIAMETER, solid=solid);

  // rotary switch hole
  translate([BOX_WIDTH_SIDE - (ROTARY_SWITCH_TOTAL_DIAMETER / 2) - CONTROL_SIDE_GAP, BOX_DEPTH / 2])
  union()
  {
    // center hole
    HOLE(d=ROTARY_SWITCH_DIAMETER, solid=solid);
    for (i = [0 : 1 : 5])
    {
      rotate(i * (360 / 6))
      {
        // mounting hole
        translate([ROTARY_SWITCH_MOUNT_HOLE_DISTANCE, 0])
        rotate(-(i * 360 / 6))
        HOLE(d=ROTARY_SWITCH_MOUNT_HOLE_DIAMETER, solid=solid);
      }
    }
  }
}

module TUBE_HOLES(solid)
{
  translate([(BOX_WIDTH_SIDE / 2) - (TUBE_MOUNTING_HOLE_WIDTH / 2), (BOX_DEPTH / 2) - (TUBE_MOUNTING_HOLE_HEIGHT / 2)])
  union()
  {
    translate([TUBE_OFFSET_X, TUBE_OFFSET_Y])
    union()
    {
      for (i = [0 : 1 : (TUBE_COUNT - 1)])
      {
        translate([i * (TUBE_GAP), 0])
        {
          // tube hole
          HOLE(d=TUBE_DIAMETER, solid=solid);
          
          // decimal led hole
          if (i != 0)
          {
            translate([-TUBE_DECIMAL_OFFSET_X, TUBE_DECIMAL_OFFSET_Y])
            HOLE(d=TUBE_DECIMAL_DIAMETER, solid=solid);
          }
        }
      }
    }
  
    HOLE(d=TUBE_MOUNTING_HOLE_DIAMETER, solid=solid);
    translate([TUBE_MOUNTING_HOLE_WIDTH, 0])
    HOLE(d=TUBE_MOUNTING_HOLE_DIAMETER, solid=solid);
    translate([0, TUBE_MOUNTING_HOLE_HEIGHT])
    HOLE(d=TUBE_MOUNTING_HOLE_DIAMETER, solid=solid);
    translate([TUBE_MOUNTING_HOLE_WIDTH, TUBE_MOUNTING_HOLE_HEIGHT])
    HOLE(d=TUBE_MOUNTING_HOLE_DIAMETER, solid=solid);
  }
}

translate([SPACING, SPACING])
union()
{
  // front control
  translate([0, BOX_DEPTH + SPACING])
  union()
  {
    LED_HOLES(solid=0);
    
    difference()
    {
      // base material
      union()
      {
        // one foot
        square([BOX_WIDTH_FOOT, BOX_HEIGHT_FOOT]);
  
        // other foot
        translate([BOX_WIDTH - BOX_WIDTH_FOOT, 0])
        square([BOX_WIDTH_FOOT, BOX_HEIGHT_FOOT]);
  
        // main thing
        translate([0, 0 + BOX_HEIGHT_FOOT])
        square([BOX_WIDTH, BOX_HEIGHT]);
      }
    
      LED_HOLES(solid=1);
    }
  }
  
  // top control side
  translate([BOX_WIDTH_SIDE + BOX_WIDTH_CHANNEL, 0])
  union()
  {
    TOP_CONTROL_HOLES(solid=0);
    difference()
    {
      // base material
      square([BOX_WIDTH_SIDE, BOX_DEPTH]);
      
      TOP_CONTROL_HOLES(solid=1);
    }
  }

  // tube side
  union()
  {
    TUBE_HOLES(solid=0);
    difference()
    {
      // base material
      square([BOX_WIDTH_SIDE, BOX_DEPTH]);
  
      TUBE_HOLES(solid=1);
    }
  }
}