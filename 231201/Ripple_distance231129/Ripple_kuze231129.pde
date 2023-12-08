//同時に表示する波紋の数
int maxRipple = 100;    

//波紋オブジェクト用変数
Ripple[] rp = new Ripple[maxRipple];
//波紋オブジェクトを次に進めるために数える変数
int r_count = 0;


void setup() {
  size(800, 600);
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
  
  CheckDistance();

  //波紋クラスからオブジェクトをつくる
  for (int i = 0; i < maxRipple; i++) {
    rp[i].draw();
  }
}




int distance = -1;
int pDistance = -1;
void CheckDistance () {
    
  distance = (int)(sensorData[3] / 10);
  //println(distance);
  
  if ( distance < 400 ) {
    
    if ( pDistance == -1 ) {
      
      pDistance = distance;
      return;
      
    }
    
    if ( abs(distance - pDistance) > 3 ) {
      
      pDistance = distance;
      addRipple( distance * 10, height/2 );
      
    }
    
  }

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
