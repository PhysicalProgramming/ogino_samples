// https://dekfractal.com/493.html

void setup() {
  
  size(512,512);
  smooth();

  // 文字
  InitFont();

}

void draw() {
  
  background(255);
  
  noFill();
  strokeWeight(1.0);

  beginShape();
  for (int x = 0; x < width; x++) {
    float y = random(height);
    vertex(x,y);
  }
  endShape();
  

  //// Debug（動作確認用）
  Draw_DebugMessage();


  noLoop();
  
}


void keyPressed() {
  if (key == 'p') {
    save("graph.png");
  }
}


/* End */
