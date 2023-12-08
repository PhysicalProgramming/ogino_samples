// https://snd.dev/

import processing.sound.*;

float velocityX = 0;
float velocityY = 0;
float velocityMag = 0; // Magnitude

int count = 0;
boolean isClick = false;

SoundFile soundFile;


void setup () {
  
  size( 512, 512 );
  //fullScreen();
  
  background( 0 );
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

  // サウンドファイル
  soundFile = new SoundFile( this, "disabled.wav" );
  
  
  //soundFile.play( 1, 2 );
  //noLoop();
  //frameRate(1);
  
}


void draw () {
  
  // 移動位置から移動量（速度）を計算
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityMag = ( abs(velocityX) + abs(velocityY) ) / 2.0;


  background( 0 );
  Draw_Mouse();

    
  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();
  // グラフ
  Draw_DebugMouseMove();
  
}

void Draw_Mouse () {

  float radius = 10;
  if ( mousePressed ) {

    radius = 20;

  }

  fill( 255, 255, 255,  255 );
  circle( mouseX, mouseY,  radius );

}

void mousePressed () {

  soundFile.play( 2, 0.5 );

}

void mouseReleased () {

  soundFile.play( 1, 0.5 );

}


/* End */
