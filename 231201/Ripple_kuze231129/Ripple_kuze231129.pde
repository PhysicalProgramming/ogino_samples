//同時に表示する波紋の数
int maxRipple = 100;    

//波紋オブジェクト用変数
Ripple[] rp = new Ripple[maxRipple];
//波紋オブジェクトを次に進めるために数える変数
int r_count = 0;


void setup() {
  size(1280, 800);
  //fullScreen();
  
  //　---------- シリアル通信の部分 ここから ---------- //
  printArray(Serial.list());
  String portName = Serial.list()[7];
  myPort = new Serial(this, portName, 9600);
  //　---------- シリアル通信の部分 ここまで ---------- //

  //maxRipple個数の波紋オブジェクトを生成する
  for (int i = 0; i < maxRipple; i++) {
    rp[i] = new Ripple();
  }
}

void draw() {
  background(0, 50, 75);

  CircleTouch();

  //波紋クラスからオブジェクトをつくる
  for (int i = 0; i < maxRipple; i++) {
    rp[i].draw();
  }
}


int count = 0;
void CircleTouch () {
  
  //if ( random(10) < 1 ) {
    count++;
    if ( count > 60 ) {
    count = 0;
    
    int posX = int(400 * sin( millis()*0.0001 ) );
    int posY = int(400 * cos( millis()*0.0001 ) );
    addRipple( width/2 + posX, height/2 + posY );
    
  }
  
}

//mousePressedを、mouseMovedにすると、マウスが動いたら波紋が出ます
void mousePressed() {
  
  //波紋オブジェクトを1個ずつ発生（マウス座標にセット）
  addRipple( mouseX, mouseY );
  
}

void addRipple ( int posX, int posY ) {
  
  //　r_countを1ずつ増やし、maxRippleを超えたら0にする
  rp[r_count].set(posX, posY);
  r_count++;
  if (r_count>=maxRipple) {
    r_count=0;
  }
  
}


/* End */
