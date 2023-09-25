
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
  
  circle( mouseX, mouseY, 50 * abs(sin(millis())) );
  
}
