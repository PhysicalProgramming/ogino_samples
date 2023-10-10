class Life {
  
  String name = "";
  color col;
  
  int WAIT = 0;
  
  boolean isAlive = false;
  int nextActivityCount = 0;
  float size = 0;
  
  PVector pos, dir; // dir: dirction
  int changeDirCount = 0;
  
  
  void birth ( String _name ) {
    
    name = _name;

    size = 10;    
    col = color( 255, 255 );
    
    isAlive = true;
    nextActivityCount = WAIT;
    
    pos = new PVector( width / 2, height / 2 );
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
    
    
    pos.add( dir );
    
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
      fill(col);
      circle( 0, 0,  size );
    
      stroke( 0, 255 );
      line( 0, 0,  size, 0 );
    popMatrix();
    
  }

}
