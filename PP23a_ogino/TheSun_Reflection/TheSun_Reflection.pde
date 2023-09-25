void setup() {

  size(512, 512);
  background(0);

  //frameRate(30);
}

int count = 0;
int countMax = 3;
void draw() {
  
  if ( count > countMax ) {
    background(250);
    count = 0;
    countMax = 3;//int(random(1.0,3.0));
  }
  count++;
  
  noStroke();
  fill(255, random(100.0,155.0));
  
  for ( int i = 0; i < 300; i++ ){
    
    float size = random(10.0,100.0);
    ellipse(random(width), random(height), size, size);
  
  }
  
}
