
void setup() {
  
  size(512,512);
  
}

void draw() {
  
  background(32);
  
  pushMatrix();
    translate( width/2, height/2 );
    scale( -1.0, 1.0 );
    triangle(-50, -50,  50, 0,  -50, 50);
    circle( -50, 0, 100 );
  popMatrix();
  
}


/* End */
