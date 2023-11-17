
void Draw_DebugMessage () {

	fill( 32, 255 );
	rect( 18, 18-12, 300, 18 );
	rect( 18, 38-12, 300, 18 );
	rect( 18, 58-12, 300, 18 );
	
	fill( 200, 255 );
	text( String.format("pos x:%4d y:%4d vel x:%4.0f y:%4.0f", mouseX, mouseY, velocityX, velocityY ), 20, 20 );
	text( String.format("pre x:%4d y:%4d mag:%5.1f", pmouseX, pmouseY, velocityMag), 20, 40 );
	text( String.format("fps:%3d opa:%3d points:%4d", frameRate, bgFillOpacity, points.size()), 20, 60 );
	
}


ArrayList velAveList = new ArrayList();
void Draw_DebugMouseMove () {

	//// グラフにするため保存していく
	// マウスを動かしている速度
	velAveList.add( velocityMag );

	// 延々溜まってしまうので一定量貯まったら古い順に削除
	// ウインドウ幅の半分の数だけ貯める
	if ( velAveList.size() > width/2 ) {

		// マウスを動かしている速度
		velAveList.remove(0);

	}

	
	// グラフの背景
	fill( 32, 255 );
	rect( 0, height - 50, width, 50 );
	
	// グラフを描画
	int marginBottom = 10;
	for ( int i = 1; i < velAveList.size(); i++ ) {
		
		float preVel = constrain( (float)velAveList.get(i-1), 0, 30.0 );
		float vel    = constrain( (float)velAveList.get(i),   0, 30.0 );
		
		float graphY1 = preVel;//map ( preVel, 0, 100.0, 0, 30.0 );
		float graphY2 = vel;//map ( vel,    0, 100.0, 0, 30.0 );

		stroke( 230, 120, 30 );
		strokeWeight( 1 );
		
		line( i-1, height - graphY1 - marginBottom,
					i,   height - graphY2 - marginBottom );
		
	}

	noStroke();

}


/* End */
