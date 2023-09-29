
// 調整用パラメータ
int ALPHA = 100;
color[] BASE_COLORS = {color(255,0,0,ALPHA), color(0,255,0,ALPHA), color(0,0,255,ALPHA)};
float WAVE_SIZE = 15.0;
float CIRCLE_SIZE = 10.0;
int BLUR_IMAGE_RATE = 4;

//// 変数
// Draw circle
float circleSize = 0;
float blurSize = 0;

// 塗りつぶし用カウンター
int fillRectCount = 0;


void setup () {
  
  // デバイスとの通信をセット
  Setup_Serial();


  size( 960, 540 );
  fullScreen(2); // セカンドディスプレイへ

  background( 0 );

  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);


  blendMode( BLEND );
  noStroke();
  
  
  //blurSize = CIRCLE_SIZE / BLUR_IMAGE_RATE;

}


void draw () {

  for ( int i = 0; i < 3; i++ ) {
    
    color drawColor = BASE_COLORS[i];
    
    // センサーの数値で色の強さを変える
    drawColor *= abs(sensorData[i]);

    // 描画色
    fill( drawColor );
    
    // 360°どの方向にずらすかランダムで決定
    float rad = random(0, TAU);
    float x = cos(rad) * sensorData[i]*WAVE_SIZE + width /2;
    float y = sin(rad) * sensorData[i]*WAVE_SIZE + height/2;
    
    
    int X_NUM = 10;
    int Y_NUM = 6;
    int marginX = width  / X_NUM;
    int marginY = height / Y_NUM;
    int xPos = 0;
    int yPos = 0;
    for ( int xLine = 0; xLine < X_NUM-1; xLine++ ) {
      
      xPos = xLine * marginX - width/2 + marginX;
      
      for ( int yLine = 0; yLine < Y_NUM-1; yLine++ ) {
        
        yPos = yLine * marginX - height/2 + marginY;
      
        // ブラーなし
        drawCircle( (int)x + xPos, (int)y + yPos, (int)CIRCLE_SIZE );
    
        // ブラー付きの円
        //blurCircle( (int)x, (int)y, (int)CIRCLE_SIZE, drawColor, blurSize );
    
      }
    }
  
}


  // ゆっくりちょっとずつ黒を重ねる
  if ( fillRectCount > 1 ) {

    // 色を重ねる方法を変える（おまじない）
    blendMode(MULTIPLY);

    fill( 0, 20 );
    rect( 0, 0, width, height );

    fillRectCount = 0;

  }
  fillRectCount++;

  // 色を重ねる方法をもとに戻す（BLENDがデフォルト）
  blendMode(BLEND);


  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();

}




void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  
  fill( 200, 255 );
  text( String.format("sensor x:%6.2f y:%6.2f z:%6.2f", sensorData[0], sensorData[1], sensorData[2]), 20, 20 );
  text( String.format("circle size:%4.0f wave size:%4.0f", CIRCLE_SIZE, WAVE_SIZE ), 20, 40 );

}


void drawCircle( int x, int y, int r ) {
  
    blendMode(SCREEN);
      circle( x, y, r );
    blendMode(BLEND);

}

PGraphics pg;
void blurCircle( int x, int y, int r, color c, float b ) {
  
  pg = createGraphics(r*BLUR_IMAGE_RATE, r*BLUR_IMAGE_RATE);
  pg.beginDraw();
    pg.background(0,0);
    pg.fill(c);
    pg.circle( r, r, r );
    pg.filter(BLUR, b);
  pg.endDraw();
  
  int pgX = x-r;
  int pgY = y-r;
  
  blendMode(SCREEN);
    image( pg, pgX, pgY );
  blendMode(BLEND);
  
}


/* End */
