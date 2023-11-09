
float pointX = 0, pPointX = 0;
float pointY = 0, pPointY = 0;

void setup () {
	
	size( 512, 512 );
	//fullScreen();
	
	background( 0 );
	
	// 文字
	PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
	textFont(notoSansR);
	textSize(12);


	pPointX = pointX = 0;
	pPointY = pointY = height / 2;
	
}


void draw () {

	CheckMouse();
	CheckKeyboard();

	Update_Point();
	Draw_Couple();
	Draw_Point();
	
	//Draw_Mouse();
	Draw_FillOver();

		
	//// Debug（動作確認用）
	// 数値
	Draw_DebugMessage();
	// グラフ
	Draw_DebugMouseMove();
	
}


void Update_Point () {

	pPointX = pointX;
	pPointY = pointY;

	noiseSeed( millis() );

	pointX += 4;
	//pointY += random( -2, 2 );

	//pointY = height/2 - random( 0, 100 );
	pointY = height/2 - noise( pointX ) * 100;

	if ( pointX > width ) {

		pPointX = pointX = 0;

	}

}


void Draw_Point () {

	fill( 255, 255, 255,  255 );
	circle( pointX, pointY,  5 );

}

void Draw_Couple () {

	stroke( 255, 255, 255,  255 );
	strokeWeight( 1 );

	line( pPointX, pPointY,  pointX, pointY );

	noStroke();

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
