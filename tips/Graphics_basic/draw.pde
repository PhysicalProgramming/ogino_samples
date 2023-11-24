
PGraphics pg;

void graphicsCircle ( int x, int y, int r, color c ) {
	
	pg = createGraphics(r*GRAPHICS_IMAGE_RATE, r*GRAPHICS_IMAGE_RATE);

	pg.beginDraw();
		pg.background(255);
		pg.noStroke();
		pg.fill(c);
		pg.circle( r, r, r );
	pg.endDraw();
	
	// マウスカーソルの先端をgraphicsの中央にする
	int pgX = x-r;
	int pgY = y-r;
	
	image( pg, pgX, pgY );
	
}


/* End */
