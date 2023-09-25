// 変数
// 数値 int float long double
// コンピュータ  boolean byte
// 文字 char
// 構造体 color

// 定数
// width
// height


// Today
int year = 23;
int month = 9;
int day = 15;

size( 512, 512 );
background( year, month, day );

stroke( year*5, month*5, day*5 );
strokeWeight( 1 );
strokeCap( SQUARE );




int pointA_Left = 46; // 6 + 40 + 320 + 40 + 6
int pointA_Top = 46;
int lineSize = 100; 
int margin = 10;

line( pointA_Left, pointA_Top,  pointA_Left+lineSize, pointA_Top );
line( pointA_Left, pointA_Top+10,  pointA_Left+lineSize, pointA_Top+10 );
line( pointA_Left, pointA_Top+20,  pointA_Left+lineSize, pointA_Top+20 );
line( pointA_Left, pointA_Top+30,  pointA_Left+lineSize, pointA_Top+30 );


pointA_Left += 110;
stroke( year*5, month*10, day*5 );

line( pointA_Left, pointA_Top,  pointA_Left+lineSize, pointA_Top );
line( pointA_Left, pointA_Top+10,  pointA_Left+lineSize, pointA_Top+10 );
line( pointA_Left, pointA_Top+20,  pointA_Left+lineSize, pointA_Top+20 );
line( pointA_Left, pointA_Top+30,  pointA_Left+lineSize, pointA_Top+30 );


pointA_Left += lineSize + margin;
stroke( year*5, month*15, day*5 );

line( pointA_Left, pointA_Top,  pointA_Left+lineSize, pointA_Top );
line( pointA_Left, pointA_Top+10,  pointA_Left+lineSize, pointA_Top+10 );
line( pointA_Left, pointA_Top+20,  pointA_Left+lineSize, pointA_Top+20 );
line( pointA_Left, pointA_Top+30,  pointA_Left+lineSize, pointA_Top+30 );


// End
