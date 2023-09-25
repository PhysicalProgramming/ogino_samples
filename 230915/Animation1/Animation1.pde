
  
// setup(){}などの外に変数を書くとどこでも使える
color BASE_COLOR = color( 23, 9, 15 );
color currentColor = BASE_COLOR;


// 最初に一回
void setup() {
  
  println("Processing animation setup");
  
  // 表示ウインドウの大きさ
  size(512, 512);
  
  // 背景色で塗りつぶし
  background(BASE_COLOR);
  
  // 1秒間にdrawを繰り返す速さ（指定しなければ1秒で60回）
  frameRate(1);
  
}

// その後繰り返し
void draw() {
  
  currentColor += BASE_COLOR;
  println("currentColor: ", currentColor);
  
  background(currentColor);
  
}


// End
