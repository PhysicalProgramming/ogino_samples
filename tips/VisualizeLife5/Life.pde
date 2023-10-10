class Life {
  
  String name = "";
  color col = color( 200, 155 );
  
  int UPDATE_INTERVAL = 0;
  
  boolean isAlive = false;
  int nextActivityCount = 0;
  float size = 10;//100;
  float angle = -90.0, targetAngle = -90.0;
  float speed = random(0.001, 0.5);

  int WAIT_MAX = 10;
  float WAIT_ANGLE = 45.0;
  int WALL_PADDING = 10;//50;
  
  PVector pos, dir; // dir: dirction
  int changeDirCount = 0;
  
  
  void birth ( String _name, PVector _pos ) {
    
    name = _name;
    
    isAlive = true;
    nextActivityCount = WAIT;
    
    angle = targetAngle = random( -180.0, 180.0 );
    speed = random(0.001, 1.0);
    
    pos = _pos;
    dir = PVector.fromAngle( radians(angle) );
    
  }
  
  void update () {
    
    if ( !checkActivity() ) return;
      
    angle = lerp( angle, targetAngle, 0.2 );
    if ( abs( angle - targetAngle ) < 0.01 ) {
      
      if ( checkDirectionalCount() ) {
      
        targetAngle = angle + random( -WAIT_ANGLE, WAIT_ANGLE );
        speed = random(0.001, 1.0);
        
      }
      
    }
    
    
    dir = PVector.fromAngle( radians(angle) ).mult( speed );
    //pos.add( dir );
    pos.lerp( pos.add(dir), 0.05 );
    
    //checkWallCollision1();
    checkWallCollision2();
    
  }
  
  
  boolean checkActivity () {
    
    nextActivityCount--;
    if ( nextActivityCount < 0 ) {
      
      nextActivityCount = UPDATE_INTERVAL;
      return true;
      
    }
    else {
      
      return false;
    
    }
    
  }
  
  boolean checkDirectionalCount () {
    
    changeDirCount--;
    if ( changeDirCount < 0 ) {
      
      changeDirCount = (int)random( 1, WAIT_MAX );
      return true;
    
    }
    else {
      
      return false;
      
    }
    
  }
  
  void checkWallCollision1 () {
    
    if ( pos.x < 0 || pos.x > width ) {
      dir.x *= -1;
      targetAngle = degrees( dir.heading() );
    }
    if ( pos.y < 0 || pos.y > height ) {
      dir.y *= -1;
      targetAngle = degrees( dir.heading() );
    }
    
  }
  
  void checkWallCollision2 () {
    
    if ( pos.x < -WALL_PADDING ) {
      pos.x = width+WALL_PADDING;
    }
    if ( pos.x > width+WALL_PADDING ) {
      pos.x = -WALL_PADDING;
    }
    if ( pos.y < -WALL_PADDING ) {
      pos.y = height+WALL_PADDING;
    }      
    if ( pos.y > height+WALL_PADDING ) {
      pos.y = -WALL_PADDING;
    }
    
  }
  
  
  void draw () {
    
    if ( !isAlive ) return;
    
    noStroke();
    
    pushMatrix();
    translate( pos.x, pos.y );
    rotate( dir.heading() );
      fill(col);
      circle( 0, 0,  size );
    
      stroke( 255, 255 );
      strokeWeight(3);
      line( 0, 0,  size/2, 0 );
    popMatrix();
    
  }

}
