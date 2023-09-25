
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

int secondCircleSize = 600;
int centerLeft = 0;
int centerTop = 0;



// 最初に一回
void setup() {
  
  println("Processing animation setup");
  
  // 表示ウインドウの大きさ
  size(512, 512);

  // ウインドウサイズが決まってから中心を計算する
  centerLeft = width/2;
  centerTop = height/2;
  
  // 背景色で塗りつぶし
  background(TODAY_COLOR);

  strokeCap( ROUND ); // SQUARE, PROJECT
  
  // 1秒間にdrawを繰り返す速さ（指定しなければ1秒で60回）
  frameRate(10);
  
}

// その後繰り返し
void draw() {
  
  // 今日の色を足し続ける
  currentColor += TODAY_COLOR;
  println("currentColor: ", currentColor);
  
  if ( second() == 0 ) {

    // 60秒に一回描画をクリアする
    //background(TODAY_COLOR);
    //count = 0;

  }


  // 横線を加え続ける
  stroke( currentColor );
  strokeWeight( 1 );

  int positionTop = pointA_Top + count;
  float frequency = (float)count * 0.02;
  line( pointA_Left, positionTop+5,  pointA_Left+lineSize + waveSize*sin(frequency)-100, positionTop-5 );

  count += 2;


  stroke( color(255) - currentColor );

  // 時計の秒数に合わせて縦線を加える
  int positionLeft = pointA_Left + second()*3;
  line( positionLeft, pointA_Top, positionLeft, pointA_Top+lineSize );


  strokeWeight( 4 );

  // 時計の秒数に合わせて縦線を加える
  float radius = millis();
  line(
  centerLeft, centerTop,
  centerLeft + secondCircleSize*cos(radius), centerTop + secondCircleSize*sin(radius)
  );

}


// End
