
PGraphics pg;

PImage[] imgs;
int animeCount = 0;
int ANIME_COUNT = 6;
int imgW = 0;
int imgH = 0;

int updateCount = 0;
int UPDATE_COUNT = 6;


void Init_graphicsImage () {

	imgs = new PImage[ANIME_COUNT];
	for ( int i = 0; i < ANIME_COUNT; i++ ) {

		imgs[i] = loadImage( (i+1) + ".png");

	}
	imgW = imgs[0].width;
	imgH = imgs[0].height;

	pg = createGraphics( imgW, imgH );

}

void Draw_graphicsImage ( int x, int y ) {
	
	pg.beginDraw();
		pg.background(255,0);
		pg.noStroke();
		pg.image( imgs[animeCount], 0, 0 );
	pg.endDraw();

	updateCount++;
	if ( updateCount > UPDATE_COUNT ) {
		updateCount = 0;
		animeCount++;
	}
	if ( animeCount > ANIME_COUNT-1 ) {
		animeCount = 0;
	}
	
	// マウスカーソルの先端をgraphicsの中央にする
	int pgX = x-imgW/2;
	int pgY = y-imgH/2;
	
	image( pg, pgX, pgY );
	
}


/* End */
