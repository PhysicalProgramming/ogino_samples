
/**
 * Variables
 */

// Today
int YEAR = 23;
int MONTH = 9;
int DAY = 15;
  
// setup(){}などの外に変数を書くとどこでも使える
color TODAY_COLOR = color( YEAR, MONTH, DAY );
color currentColor = TODAY_COLOR;


int pointA_Left = 6;
int pointA_Top  = 6;
int lineSize = 500;
int margin = 0;

int count = 0;
float waveSize = 50;

int secondCircleSize = 200;
int centerLeft = 0;
int centerTop = 0;

int clickCount = 0;

boolean paused = false;



// 最初に一回
void setup() {
  
  println("Processing animation setup");
  
  // 表示ウインドウの大きさ
  size(512, 512);

  // ウインドウサイズが決まってから中心を計算する
  centerLeft = width/2;
  centerTop = height/2;
  
  // 背景色で塗りつぶし
  background( TODAY_COLOR );

  strokeCap( ROUND ); // SQUARE, PROJECT
  
  // 1秒間にdrawを繰り返す速さ（指定しなければ1秒で60回）
  //frameRate(10);
  
}

// その後繰り返し
void draw() {
  
  // 今日の色を足し続ける
  currentColor += TODAY_COLOR;


  // 線の透明度と幅をカーソル位置と連動させる（中心から離れるほど大きい数値）
  float lineAlpha = (mouseX - width/2) / (float)width * 100.0;
  float lineWidth = (mouseY - height/2) / (float)height * 100.0;

  // 線のスタイルを指定
  stroke( currentColor, 10 + abs(lineAlpha) );
  strokeWeight( 1 );



  // 横線を加え続ける
  line(
      pointA_Left,            pointA_Top + lineSize - clickCount,
      pointA_Left + lineSize, pointA_Top + lineSize - clickCount
  );
  strokeWeight( abs(lineWidth) );


  // 時計の秒数に合わせて縦線を加える
  float radius = TAU * millis() / 1000.0 / 60.0;
  line(
      centerLeft + secondCircleSize*0.2 * cos(radius), centerTop + secondCircleSize*0.2 * sin(radius),
      centerLeft + secondCircleSize*0.9 * cos(radius), centerTop + secondCircleSize*0.9 * sin(radius)
  );

  noFill();
  circle( centerLeft + secondCircleSize*cos(radius), centerTop + secondCircleSize*sin(radius), 12 );

}

void mousePressed() {

  clickCount++;

}


void keyPressed() {
  
  // キーを押したときにマウスカーソル位置を出力
  println( mouseX, mouseY );

  if (key == CODED) {

    // ESCキーで終了させる
    if (keyCode == ESC) {
      exit();
    }

  }
  
  // スペースキーでポーズ
  if (keyCode == ' ') {
    
    paused = !paused;

    if (paused) {
      noLoop();
    } else {
      loop();
    }
  }
  
}


// End
