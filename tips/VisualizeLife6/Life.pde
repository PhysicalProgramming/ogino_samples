class Life {
	
	int id = -1;
	String name = "";
	color col = color( 200, 155 );
	
	int UPDATE_INTERVAL = 0;
	
	boolean isAlive = false;
	int nextActivityCount = 0;
	float size = 10;
	public float distance = 10;
	public float angle, targetAngle;
	float speed;

	int WAIT_MAX = 1;
	float WAIT_ANGLE = 45.0;
	
	public PVector pos, dir; // dir: dirction
	int changeDirCount = 0;

	Life parent;
	
	
	void birth ( int _id, String _name, PVector _pos, float _distance ) {
		
		id = _id;
		name = _name;
		
		isAlive = true;
		nextActivityCount = WAIT;
		
		angle = targetAngle = -90.0;
		speed = random(0.01, 0.02);
		
		pos = _pos;
		distance = _distance;
		dir = PVector.fromAngle( radians(angle) );
		
	}
	
	void update () {

		if ( id == 0 ) return;
		
		if ( !checkActivity() ) return;
			
		angle = lerp( angle, targetAngle, speed );
		if ( abs( angle - targetAngle ) < 1.0 ) {
			
			if ( checkDirectionalCount() ) {
			
				targetAngle = random( -WAIT_ANGLE, WAIT_ANGLE ) - 90.0;
				speed = random(0.01, 0.02);
				
			}
			
		}
		
		
		dir = PVector.fromAngle( radians(angle) ).mult( distance );
		pos = new PVector( parent.pos.x + dir.x, parent.pos.y + dir.y );
		
	}
	
	
	boolean checkActivity () {
		
		nextActivityCount--;
		if ( nextActivityCount < 0 ) {
			
			nextActivityCount = UPDATE_INTERVAL;
			return true;
			
		}
		else {
			
			return false;
		
		}
		
	}
	
	boolean checkDirectionalCount () {
		
		changeDirCount--;
		if ( changeDirCount < 0 ) {
			
			changeDirCount = (int)random( 1, WAIT_MAX );
			return true;
		
		}
		else {
			
			return false;
			
		}
		
	}
	
	
	void draw () {
		
		if ( !isAlive ) return;
		
		noStroke();
		
		pushMatrix();
		translate( pos.x, pos.y );
		rotate( dir.heading() );
			fill(col);
			circle( 0, 0,  size );
		
			stroke( 255, 255 );
			strokeWeight(3);
			line( 0, 0,  size/2, 0 );
		popMatrix();
		
	}

}
