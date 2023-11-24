
PImage[] imgs;
int animeCount = 0;
int ANIME_COUNT = 6;

void setup () {
	
	size( 1024, 1024 );
	//fullScreen();
	
	background( 0 );

	settingFont();

	imgs = new PImage[ANIME_COUNT];
	for ( int i = 0; i < ANIME_COUNT; i++ ) {

		imgs[i] = loadImage( (i+1) + ".png");

	}

	smooth();

	frameRate(10);
	
}


void draw () {

	background(0);
	
	//マウスの動き
	Check_MouseMove();


	pushMatrix();
	translate( width/2, height/2 );
	scale(2.0);
	rotate( PI/6 );
		image( imgs[animeCount], -imgs[animeCount].width/2, -imgs[animeCount].height/2 );
	popMatrix();

	animeCount++;
	if ( animeCount > ANIME_COUNT-1 ) {
		animeCount = 0;
	}
	
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
