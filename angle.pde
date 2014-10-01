
  

PVector to, from;

    final float   pointSize = 15;
    final float   margin    = 20;
    final color   fromColor = #931333;
    final color   toColor   = #34AAE8;
    final color   lineColor = #54A243;

 
    // ------------------------------------------------------------------------------------------- //
    void angle(float middleX, float middleY, float thirdX, float thirdY)
    {
 
      to        = new PVector(thirdX,thirdY);
     from      = new PVector(middleX,middleY);
   //  to.set(mouseX, mouseY, 0);
   //to is third point
   //from is midpoint
   
//   to = (thirdX,thirdY);
//   from = (middleX,middleY);
      float angle = seg_angle( to, from );
      drawAngle( angle, height*0.4 );
  
      drawFrom();
   drawTo();  
    }

    // ------------------------------------------------------------------------------------------- //
    void drawFrom() { noStroke();  fill( fromColor );  ellipse( from.x, from.y, 15, 15 ); }
    void drawTo()   { noStroke();  fill( toColor   );  ellipse( to.x,     to.y, 15, 15 ); }

    // ------------------------------------------------------------------------------------------- //
    void drawAngle( float angle, float seg_length )
    {
      noFill();
      stroke( lineColor );
      strokeWeight(1.5);
      
      // Draw the line segments
      line( seg_x( angle, margin     ), seg_y( angle, margin     )
          , seg_x( angle, seg_length ), seg_y( angle, seg_length ) );
          
      line( seg_x( -PI, margin     ), seg_y( -PI, margin     )
          , seg_x( -PI, seg_length ), seg_y( -PI, seg_length ) );

      // Draw the arc
      strokeWeight(3);
      arc( from.x, from.y, 3*margin, 3*margin, -PI -.2, angle + .2 );
      
      // Draw the text for the angle  
      float text_angle = ( -PI + angle ) * 0.5f;
      
    //  noStroke();
    //  fill(0);
     // text( degrees(PI + angle), seg_x( text_angle, 2*margin ), seg_y( text_angle, 2*margin ) );
          println(degrees(PI + angle));
    }

    // ------------------------------------------------------------------------------------------- //
    float seg_x    ( float   angle, float   distance ) { return from.x + cos( angle ) * distance; }
    float seg_y    ( float   angle, float   distance ) { return from.y + sin( angle ) * distance; }
    float seg_angle( PVector to,    PVector from     ) { return seg_angle( to.x, to.y, from.x, from.y ); }
    float seg_angle( float   xTo,   float   yTo
                   , float   xFrom, float   yFrom )
    {
      float dx = xTo - xFrom;
      float dy = yTo - yFrom;

      return atan2(dy,dx);
    }

