// https://dekfractal.com/493.html

int BIRTH_NUM = 10;//300;
Life[] lifes;
int FOOD_NUM = 50;
ArrayList foods;


void setup() {
	
	size(512,512);
	smooth();

	// 文字
	InitFont();
	
	
	lifes = new Life[BIRTH_NUM];
	for (int num = 0; num < lifes.length; num++) {
		lifes[num] = new Life();
		lifes[num].birth("");
	}
	
	foods = new ArrayList();
	for (int num = 0; num < FOOD_NUM; num++) {
		foods.add( new PVector( random( 0, width ), random( 0, height ) ) );
	}
	
}

void draw() {
	
	background(64);
	
	for (int num = 0; num < foods.size(); num++) {
		
		drawFood( (PVector)foods.get(num) );

	}
	
	for (int num = 0; num < lifes.length; num++) {
		lifes[num].update();
		lifes[num].checkFood( foods );
		lifes[num].draw();
	}
	

	//// Debug（動作確認用）
	Draw_DebugMessage();

}
  
  void drawFood ( PVector _pos ) {
    
    pushMatrix();
    translate( _pos.x, _pos.y );
      stroke( 0, 255 );
      fill( 200, 200, 120 );
      circle( 0, 0,  5 );
    popMatrix();

    noStroke();
    
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
