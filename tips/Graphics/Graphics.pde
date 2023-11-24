
float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

float circleSize = 20;
int fillRectCount = 0;


void setup () {
	
	//size( 512, 512 );
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );
	//background( 255 );

	settingFont();
	
	blendMode( BLEND );
	
}


void draw () {
	
	// 初期値が入るまでスキップ
	if ( mouseX == pmouseX ) return;
	else if ( pmouseX == 0 ) return;
	
	
	//マウスの動き
	Check_MouseMove();

	
	// クリックしてたら描画
	if (mousePressed) {

		noStroke();

		// 円の色
		//color drawColor = color( 200, 200, 50, 200 );
		color drawColor = color( random(255), random(255), random(255), 200 );

		// 普通の円
		//fill( drawColor );
		//circle( mouseX, mouseY, circleSize );
		
		// ブラー付きの円
		graphicsCircle( mouseX, mouseY, (int)circleSize, drawColor );
	
	}
	
	//overlay();
	
	//// Debug（動作確認用）
	// 数値
	Draw_DebugMessage();
	
}

void overlay () {
	
	// ゆっくりちょっとずつ黒を重ねる
	if ( fillRectCount > 10 ) {
		
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
