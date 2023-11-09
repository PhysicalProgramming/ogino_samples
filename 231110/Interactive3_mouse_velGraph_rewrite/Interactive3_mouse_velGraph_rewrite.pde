
float velocityX = 0;
float velocityY = 0;
float velocityMag = 0; // Magnitude

int count = 0;
boolean isClick = false;


void setup () {
  
  size( 512, 512 );
  //fullScreen();
  
  background( 0 );
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);
  
  //frameRate(1);
  
}


void draw () {
  
  // 移動位置から移動量（速度）を計算
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityMag = ( abs(velocityX) + abs(velocityY) ) / 2.0;


  //isClick = mousePressed;
  isClick = ClickByVelocity();


  // クリックしたら画面をクリアする    
  if (isClick) {
  
    background( 0 );
  
  }
  
  // ランダムな色で縁のない円を描く
  fill( random(255), random(255), random(255), 255 );
  noStroke();
  circle( mouseX, mouseY, 50 * abs(sin(millis())) );
  

  
  
  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();
  // グラフ
  Draw_DebugMouseMove();
  
}

boolean ClickByVelocity () {
  
  boolean clickCheck = false;

  // 大きすぎるときは制限
  if ( velocityMag > VELOCITY_MAX ) {
    velocityMag = VELOCITY_MAX;
  }
  
 
  // 一定の速さを超えたらクリックにする
  if ( velocityMag > CLICK_THRESHOLD ) {
    
    // 一定の速さを超えてる時間
    count++;
    if ( count > CLICK_THRESHOLD_COUNT ) { // 指定回フレームのあいだ早くい動いていた
      
      clickCheck = true;
      
    }
    else if ( count > CLICK_THRESHOLD_COUNT + 1 ) { // ONになった次のフレームではOFFにする
      
      clickCheck = false;
      
    }
    
  }
  else {
    
    count = 0;
    clickCheck = false;
    
  }
  
  return clickCheck;

}


/* End */
