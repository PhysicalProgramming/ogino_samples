// https://dekfractal.com/493.html

float[] romCounts;
PrintWriter file;


void setup() {
  
  size(512,512);
  smooth();

  // 文字
  InitFont();
  
  
  romCounts = new float[32];

  file = createWriter("output.csv");
  
}

void draw() {
  
  int index = int(random(romCounts.length));
  romCounts[index]++;
  
  stroke(0);
  strokeWeight(1);
  fill(255,3,19);
  
  int w = width / romCounts.length;
  for (int x = 0; x < romCounts.length; x++) {
    rect(x*w, height-romCounts[x], w, romCounts[x]);
  }
  

  //// Debug（動作確認用）
  Draw_DebugMessage();

}


void keyPressed() {

  if (key == 'p') {
    save("graph.png");
  }
  
  if (key == 'q') {
      for (int x = 0; x < romCounts.length; x++) {
        file.println(romCounts[x]);
      }
      file.flush();
      file.close();
    exit();
  }
  
  
  if (key == 't') {
    noLoop();
  }

  if (key == 's') {
    loop();
  }

}


/* End */
