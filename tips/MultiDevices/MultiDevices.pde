//　---------- シリアル通信の部分 ここから ---------- //
//シリアル通信のライブラリを読込む

import processing.serial.*;

// 1つめ
Serial myPort1;  // シリアル通信を管理する変数
int PORT1_NUM = 1; // 毎回確認して数値を変える

// 2つめ
Serial myPort2;
int PORT2_NUM = 7;


//受信したセンサのデータを入れる配列
//受信データが3つなので、3コの配列をつくる
float[] sensor1Data=new float[3];
float[] sensor2Data=new float[3];


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
      
      if ( p == myPort1 ) {
    
          sensor1Data[0] = -buffer[0];
          sensor1Data[1] =  buffer[1];
          sensor1Data[2] =  buffer[2];
          
      }
      else if ( p == myPort2 ) {
    
          sensor2Data[0] = -buffer[0];
          sensor2Data[1] =  buffer[1];
          sensor2Data[2] =  buffer[2];
          
      }

    }

  }

}
//　---------- シリアル通信の部分 ここまで ---------- //



void setup () {

  //　---------- シリアル通信の部分 ここまで ---------- //
  printArray(Serial.list());  //シリアルポートの番号を確認
  
  String portName1 = Serial.list()[PORT1_NUM];  //PORT_NUM1番に接続
  myPort1 = new Serial(this, portName1, 9600);  //選んだポートに、9600の速度で接続する

  String portName2 = Serial.list()[PORT2_NUM];
  myPort2 = new Serial(this, portName2, 9600);
  //　---------- シリアル通信の部分 ここまで ---------- //


  size( 512, 512 );
  background( 0 );


  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

}


void draw () {
  
  background(0);
  
  stroke( 200, 255 );
  strokeWeight(1);
  line( 100,       height/2 + sensor1Data[1] * 50,
        width-100, height/2 + sensor2Data[1] * 50 );

  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();

}




void Draw_DebugMessage () {
  
  noStroke();

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  
  fill( 200, 255 );
  text( String.format("device1 x:%6.2f y:%6.2f z:%6.2f", sensor1Data[0], sensor1Data[1], sensor1Data[2]), 20, 20 );
  text( String.format("device2 x:%6.2f y:%6.2f z:%6.2f", sensor2Data[0], sensor2Data[1], sensor2Data[2]), 20, 40 );

}


/* End */
