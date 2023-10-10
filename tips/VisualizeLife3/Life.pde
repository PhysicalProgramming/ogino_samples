class Life {
  
  String name = "";
  color col = color( 255, 255 );
  
  int WAIT = 0;
  
  boolean isAlive = false;
  int nextActivityCount = 0;
  float size = 10;
  
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
    
    if ( changeDirCount < 0 ) {
      
      dir.x = random(-1.0,1.0);
      dir.y = random(-1.0,1.0);
      
      changeDirCount = (int)random( 1, 50 );
    
    }
    changeDirCount--;
    
    //pos.add( dir );
    
    if ( pos.x < 0 || pos.x > width ) {
      dir.x *= -1;
    }
    if ( pos.y < 0 || pos.y > height ) {
      dir.y *= -1;
    }
    
  }
  
  boolean checkActivity () {
    
    nextActivityCount--;
    if ( nextActivityCount > 0 ) {
      
      return false;
      
    }
    else {
      
      nextActivityCount = WAIT;
      return true;
    
    }
    
  }
  
  void draw () {
    
    if ( !isAlive ) return;
    
    noStroke();
    
    pushMatrix();
    translate( pos.x, pos.y );
    rotate( dir.heading() );
      //fill(col);
      //circle( 0, 0,  size );
    
      stroke( 255, 255 );
      strokeWeight(3);
      line( 0, 0,  size, 0 );
    popMatrix();
    
  }

}
