void brightestRed() {
  distances.clear();
  int closestX = 0;
  int closestY = 0;
  float record =500;
  //===============================================================    
  for (int x = 10; x < cam.width-10; x ++ ) {
    for (int y = 10; y < cam.height-10; y ++ ) {

      int loc = x + y*cam.width; 
      // What is current color
      color currentColor = cam.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < record) {
        record = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  xDot.append(closestX);
  yDot.append(closestY);
  //    println(xDot);
  //  println(yDot);
  //===============================================================   
  closestX = 0;
  closestY = 0;
  record =500;
  for (int x = 10; x < cam.width-10; x ++ ) {
    for (int y = 10; y < cam.height-10; y ++ ) {
      if (dist(x, y, xDot.get(0), yDot.get(0))<=padding) {

        break;
      } else {
        int loc = x + y*cam.width; 
        // What is current color
        color currentColor = cam.pixels[loc];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);

        // Using euclidean distance to compare colors
        float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

        // If current color is more similar to tracked color than
        // closest color, save current location and current difference
        if (d < record) {
          record = d;
          closestX = x;
          closestY = y;
        }
      }
    }
  }
  xDot.append(closestX);
  yDot.append(closestY);
  //    println(xDot);
  //  println(yDot);
  //===============================================================     
  closestX = 0;
  closestY = 0;
  record =500;
  for (int x = 10; x < cam.width-10; x ++ ) {
    for (int y = 10; y < cam.height-10; y ++ ) {
      if ((dist(x, y, xDot.get(1), yDot.get(1))<=padding)||(dist(x, y, xDot.get(0), yDot.get(0))<=padding)) {

        break;
      } else {
        int loc = x + y*cam.width; 
        // What is current color
        color currentColor = cam.pixels[loc];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);

        // Using euclidean distance to compare colors
        float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

        // If current color is more similar to tracked color than
        // closest color, save current location and current difference
        if (d < record) {
          record = d;
          closestX = x;
          closestY = y;
        }
      }
    }
  }
  xDot.append(closestX);
  yDot.append(closestY);
  //===============================================================  
  //  println(xDot);
  //  println(yDot);
  //=============================================================== 
  //if you want to draw dots
  for (int i = 0; i < xDot.size (); i++) {
    fill(255, 0, 0);
    strokeWeight(4.0);
    stroke(0);
    ellipse(xDot.get(i), yDot.get(i), 16, 16);
  }
  //=============================================================== 
  //find the shortest side
  distances.append(dist(xDot.get(0), yDot.get(0), xDot.get(1), yDot.get(1)));
  distances.append(dist(xDot.get(1), yDot.get(1), xDot.get(2), yDot.get(2)));
  distances.append(dist(xDot.get(2), yDot.get(2), xDot.get(0), yDot.get(0)));

  float minVal = distances.get(0);
  int index = 0;
  for (int i = 1; i < distances.size (); i++) {
    if (distances.get(i) < minVal) {
      minVal = distances.get(i);
      index = i;
    }
  }
  print("minVal " + minVal);
  println("minVal index " + index);


  // figure out the coordinates of shortest side
  // Basically startIndex = index and endIndex = index+1\
  float midX;
  float midY;
  // bisect the shortest side

  midX=xDot.get(index)+((xDot.get((index+1)%3)-xDot.get(index))/2.0);
  midY=yDot.get(index)+((yDot.get((index+1)%3)-yDot.get(index))/2.0);

  //create line with third point
  strokeWeight(4); 
  stroke(100);
  line (midX, midY, xDot.get((index+2)%3), yDot.get((index+2)%3));
  angle(midX, midY, xDot.get((index+2)%3), yDot.get((index+2)%3));


  xDot.clear();
  yDot.clear();
}


