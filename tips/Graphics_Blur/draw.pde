
PGraphics pg;

void blurCircle ( int x, int y, int r, color c, float b ) {
	
	pg = createGraphics(r*BLUR_IMAGE_RATE, r*BLUR_IMAGE_RATE);
	pg.beginDraw();
		//pg.background(255);
		pg.background(0,0);
		pg.fill(c);
		pg.circle( r, r, r );
		try {
			pg.filter(BLUR, b);
		}
		catch ( Exception e ) {
			println( r, b );
			e.printStackTrace();
		}
	pg.endDraw();
	
	int pgX = x-r;
	int pgY = y-r;
	
	blendMode(SCREEN);
	image( pg, pgX, pgY );
	blendMode(BLEND);
	
}


/* End */
