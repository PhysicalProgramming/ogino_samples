
//シリアル通信のライブラリを読込む
import processing.serial.*;

String[] portNames;

void setup () {
  
  size( 512, 512 );
  background( 0 );

  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);
  
  //シリアルポートのリストを取得
  portNames = Serial.list();

}


void draw () {

  //// Debug（動作確認用）
  // 数値
  Draw_DebugMessage();

}




void Draw_DebugMessage () {
  
  int count = 0;
  int yPos = 18;
  for( String name : portNames ) {

    fill( 32, 255 );
    rect( 10, yPos-12, width-20, 18 );

    if ( name.indexOf("usbserial") > -1 && name.indexOf("tty") > -1 ) {
      
      fill( 200, 200, 20, 255 );
      
    }
    else {
      
      fill( 200, 255 );
      
    }
    text( String.format("Port[%2d] name: %s", count, name), 20, yPos+2 );
    
    count++;
    yPos += 20;

  }

}


/* End */
