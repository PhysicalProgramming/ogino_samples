//　---------- シリアル通信の部分 ここから ---------- //
//シリアル通信のライブラリを読込む

import processing.serial.*;

Serial myPort;  // シリアル通信を管理する変数
int PORT_NUM = 7; // 毎回確認して数値を変える


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

      sensorData[0] = -buffer[0];
      sensorData[1] =  buffer[1];
      sensorData[2] =  buffer[2];

    }

  }

}
//　---------- シリアル通信の部分 ここまで ---------- //


// 調整用パラメータ
int ALPHA = 10;
color[] BASE_COLORS = {color(255,0,0,ALPHA), color(0,255,0,ALPHA), color(0,0,255,ALPHA)};
float WAVE_SIZE = 50.0;
float CIRCLE_SIZE = 300.0;
int BLUR_IMAGE_RATE = 4;

//// 変数
// Draw circle
float circleSize = 0;
float blurSize = 0;
1
// 塗りつぶし用カウンター
int fillRectCount = 0;


void setup () {

  //　---------- シリアル通信の部分 ここまで ---------- //
  printArray(Serial.list());  //シリアルポートの番号を確認
  String portName = Serial.list()[PORT_NUM];  //1番目のポートに接続（自分のPCでは1番目かどうか確認して適宜変更）
  myPort = new Serial(this, portName, 9600);  //選んだポートに、9600の速度で接続する
  //　---------- シリアル通信の部分 ここまで ---------- //


  size( 512, 512 );
  //fullScreen();

  background( 0 );

  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);


  blendMode( BLEND );
  noStroke();
  
  
  //blurSize = CIRCLE_SIZE / BLUR_IMAGE_RATE;

}


void draw () {

  for ( int i = 0; i < 3; i++ ) {
    
    color drawColor = BASE_COLORS[i];
    
    // センサーの数値で色の強さを変える
    drawColor *= abs(sensorData[i]);

    // 描画色
    fill( drawColor );
    
    // 360°どの方向にずらすかランダムで決定
    float rad = random(0, TAU);
    float x = cos(rad) * sensorData[i]*WAVE_SIZE + width /2;
    float y = sin(rad) * sensorData[i]*WAVE_SIZE + height/2;
    
    // ブラーなし
    drawCircle( (int)x, (int)y, (int)CIRCLE_SIZE );
    
    // ブラー付きの円
    //blurCircle( (int)x, (int)y, (int)CIRCLE_SIZE, drawColor, blurSize );
  
}


  // ゆっくりちょっとずつ黒を重ねる
  if ( fillRectCount > 1 ) {

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




void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  
  fill( 200, 255 );
  text( String.format("sensor x:%6.2f y:%6.2f z:%6.2f", sensorData[0], sensorData[1], sensorData[2]), 20, 20 );
  text( String.format("circle size:%4.0f wave size:%4.0f", CIRCLE_SIZE, WAVE_SIZE ), 20, 40 );

}


void drawCircle( int x, int y, int r ) {
  
    blendMode(SCREEN);
      circle( x, y, r );
    blendMode(BLEND);

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
