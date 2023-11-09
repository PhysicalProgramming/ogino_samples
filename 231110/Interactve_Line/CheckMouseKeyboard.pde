
int bgFillOpacity = 127;
int frameRate = 30;

float velocityX = 0;
float velocityY = 0;
float velocityMag = 0; // Magnitude


void CheckMouse () {
	
	// 移動位置から移動量（速度）を計算
	velocityX = mouseX - pmouseX;
	velocityY = mouseY - pmouseY;
	velocityMag = ( abs(velocityX) + abs(velocityY) ) / 2.0;

}

void CheckKeyboard () {

	if ( !keyPressed ) return;


	if ( keyCode == UP ) {

		bgFillOpacity++;
		if ( bgFillOpacity > 255 ) bgFillOpacity = 255;

	}
	else if ( keyCode == DOWN ) {

		bgFillOpacity--;
		if ( bgFillOpacity < 1 ) bgFillOpacity = 1;

	}

	if ( keyCode == LEFT ) {

		frameRate--;
		if ( frameRate < 1 ) frameRate = 1;
	
		frameRate(frameRate);

	}
	else if ( keyCode == RIGHT ) {

		frameRate++;
		if ( frameRate > 60 ) frameRate = 60;
	
		frameRate(frameRate);

	}

}


/* End */
