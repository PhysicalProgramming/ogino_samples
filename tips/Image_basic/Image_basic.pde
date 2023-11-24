
PImage img;

void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );

	settingFont();

	img = loadImage("0.png");
	image( img, 0, 0 );
	//image( img, width/2, height/2 );

	noLoop();
	
}


void draw () {
	
	//マウスの動き
	Check_MouseMove();
	
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
