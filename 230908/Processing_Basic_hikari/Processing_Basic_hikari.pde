// 表示ウインドウの大きさ
// size(幅, 高さ)
size(512, 512);

// ウインドウを色で塗りつぶし
background( 48, 28, 119 );


// 背景の光の輪
noStroke();
fill( 255, 255, 214, 20 );
circle( 256,290, 550 );
fill( 255, 255, 214, 20 );
circle( 256,300, 600 );


// 地平線の色の重なり
stroke( 13, 5, 23 );
strokeWeight(400);
line(0, 475,  512, 475 );

stroke( 246, 159, 114,  50 );
strokeWeight(100);
line(0, 245,  512, 265 );

strokeWeight(50);
line(0, 245,  512, 245 );

stroke( 179, 132, 151,  50 );
strokeWeight(20);
line(0, 245,  512, 245 );
strokeWeight(50);
line(0, 255,  512, 245 );


// 太陽
noStroke();
fill( 237, 230, 149,  50 );

circle( 341,160, 230 );
circle( 341,160, 200 );
stroke( 237, 230, 149,  20 );
strokeWeight(20);
circle( 341,160, 180 );


// End
