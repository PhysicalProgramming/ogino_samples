
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

	for ( int pointX = 0; pointX < width; pointX+=1 ) {

		float pointY = height/2 - noise( pointX ) * 100;

		PVector point = new PVector( pointX, pointY );
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


	for ( int pointNum = 0; pointNum < points.size(); pointNum++ ) {

		PVector point = points.get( pointNum );

		point.y = height/2 + GetFbm( point.x );

		points.set( pointNum, point );

	}

}


int octaves = 6;
float lacunarity = 2.0;
float gain = 0.5;

float GetFbm ( float posX ) {

	float frequency = 1.;
	float amplitude = 0.5;

	float y = 0;
	for ( int i = 0; i < octaves; i++ ) {

		y += amplitude * GetNoise( posX * frequency );
		amplitude *= gain;
		frequency *= lacunarity;

	}

	return y;

}

float GetNoise ( float posX ) {

	float amplitude = 100.;
	float frequency = 1.5;

	float time = millis() * 0.001;
	float t = 0.01 * ( - time * 130.0 );

	float deg = posX / width * 360;

	float x = radians( deg );
	float y = sin( x + frequency );

	y += sin( x * frequency *2.1    + t         ) * 4.5;
	y += sin( x * frequency *1.72   + t * 1.121 ) * 4.0;
	y += sin( x * frequency *2.221  + t * 0.437 ) * 5.0;
	y += sin( x * frequency *3.1122 + t * 4.269 ) * 2.5;
	y *= amplitude * 0.06;

	return y;

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
