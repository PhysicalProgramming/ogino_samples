
float VELOCITY_MAX = 200.0;
float CLICK_THRESHOLD = 20.0;
int CLICK_THRESHOLD_COUNT = 3;

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
  
}


void draw () {
  
  // 移動位置から移動量（速度）を計算
  velocityX = mouseX - pmouseX;
  velocityY = mouseY - pmouseY;
  velocityAve = ( abs(velocityX) + abs(velocityY) ) / 2.0;

  // 大きすぎるときは制限
  if ( velocityAve > VELOCITY_MAX ) {
    velocityAve = VELOCITY_MAX;
  }
  
 
  // 一定の速さを超えたらクリックにする
  if ( abs(velocityAve) > CLICK_THRESHOLD ) {
    
    // 一定の速さを超えてる時間
    count++;
    if ( count > CLICK_THRESHOLD_COUNT ) { // 指定回フレームのあいだ早くい動いていた
      
      isClick = true;
      
    }
    else if ( count > CLICK_THRESHOLD_COUNT + 1 ) { // ONになった次のフレームではOFFにする
      
      isClick = false;
      
    }
    
  }
  else {
    
    count = 0;
    isClick = false;
    
  }



  //if (mousePressed) {
  if (isClick) {
  
    // クリックしたら画面をクリアする    
    background( 0 );
  
  }

  
  fill( 200, 100, 50 );
  //fill( random(255), random(255), random(255), 255 );
  noStroke();
  circle( mouseX, mouseY, 50 * abs(sin(millis())) );
  
}


/* End */
