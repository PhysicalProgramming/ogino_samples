//　---------- シリアル通信の部分 ここから ---------- //
//シリアル通信のライブラリを読込む

import processing.serial.*;

Serial myPort;  // シリアル通信を管理する変数
int PORT_NUM = 7;


//受信したセンサのデータを入れる配列
//受信データが3つなので、3コの配列をつくる
float[] sensorData=new float[3];

//シリアル通信でデータを受けとると自動的に呼び出される
void serialEvent (Serial p) {

  //文字列の改行まで読み取る（ASCIIコードの「10」が改行を示す）
  String stringData = p.readStringUntil(10);

  if (stringData!=null) {  //stringDataが空っぽでなければ

    //文字列にある先頭と末尾の空白を取り除き、データだけに整える
    stringData=trim(stringData);

    //「,」で区切られたデータ部分を分けて、buffer配列に格納する
    float buffer[] = float(split(stringData, ','));

    //buffer配列のデータが3個そろったら、sensorDataへ入れる
    if (buffer.length>=3) {

      sensorData[0] = buffer[0];
      sensorData[1] = buffer[1];
      sensorData[2] = buffer[2];

    }

  }

}
//　---------- シリアル通信の部分 ここまで ---------- //


// 調整用パラメータ
float VELOCITY_MAX = 1.0;
float CLICK_THRESHOLD = 0.2;
int CLICK_THRESHOLD_COUNT = 2;
float CIRCLE_SIZE_MAX = 100.0;
int BLUR_IMAGE_RATE = 4;

// 変数
float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

int count = 0;
boolean isClick = false;

float circleSize = 0;
float blurSize = 0;
int fillRectCount = 0;


void setup () {

  //　---------- シリアル通信の部分 ここまで ---------- //
  printArray(Serial.list());  //シリアルポートの番号を確認
  String portName = Serial.list()[PORT_NUM];  //1番目のポートに接続（自分のPCでは1番目かどうか確認して適宜変更）
  myPort = new Serial(this, portName, 9600);  //選んだポートに、9600の速度で接続する
  //　---------- シリアル通信の部分 ここまで ---------- //


  //size( 512, 512 );
  //size( 1024, 1024 );
  fullScreen(2);

  background( 0 );

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

    drawColor = color( random(255), random(255), random(255), 200 );

  }


  // 描画
  fill( drawColor );


  noStroke();
  circleSize =  50.0;
  if ( circleSize < 2 ) {

    circleSize = 2.0;

  }
  if ( circleSize > CIRCLE_SIZE_MAX ) {

    circleSize = CIRCLE_SIZE_MAX;

  }
  float blurMax = circleSize / (float)BLUR_IMAGE_RATE;
  blurSize = random(0,blurMax);

  int sensorX = int(-sensorData[0] * width /2) + width /2;
  int sensorY = int( sensorData[1] * height/2) + height/2;

  // ブラー付きの円
  blurCircle( sensorX, sensorY, (int)circleSize, drawColor, blurSize );


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

  velocityX = -sensorData[0];//mouseX - pmouseX;
  velocityY = -sensorData[1];//mouseY - pmouseY;
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
    pg.background(0,0);
    pg.fill(c);
    pg.circle( r, r, r );
    pg.filter(BLUR, b);
  pg.endDraw();
  
  int pgX = x-r;
  int pgY = y-r;
  
  blendMode(SCREEN);
  image( pg, pgX, pgY );
  blendMode(BLEND);
  
}


/* End */
