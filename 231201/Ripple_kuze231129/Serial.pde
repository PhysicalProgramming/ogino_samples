//　---------- シリアル通信の部分 ここから ---------- //

import processing.serial.*;

Serial myPort;
float[] sensorData=new float[4];


//データが送られてきたとき
void serialEvent (Serial p) {

  //文字列の改行まで読み取る
  String stringData=p.readStringUntil(10);
  //println(stringData);


  if (stringData!=null) {

    //受け取った文字列にある先頭と末尾の空白を取り除き、データだけにする
    stringData=trim(stringData);

    //「,」で区切られたデータ部分を分離してbufferに格納する
    float buffer[] = float(split(stringData, ','));

    //bufferのデータが4個そろっていたら、sensorDataへ
    if (buffer.length>=4) {

      sensorData[0] = buffer[0];
      sensorData[1] = buffer[1];
      sensorData[2] = buffer[2];
      sensorData[3] = buffer[3];

    }

  }

}

//　---------- シリアル通信の部分 ここまで ---------- //
