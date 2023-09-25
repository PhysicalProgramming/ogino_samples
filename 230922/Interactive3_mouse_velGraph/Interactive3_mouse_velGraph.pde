
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
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);
  
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



 
  // クリックしたら画面をクリアする    
  //if (mousePressed) {
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



void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  fill( 200, 255 );
  text( String.format("pos x:%4d y:%4d preX:%4d preY:%4d", mouseX, mouseY, pmouseX, pmouseY), 20, 20 );
  text( String.format("vel x:%4.0f y:%4.0f ave:%5.1f", velocityX, velocityY, velocityAve), 20, 40 );
  
}


ArrayList velAveList = new ArrayList();
ArrayList isClickList = new ArrayList();
void Draw_DebugMouseMove () {

  //// グラフにするため保存していく
  // マウスを動かしている速度
  velAveList.add(velocityAve);
  // マウスを動かしてクリックになっているか
  isClickList.add(isClick);

  // 延々溜まってしまうので一定量貯まったら古い順に削除
  // ウインドウ幅の半分の数だけ貯める
  if ( velAveList.size() > width/2 ) {

    // マウスを動かしている速度
    velAveList.remove(0);
    isClickList.remove(0);

  }

  
  // グラフの背景
  fill( 32, 255 );
  rect( 0, height - 50, width, 50 );
  
  // グラフを描画
  int marginBottom = 10;
  for ( int i = 1; i < velAveList.size(); i++ ) {
    
    float preVel = constrain( (float)velAveList.get(i-1), 0, 100.0 );
    float vel    = constrain( (float)velAveList.get(i),   0, 100.0 );
    
    float graphY1 = map ( preVel, 0, 100.0, 0, 30.0 );
    float graphY2 = map ( vel,    0, 100.0, 0, 30.0 );

    if ( (boolean)isClickList.get(i-1) || (boolean)isClickList.get(i) ) {
      stroke( 230, 230, 30 );
      strokeWeight( 2 );
    }
    else {
      stroke( 230, 120, 30 );
      strokeWeight( 1 );
    }
    line( i-1, height - graphY1 - marginBottom,
          i,   height - graphY2 - marginBottom );
    
  }

}


/* End */
