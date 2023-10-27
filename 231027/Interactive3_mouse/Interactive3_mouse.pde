
void setup () {
  
  size( 512, 512 );
  //fullScreen();
  
  background( 23 ,9 ,15 );
  
  //frameRate( 1 );
  
}


void draw () {
 
  if (mousePressed) {
    
    fill( 200, 200, 50 );
  
  }
  else {
    
    fill( 200, 100, 50 );
  
  }
  
  PVector mouse_pos = new PVector( mouseX, mouseY );
  PVector mouse_pos_pre = new PVector( pmouseX, pmouseY );
  PVector mouse_vel = mouse_pos.sub( mouse_pos_pre );
  //mouse_vel.normalize();
  
  float size = mouse_vel.mag();
  circle( mouseX, mouseY, size * abs(sin(millis())) );
  
}
