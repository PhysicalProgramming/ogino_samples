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

      sensorData[0] = buffer[0];
      sensorData[1] = buffer[1];
      sensorData[2] = buffer[2];

    }

  }

}


void Setup_Serial() {

  //　---------- シリアル通信の部分 ここまで ---------- //
  printArray(Serial.list());  //シリアルポートの番号を確認
  String portName = Serial.list()[PORT_NUM];  //1番目のポートに接続（自分のPCでは1番目かどうか確認して適宜変更）
  myPort = new Serial(this, portName, 9600);  //選んだポートに、9600の速度で接続する
  //　---------- シリアル通信の部分 ここまで ---------- //
  
}
//　---------- シリアル通信の部分 ここまで ---------- //
