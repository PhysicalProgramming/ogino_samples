
class GraphicsImage {

	PGraphics pg;

	PImage[] imgs;
	int animeCount = 0;
	int ANIME_COUNT = 6;
	int imgW = 0;
	int imgH = 0;

	int updateCount = 0;
	int UPDATE_COUNT = 6;

	public float scale = 1.0;
	public float radius = 0;

	public PVector pos, vel;


	GraphicsImage () {

		Init_graphicsImage();

	}


	void Init_graphicsImage () {

		imgs = new PImage[ANIME_COUNT];
		for ( int i = 0; i < ANIME_COUNT; i++ ) {

			imgs[i] = loadImage( (i+1) + ".png");

		}
		imgW = imgs[0].width;
		imgH = imgs[0].height;

		pg = createGraphics( imgW, imgH );

		pos = new PVector( random(width), random(height) );
		vel = new PVector( 0, 0 );

		SetRandom();

	}

	void SetRandom () {

		animeCount = (int)random((float)ANIME_COUNT);

		UPDATE_COUNT = (int)random(3,10);
		updateCount = (int)random((float)UPDATE_COUNT);


		//vel = new PVector( random(1,3), 0 );
		vel = new PVector( 1/(float)UPDATE_COUNT*20., 0 );

    scale = random(0.5, 3);

	}

	void Draw_graphicsImage () {
		
		pg.beginDraw();
			pg.background(255,0);
			pg.noStroke();
			pg.image( imgs[animeCount], 0, 0 );
      pg.filter(BLUR, scale );
		pg.endDraw();

		updateCount++;
		if ( updateCount > UPDATE_COUNT ) {
			updateCount = 0;
			animeCount++;
		}
		if ( animeCount > ANIME_COUNT-1 ) {
			animeCount = 0;
		}
		
		pos.add(vel);
		if ( pos.x > width + imgW ) {
			pos.x = -imgW;
			SetRandom();
		}
		if ( pos.y > height + imgH ) {
			pos.y = -imgH;
			SetRandom();
		}

		// graphicsの中央を基準にする
		int pgX = (int)pos.x-imgW/2;
		int pgY = (int)pos.y-imgH/2;
		

		pushMatrix();
		translate( pgX, pgY );
		scale(scale);
		rotate(radius);
			image( pg, -imgW/2, -imgH/2 );
		popMatrix();
		
	}

}


/* End */
