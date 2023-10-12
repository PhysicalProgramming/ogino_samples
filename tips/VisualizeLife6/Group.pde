class Group {

	int LIFE_NUM = 6;
	
	public Life[] lifes;
	PVector pos;

  
	void birth ( String _name, PVector _pos ) {
  
		lifes = new Life[LIFE_NUM];
		pos = _pos;

		float distance = 30;

		for (int num = 0; num < lifes.length; num++) {

			lifes[num] = new Life();

			distance = 10 + 10 * ( lifes.length - num );

			int xx = (int)pos.x;
			int yy = (int)pos.y - int(distance * num);
			println( String.format("%s life%d # x: %d  y: %d", _name, num, xx, yy ) );

			lifes[num].birth( num, "p"+num, new PVector( xx, yy ), distance);
			if ( num > 0 ) {

				lifes[num].parent = lifes[num-1];

			}
			else {

				lifes[num].pos = pos;

			}
		}

	}

	void update () {

		for (int num = 0; num < lifes.length; num++) {

			lifes[num].update();

		}

	}

	void draw () {

		for (int num = 0; num < lifes.length; num++) {

			lifes[num].draw();

		}

		for (int num = 0; num < lifes.length-1; num++) {

			pushMatrix();
			  stroke( 255, 255 );
			  strokeWeight( 1 * ( lifes.length - num ) );
			  line( lifes[num].pos.x, lifes[num].pos.y,  lifes[num+1].pos.x, lifes[num+1].pos.y );
			popMatrix();

		}

	}

}


/* End */
