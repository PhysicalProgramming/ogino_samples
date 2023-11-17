
void setup () {
  
  //size( 512, 512 );
  fullScreen();
  
  background( 0 );

}


void draw () {
  
  background( (cos( millis() * 0.001 ) + 1.) / 2 * 255 );
  
}
