
float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

float circleSize = 20;
int fillRectCount = 0;


void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 255 );

	settingFont();	
}


void draw () {
	
	//マウスの動き
	Check_MouseMove();

	
	// クリックしてたら描画
	if (mousePressed) {

		noStroke();

		// 円の色
		color drawColor = color( random(255), random(255), random(255), 200 );

		// 普通の円
		//fill( drawColor );
		//circle( mouseX, mouseY, circleSize );
		
		// Graphicsの円
		graphicsCircle( mouseX, mouseY, (int)circleSize, drawColor );
	
	}
	
	//overlay();
	
	//// Debug（動作確認用）
	Draw_DebugMessage();
	
}

void overlay () {
	
	// ゆっくりちょっとずつ黒を重ねる
	if ( fillRectCount > FILL_RECT_COUNT ) {
		
		// 色を重ねる方法を変える
		blendMode(ADD);
	
		fill( 255, 2 );
		rect( 0, 0, width, height );
	
		// 色を重ねる方法をもとに戻す（BLENDがデフォルト）
		blendMode(BLEND);
		
		fillRectCount = 0;
		
	}
	fillRectCount++;

}


/* End */
