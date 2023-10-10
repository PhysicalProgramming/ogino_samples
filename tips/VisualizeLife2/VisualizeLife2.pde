// https://dekfractal.com/493.html

int BIRTH_NUM = 300;
Life[] lifes;


void setup() {
  
  size(512,512);
  smooth();

  // 文字
  InitFont();
  
  
  lifes = new Life[BIRTH_NUM];
  for (int num = 0; num < lifes.length; num++) {
    lifes[num] = new Life();
    lifes[num].birth("");
  }
  
}

void draw() {
  
  background(64);
  
  for (int num = 0; num < lifes.length; num++) {
    lifes[num].update();
    lifes[num].draw();
  }
  

  //// Debug（動作確認用）
  Draw_DebugMessage();

}


void keyPressed() {
  
  if (key == 't') {
    noLoop();
  }

  if (key == 's') {
    loop();
  }

}


/* End */
