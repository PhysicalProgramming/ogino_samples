
int BIRTH_NUM = 10;
Group[] groups;


void setup() {
	
	size(512,512);
	//fullScreen();
	smooth();

	// 文字
	InitFont();

	groups = new Group[BIRTH_NUM];
	for ( int num = 0; num < BIRTH_NUM; num++ ) {

		groups[num] = new Group();
		groups[num].birth( "John", new PVector( random( 10, width-10) , height*0.9 ) );

	}
	
}

void draw() {
	
	background(64);
	
	for ( int num = 0; num < BIRTH_NUM; num++ ) {
		groups[num].update();
		groups[num].draw();
	}
	

	//// Debug（動作確認用）
	Draw_DebugMessage();

}


void keyPressed() {
	
	if (key == 't') {
		noLoop();
	}

	if (key == 's') {
		loop();
	}

}


/* End */
