//　---------- シリアル通信の部分 ここから ---------- //
//シリアル通信のライブラリを読込む

import processing.serial.*;

Serial myPort;  // シリアル通信を管理する変数
int PORT_NUM = 7;


//受信したセンサのデータを入れる配列
//受信データが3つなので、3コの配列をつくる
float[] sensorData=new float[4];

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
    if (buffer.length>=4) {

      sensorData[0] = buffer[0];
      sensorData[1] = buffer[1];
      sensorData[2] = buffer[2];
      sensorData[3] = buffer[3];

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


  size( 512, 512 );
  //fullScreen();
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

  blendMode( BLEND );

}


void draw () {

  background( 0 );


  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();

}




void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  fill( 200, 255 );
  text( String.format("mouse pos x:%4d y:%4d preX:%4d preY:%4d", mouseX, mouseY, pmouseX, pmouseY), 20, 20 );
  text( String.format("device x:%4.1f y:%4.1f z:%4.1f distance:%5.1f", sensorData[0],  sensorData[1],  sensorData[2],  sensorData[3]), 20, 40 );

}


/* End */
