class Life {
  
  String name = "";
  color col = color( 200, 255 );
  
  int UPDATE_INTERVAL = 0;
  
  boolean isAlive = false;
  int nextActivityCount = 0;
  float size = 10;
  float angle = -90.0, targetAngle = -90.0;

  int WAIT_MAX = 50;
  float WAIT_ANGLE = 45.0;
  
  PVector pos, dir; // dir: dirction
  int changeDirCount = 0;
  
  
  void birth ( String _name, PVector _pos ) {
    
    name = _name;
    
    isAlive = true;
    nextActivityCount = WAIT;
    
    pos = _pos;
    dir = new PVector( 0, 0 );
    
  }
  
  void update () {
    
    if ( !checkActivity() ) return;
      
    angle = lerp( angle, targetAngle, 0.2 );
    if ( abs( angle - targetAngle ) < 0.01 ) {
      
      if ( checkDirectionalCount() ) {
      
        targetAngle = random( -WAIT_ANGLE, WAIT_ANGLE ) - 90.0;
        
      }
      
    }
    
    dir = PVector.fromAngle( radians(angle) );
    
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
