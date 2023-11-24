
PGraphics pg;

void graphicsCircle ( int x, int y, int r, color c ) {
	
	pg = createGraphics(r*GRAPHICS_IMAGE_RATE, r*GRAPHICS_IMAGE_RATE);

	pg.beginDraw();
		pg.background(255,0);
		//pg.background(128);
		//pg.background(0);
		pg.noStroke();
		pg.fill(c);
		pg.circle( r, r, r );
	pg.endDraw();
	
	// マウスカーソルの先端をgraphicsの中央にする
	int pgX = x-r;
	int pgY = y-r;
	
	//blendMode(SCREEN); //
	//blendMode(MULTIPLY);
	image( pg, pgX, pgY );
	blendMode(BLEND);
	
}


/* End */
