
int BIRTH_NUM = 256;//1024;
int NUM_W = 16;//32;
int NUM_H = 16;//32;
Life[] lifes;


void setup() {
  
  size(512,512);
  //fullScreen();
  smooth();

  // 文字
  InitFont();
  
  
  lifes = new Life[BIRTH_NUM];
  int mx = width  / NUM_W;
  int my = height / NUM_H;
  for (int num = 0; num < lifes.length; num++) {
    
    lifes[num] = new Life();
    
    int xx = num % NUM_W;
    int yy = num / NUM_H;
    println( String.format("x: %d  y: %d", xx, yy ) );
    
    lifes[num].birth( "p"+num, new PVector( xx*mx + mx/2, yy*my + my/2 ));
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
