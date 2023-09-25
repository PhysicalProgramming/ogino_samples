
float VELOCITY_MAX = 100.0;
float CLICK_THRESHOLD = 8.0;
int CLICK_THRESHOLD_COUNT = 2;

float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

int count = 0;
boolean isClick = false;

int fillRectCount = 0;


void setup () {
  
  size( 512, 512 );
  //fullScreen();
  
  background( 0 );
  //frameRate( 1 );
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);
  
  blendMode( BLEND );
  
}


void draw () {
  
  //マウスの動きからクリックを取得
  Check_MouseMoveToClick();
  
  
  // 円の色
  color drawColor = color( 200, 100, 50, 255 );
  
  // クリックしてたら色を変える
  if (isClick) {
    
    drawColor = color( 200, 200, 50, 200 );
  
  }
  
  
  // 描画
  fill( drawColor );
  stroke( drawColor );

  strokeWeight( 4 );
  line( mouseX, mouseY, pmouseX, pmouseY );
  
  noStroke();
  circle( mouseX, mouseY, 5 * ( 1 + abs(velocityAve) ) );
  
  
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
  blendMode(MULTIPLY);
  
  
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
  fill( 200, 255 );
  text( String.format("pos x:%4d y:%4d preX:%4d preY:%4d", mouseX, mouseY, pmouseX, pmouseY), 20, 20 );
  text( String.format("vel x:%4.0f y:%4.0f ave:%5.1f", velocityX, velocityY, velocityAve), 20, 40 );
  
}


/* End */
