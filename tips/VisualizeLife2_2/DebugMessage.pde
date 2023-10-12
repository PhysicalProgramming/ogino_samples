
void InitFont () {
  
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

}

int LINE_H = 18;
int LINE_MARGIN = 4;
void Draw_DebugMessage () {
  
  noStroke();
  
  int left = 10;
  int top = 10 + (LINE_H + LINE_MARGIN) * 0;
  
  fill( 32, 160 );
  rect( left, top, width-20, LINE_H );
  rect( left, 10 + (LINE_H + LINE_MARGIN) * 1, width-20, LINE_H );
  
  fill( 200, 255 );
  text( String.format("[T]: stop loop [S]: start loop"), left + 10, top + LINE_H - LINE_MARGIN );
  text( String.format("foods: %d", foods.size()), left + 10, 10 + (LINE_H + LINE_MARGIN) * 1 + LINE_H - LINE_MARGIN );
}
