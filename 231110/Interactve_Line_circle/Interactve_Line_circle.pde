// https://note.com/deconbatch/n/nc14219bfacc6

import processing.sound.*;

ArrayList<PVector> points = new ArrayList<PVector>();

SoundFile soundFile;
int waitCount = 0;


void setup () {
	
	size( 512, 512 );
	//fullScreen(2);
	
	background( 0 );
	
	// 文字
	PFont notoSansR = loadFont("SourceHanCodeJP-Regular-48.vlw");
	textFont(notoSansR);
	textSize(12);

	//soundFile = new SoundFile( this, "type_03.wav" );
	soundFile = new SoundFile( this, "progress_loop.wav" );

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

	Update_sound();

	Update_line();
	Draw_circle_dot();
	Draw_circle_line();
	
	//Draw_Mouse();
	Draw_FillOver();

		
	//// Debug（動作確認用）
	// 数値
	Draw_DebugMessage();
	// グラフ
	Draw_DebugMouseMove();
	
}


void Update_sound () {

	waitCount++;
	if ( waitCount > 30 ) {

	  soundFile.play( 0.1, 0.5 );

	  waitCount = 0;

	}
	else if ( waitCount > 15 ) {

		if ( waitCount % 15 == 1 )
			soundFile.play( 0.5 + ( sin( millis() * 0.001 ) + 1.), 0.5 );
			//soundFile.play( 0.8, 0.5 );

	}

}


void Update_line () {

	float t = millis() * 0.01;
	float rad = radians( t );

	noiseSeed( millis() / 50 );
	//noiseSeed( int(sin( radians( millis() / 100 ) ) * 100) );

	for ( int pointNum = 0; pointNum < points.size(); pointNum++ ) {

		PVector point = points.get( pointNum );

		float radFromX = point.x / float(width) * 2*PI;

		point.y = height/2;
		point.y += cos( rad*10 ) * height/3;
		//point.y += -noise( sin(rad) + point.x*0.02 ) * 100;
		point.y += noise( width + cos( radFromX + rad ), height + sin( radFromX + rad*3 ) ) * height/3;

		points.set( pointNum, point );

	}

}

void Draw_circle_dot () {

	stroke( 255, 255, 255,  255 );
	strokeWeight( 1 );

	pushMatrix();
	translate( width/2, height/2 );

	for ( int pointNum = 0; pointNum < points.size(); pointNum++ ) {

		PVector point = points.get( pointNum );
		float rad = pointNum / float(width-1) * 2*PI;
		//rad += point.x;

		point( cos(rad) * point.y*0.5, sin(rad) * point.y*0.5 );

	}
	
	popMatrix();

	noStroke();

}

void Draw_circle_line () {

	stroke( 255, 255, 255,  255 );
	strokeWeight( 1 );

	pushMatrix();
	translate( width/2, height/2 );

	for ( int pointNum = 1; pointNum < points.size(); pointNum++ ) {

		PVector prePoint = points.get( pointNum-1 );
		PVector point = points.get( pointNum );

		float preRad = (pointNum-1) / float(width-1) * 2*PI;
		float rad = pointNum / float(width-1) * 2*PI;
		//float preRad = prePoint.x*0.1 + (pointNum-1) / (float)(points.size()-1) * 2*PI;
		//float rad = point.x*0.1 + pointNum / (float)(points.size()-1) * 2*PI;

		line( cos(preRad) * prePoint.y*0.5, sin(preRad) * prePoint.y*0.5,
			  cos(rad) * point.y*0.5, sin(rad) * point.y*0.5 );


	}
	
	popMatrix();

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
