
void settingFont () {
  
  // 文字
  PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
  textFont(notoSansR);
  textSize(12);

}

void Draw_DebugMessage () {

  fill( 32, 255 );
  rect( 18, 18-12, 300, 18 );
  rect( 18, 38-12, 300, 18 );
  rect( 18, 58-12, 300, 18 );
  fill( 200, 255 );
  text( String.format("pos x:%4d y:%4d vel x:%4.0f y:%4.0f", mouseX, mouseY, velocityX, velocityY), 20, 20 );
  text( String.format("pre x:%4d y:%4d vel ave:%5.1f", pmouseX, pmouseY, velocityAve), 20, 40 );
  text( String.format("circle size:%5.1f", circleSize ), 20, 60 );
  
}


/* End */
