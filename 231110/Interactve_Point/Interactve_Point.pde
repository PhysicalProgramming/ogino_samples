
float pointX = 0;
float pointY = 0;

void setup () {
	
	size( 512, 512 );
	//fullScreen();
	
	background( 0 );
	
	// 文字
	PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
	textFont(notoSansR);
	textSize(12);


	pointX = 0;
	pointY = height / 2;
	
}


void draw () {

	CheckMouse();
	CheckKeyboard();

	Draw_Point();
	//Draw_Mouse();
	Draw_FillOver();

		
	//// Debug（動作確認用）
	// 数値
	Draw_DebugMessage();
	// グラフ
	Draw_DebugMouseMove();
	
}


void Draw_Point () {

	pointX += 1;
	pointY += 0;

	if ( pointX > width ) pointX = 0;

	fill( 255, 255, 255,  255 );
	circle( pointX, pointY,  10 );

}


void Draw_Mouse () {

	fill( 255, 255, 255,  255 );
	circle( mouseX, mouseY,  10 );

}

void Draw_FillOver () {

	blendMode( MULTIPLY );

	fill( 0, bgFillOpacity );
	rect( 0, 0, width, height );

	blendMode( BLEND );

}


/* End */
