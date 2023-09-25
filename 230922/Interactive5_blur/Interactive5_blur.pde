
float VELOCITY_MAX = 100.0;
float CLICK_THRESHOLD = 8.0;
int CLICK_THRESHOLD_COUNT = 2;
float CIRCLE_SIZE_MAX = 100.0;
int BLUR_IMAGE_RATE = 2;

float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

int count = 0;
boolean isClick = false;

float circleSize = 0;
float blurSize = 0;
int fillRectCount = 0;


void setup () {
  
  size( 512, 512 );
  //fullScreen();
  
  background( 0 );
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);
  
  blendMode( BLEND );
  
}


void draw () {
  
  // 初期値が入るまでスキップ
  if ( mouseX == pmouseX ) return;
  else if ( pmouseX == 0 ) return;
  
  
  //マウスの動きからクリックを取得
  Check_MouseMoveToClick();
  
  
  // 円の色
  color drawColor = color( 200, 100, 50, 255 );
  
  // クリックしてたら色を変える
  if (isClick) {
    
    //drawColor = color( 200, 200, 50, 200 );
    drawColor = color( random(255), random(255), random(255), 200 );
  
  }
  
  
  // 描画
  fill( drawColor );
  
  //stroke( drawColor );
  //strokeWeight( 1 );
  //line( mouseX, mouseY, pmouseX, pmouseY );
  
  noStroke();
  circleSize =  abs( 3 * ( 1 + velocityAve ) );
  if ( circleSize < 2 ) {
    
    circleSize = 2.0;
  
  }
  if ( circleSize > CIRCLE_SIZE_MAX ) {
    
    circleSize = CIRCLE_SIZE_MAX;
  
  }
  float blurMax = circleSize / (float)BLUR_IMAGE_RATE;
  blurSize = random(0,blurMax);
  
  // ブラー付きの円
  //circle( mouseX, mouseY, circleSize );
  blurCircle( mouseX, mouseY, (int)circleSize, drawColor, blurSize );
  
  
  // ゆっくりちょっとずつ黒を重ねる
  if ( fillRectCount > 10 ) {
    
    // 色を重ねる方法を変える（おまじない）
    blendMode(MULTIPLY);
  
    fill( 0, 1 );
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


void Check_MouseMoveToClick () {
  
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityAve = ( velocityX + velocityY ) / 2.0;
  if ( velocityAve > VELOCITY_MAX ) {
    velocityAve = VELOCITY_MAX;
  }
  
 
  if ( abs(velocityAve) > CLICK_THRESHOLD ) {
    
    count++;
    if ( count > CLICK_THRESHOLD_COUNT ) {
      
      isClick = true;
      
    }
    else if ( count > CLICK_THRESHOLD_COUNT + 1 ) {
      
      count = 0;
      isClick = false;
      
    }
    
  }
  else {
    
    count = 0;
    isClick = false;
    
  }
  
}




void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  rect( 18, 58-12, 300, 18 );
  fill( 200, 255 );
  text( String.format("pos x:%4d y:%4d preX:%4d preY:%4d", mouseX, mouseY, pmouseX, pmouseY), 20, 20 );
  text( String.format("vel x:%4.0f y:%4.0f ave:%5.1f", velocityX, velocityY, velocityAve), 20, 40 );
  text( String.format("circle size:%5.1f blur:%5.2f", circleSize, blurSize ), 20, 60 );
  
}




PGraphics pg;
void blurCircle( int x, int y, int r, color c, float b ) {
  
  pg = createGraphics(r*BLUR_IMAGE_RATE, r*BLUR_IMAGE_RATE);
  pg.beginDraw();
    //pg.background(255);
    pg.background(0,0);
    pg.fill(c);
    pg.circle( r, r, r );
    try {
      pg.filter(BLUR, b);
    }
    catch ( Exception e ) {
      println( r, b );
      e.printStackTrace();
    }
  pg.endDraw();
  
  int pgX = x-r;
  //if (pgX < 0) pgX = 0;
  int pgY = y-r;
  //if (pgY < 0) pgY = 0;
  
  blendMode(SCREEN);
  image( pg, pgX, pgY );
  blendMode(BLEND);
  
}


/* End */
