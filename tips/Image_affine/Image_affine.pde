// https://www.d-improvement.jp/learning/processing/2011-a/08.html

PImage img;

void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );

	settingFont();

	img = loadImage("0.png");


	smooth();
	pushMatrix();
	translate( width/2-100, height/2 );
	scale(2.0);
	rotate( PI/6 );
		image( img, 0, 0 );
	popMatrix();	

  smooth();
  pushMatrix();
  translate( width/2+100, height/2 );
  scale(2.0);
  rotate( PI/6 );
    image( img, -img.width/2, -img.height/2 );
  popMatrix();  

	//noLoop();
	
}


void draw () {
  
  background(0);
	
	//マウスの動き
	Check_MouseMove();
	
  smooth();
  pushMatrix();
  translate( width/2-100, height/2 );
  scale(2.0);
  rotate( 2*PI * millis()*0.0002 );
    image( img, 0, 0 );
  popMatrix();  

  smooth();
  pushMatrix();
  translate( width/2+100, height/2 );
  scale(2.0);
  rotate( 2*PI * millis()*0.0002 );
    image( img, -img.width/2, -img.height/2 );
  popMatrix();  
  
  
	//overlay();
	
	//// Debug（動作確認用）
	Draw_DebugMessage();
	
}

int fillRectCount = 0;
void overlay () {
	
	// ゆっくりちょっとずつ黒を重ねる
	if ( fillRectCount > FILL_RECT_COUNT ) {
		
		// 色を重ねる方法を変える
		blendMode(MULTIPLY);
	
		fill( 0, 1 );
		rect( 0, 0, width, height );
	
		// 色を重ねる方法をもとに戻す（BLENDがデフォルト）
		blendMode(BLEND);
		
		fillRectCount = 0;
		
	}
	fillRectCount++;

}


/* End */
