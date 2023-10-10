class Life {
  
  String name = "";
  color col;
  
  int WAIT = 10;
  
  boolean isAlive = false;
  int nextActivityCount = 0;
  float size = 0;
  int posX = 0, posY = 0;
  
  
  void birth ( String _name ) {
    
    name = _name;

    size = 10;    
    col = color( 255, 255 );
    
    isAlive = true;
    nextActivityCount = WAIT;
    
    posX = width / 2;
    posY = height / 2;
    
  }
  
  void update () {
    
    if ( !checkActivity() ) return;
    
    posX += random(-1.0,2.0);
    posY += random(-1.0,2.0);
    
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
    fill(col);
    
    circle( posX, posY, size );
    
  }

}
