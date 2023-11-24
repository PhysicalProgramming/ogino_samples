
float velocityX = 0;
float velocityY = 0;
float velocityAve = 0;

int count = 0;
boolean isClick = false;

float circleSize = 0;
float blurSize = 0;
int fillRectCount = 0;


void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );

	settingFont();
	
	blendMode( BLEND );
	
}


void draw () {
	
	//マウスの動きからクリックを取得
	Check_MouseMoveToClick();
	
	
	// 円の色
	color drawColor = color( 200, 100, 50, 255 );
	
	// クリックしてたら色を変える
	if (isClick) {
		
		//drawColor = color( 200, 200, 50, 200 );
		drawColor = color( random(255), random(255), random(255), 200 );
	
	}
	
	
	// 描画
	fill( drawColor );
	
	//stroke( drawColor );
	//strokeWeight( 1 );
	//line( mouseX, mouseY, pmouseX, pmouseY );
	
	noStroke();
	circleSize =  abs( 3 * ( 1 + velocityAve ) );
	if ( circleSize < 2 ) {
		
		circleSize = 2.0;
	
	}
	if ( circleSize > CIRCLE_SIZE_MAX ) {
		
		circleSize = CIRCLE_SIZE_MAX;
	
	}
	float blurMax = circleSize / (float)BLUR_IMAGE_RATE;
	blurSize = random(0,blurMax);
	
	// ブラー付きの円
	//circle( mouseX, mouseY, circleSize );
	blurCircle( mouseX, mouseY, (int)circleSize, drawColor, blurSize );
	
	overlay();
	
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
