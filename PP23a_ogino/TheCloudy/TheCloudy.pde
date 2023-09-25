void setup() {

  size(512, 512);
  background(0);

  //frameRate(60);
}

int count = 0;
int countMax = 0;
void draw() {
  
  //if ( count > 20 ) {
  //  background(0);
  //  count = 0;
  //}
  //count++;

  noStroke();
  fill(255, random(100.0,155.0 ));
  
  int num = int(random(3.0));
  for ( int i = 0; i < num; i++ ){
    
    float size = random(1.0,100.0);
    ellipse(random(width), random(height), size, size);
  
  }
  
  
  if ( count > countMax ) {
    
    fill(0,1.0);
    rect(0,0, width,height);
    
    count = 0;
    countMax = int(random(10.0,50.0));
  }
  count++;
   
}
