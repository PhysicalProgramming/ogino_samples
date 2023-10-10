
void InitFont () {
  
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

}

int LINE_H = 18;
int LINE_MARGIN = 4;
void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 10, 10, width-20, LINE_H );
  
  fill( 200, 255 );
  text( String.format("Key[P]: save image"), 20, 10 + LINE_H - LINE_MARGIN );

}
