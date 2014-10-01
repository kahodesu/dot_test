///////////////////////////////////////////////////////////////////////
// Work in progress code for camera vision with Red LED's for game   //
// using following exisiting code:                                   //
//    * Shiffman's Example 16_11 Simple Color Tracking               //
//    * Open CV live camera example                                  //
///////////////////////////////////////////////////////////////////////

import java.util.*;
import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture cam;

//PImage img;
// A variable for the color we are searching for.
color trackColor; 

int padding = 100;
FloatList distances;
IntList xDot;
IntList yDot;

void setup() {
  size(1000, 600);
  //img = loadImage("dottest2.jpg");  // Load the image into the program  
  xDot = new IntList();
  yDot = new IntList();
  trackColor = -131072;
  smooth();
  // noLoop();
   
    String[] cameras = Capture.list();
  //Option 15 is 960 x 540, 30 fps
  cam = new Capture(this, cameras[15]);
  

  cam.start();
  
}

void draw() {
   if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  cam.loadPixels();
//background(0);
  brightestRed();
}
void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*cam.width;
  trackColor = cam.pixels[loc];
  println(trackColor);
}





