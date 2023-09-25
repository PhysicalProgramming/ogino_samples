
// Today
int YEAR = 23;
int MONTH = 9;
int DAY = 15;

size( 512, 512 );
background( YEAR, MONTH, DAY );

stroke( YEAR*5, MONTH*5, DAY*5 );
strokeWeight( 1 );
strokeCap( SQUARE );




int pointA_Left = 46;  // 6 + 40 + 420 + 40 + 6 = 512
int pointA_Top  = 46;
int lineSize = 110;  // 110 + 45 + 110 + 45 + 110 = 420
int margin = 45;

for ( int horizontalCount = 0; horizontalCount < 3; horizontalCount++ ) {
  
  pointA_Left += lineSize + margin;
  stroke( YEAR*5, MONTH * (5 + 5*horizontalCount), DAY*5 );

  for ( int lineCount = 0; lineCount < 4; lineCount++ ) {

    int positionTop = pointA_Top + ( 10*lineCount );
    line( pointA_Left, positionTop,  pointA_Left+lineSize, positionTop );

  }
}


// End
