
ArrayList<PVector> points = new ArrayList<PVector>();

void setup () {
	
	size( 512, 512 );
	//fullScreen();
	
	background( 0 );
	
	// 文字
	PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
	textFont(notoSansR);
	textSize(12);

	InitPoint();

}

void InitPoint () {

	points.clear();

	for ( int pointPosX = 0; pointPosX < width; pointPosX+=1 ) {

		PVector point = new PVector( pointPosX, height/2 );
		points.add( point );

	}

}


void draw () {

	CheckMouse();
	CheckKeyboard();

	Update_line();
	Draw_Line();
	//Draw_Mouse();
	Draw_FillOver();

		
	//// Debug（動作確認用）
	// 数値
	Draw_DebugMessage();
	// グラフ
	Draw_DebugMouseMove();
	
}


void Update_line () {
  
  float rad = radians( millis()*0.01 );
  
  //noiseSeed( millis() / 50 );

	for ( int pointNum = 0; pointNum < points.size(); pointNum++ ) {

		PVector point = points.get( pointNum );

		//float deg = point.x / width * 360;
		//point.y = height/2 - sin( radians(deg) ) * 100;
		//point.y = height/2 - sin( radians(deg)+millis()*0.001 ) * 100;

    point.y = height/2;
    //point.y += -noise( point.x*0.02 ) * 100;
    //point.y += -random(1.0) * 100;

    //point.y += cos( rad ) * height/2;
    point.y += -noise( rad + point.x*0.02 ) * 100;
    //point.y += -noise( sin(rad) + point.x*0.02 ) * 100;
    
		points.set( pointNum, point );

	}

}

void Draw_Line () {

	stroke( 255, 255, 255,  255 );
	strokeWeight( 1 );

	for ( int pointNum = 1; pointNum < points.size(); pointNum++ ) {

		PVector prePoint = points.get( pointNum-1 );
		PVector point = points.get( pointNum );

		line( prePoint.x, prePoint.y,  point.x, point.y );

	}

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
