
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

line( pointA_Left, pointA_Top+ 0,  pointA_Left+lineSize, pointA_Top+ 0 );
line( pointA_Left, pointA_Top+10,  pointA_Left+lineSize, pointA_Top+10 );
line( pointA_Left, pointA_Top+20,  pointA_Left+lineSize, pointA_Top+20 );
line( pointA_Left, pointA_Top+30,  pointA_Left+lineSize, pointA_Top+30 );


pointA_Left += 155;
stroke( YEAR*5, MONTH*10, DAY*5 );

for ( int count = 0; count < 4; count++ ) {

  line( pointA_Left, pointA_Top+(10*count),  pointA_Left+lineSize, pointA_Top+(10*count) );

}


pointA_Left += lineSize + margin;
stroke( YEAR*5, MONTH*15, DAY*5 );

for ( int count = 0; count < 4; count++ ) {

  int positionTop = pointA_Top + ( 10*count );
  line( pointA_Left, positionTop,  pointA_Left+lineSize, positionTop );

}


// End
