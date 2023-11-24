
GraphicsImage[] gImgs;
int IMAGE_COUNT = 1;//200;

int fillRectCount = 0;


void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );

	settingFont();


	gImgs = new GraphicsImage[IMAGE_COUNT];
	for ( int i = 0; i < IMAGE_COUNT; i++ ) {

		gImgs[i] = new GraphicsImage();

	}
	
}


void draw () {

	background(0);
	
	//マウスの動き
	Check_MouseMove();


	noStroke();

	// 円の色
	color drawColor = color( random(255), random(255), random(255), 200 );

	// マウスカーソル
	fill( drawColor );
	circle( mouseX, mouseY, 10 );
	

	// GraphicsImages
	for ( int i = 0; i < IMAGE_COUNT; i++ ) {
		gImgs[i].Draw_graphicsImage();
	}

	
	//overlay();
	
	//// Debug（動作確認用）
	Draw_DebugMessage();
	
}

void overlay () {
	
	// ゆっくりちょっとずつ黒を重ねる
	if ( fillRectCount > FILL_RECT_COUNT ) {
		
		// 色を重ねる方法を変える
		blendMode(MULTIPLY);
	
		fill( 0, 100 );
		rect( 0, 0, width, height );
	
		// 色を重ねる方法をもとに戻す（BLENDがデフォルト）
		blendMode(BLEND);
		
		fillRectCount = 0;
		
	}
	fillRectCount++;

}


/* End */
