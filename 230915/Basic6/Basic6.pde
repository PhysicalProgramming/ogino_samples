
println("processing start"); // 文字で途中経過を確認する


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


println("lines 1");
for ( int count = 0; count < 4; count++ ) {

  int positionTop = pointA_Top + ( 10*count );
  if ( count == 1 ) {
    
    line( pointA_Left, positionTop+5,  pointA_Left+lineSize, positionTop-5 );

  }
  else if ( count == 3 ) {
    
    line( pointA_Left, positionTop+5,  pointA_Left+lineSize, positionTop-5 );

  }
  else {

    line( pointA_Left, positionTop,  pointA_Left+lineSize, positionTop );

  }

}


println("lines 2");

pointA_Left += 155;
stroke( YEAR*5, MONTH*10, DAY*5 );

for ( int count = 0; count < 4; count++ ) {

  int positionTop = pointA_Top + ( 10*count );
  if ( count % 2 == 1 ) { // %は余りを出す
  
    line( pointA_Left, positionTop+5,  pointA_Left+lineSize, positionTop-5 );
  
  }
  else {

    line( pointA_Left, positionTop,  pointA_Left+lineSize, positionTop );

  }

}


println("lines 3");

pointA_Left += lineSize + margin;
stroke( YEAR*5, MONTH*15, DAY*5 );

for ( int count = 0; count < 4; count++ ) {

  switch ( count ) { // %は余りを出す

    case 0:
    case 2:
      stroke( YEAR*5, MONTH*5, DAY*15 );
      break;

    case 1:
      stroke( YEAR*15, MONTH*5, DAY*5 );
      break;


    default:
      stroke( YEAR*5, MONTH*15, DAY*5 );
      break;
  
  }

  int positionTop = pointA_Top + ( 10*count );
  line( pointA_Left, positionTop,  pointA_Left+lineSize, positionTop );

}


// End
