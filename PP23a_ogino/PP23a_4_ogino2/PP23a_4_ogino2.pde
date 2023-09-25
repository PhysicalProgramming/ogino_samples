

// 分割数
int splitNum = 5;
// 全部の音の数
int splitMax = 10;

/* ArrayListについて
	http://www.isc.meiji.ac.jp/~kikn/PDE/PDE9-Listsb.pdf
	https://teratail.com/questions/36328
 */
/* PVectorについて
	https://dekfractal.com/1371.html
 */
/* 2次元配列について
	https://cocopon.me/zero-pde/array-2d/
 */
ArrayList<ArrayList<PVector>> lines = new ArrayList<ArrayList<PVector>>();
ArrayList<PVector> lineSpeeds = new ArrayList<PVector>();


void setup () {

	size(360, 640);
	//fullScreen();

	println( "content size:", width, height );

	background(0);


	//　---------- シリアル通信の部分 ここから ---------- //
	printArray(Serial.list());
	String portName = Serial.list()[2];
	myPort = new Serial(this, portName, 9600);
	//　---------- シリアル通信の部分 ここまで ---------- //

}


// ひとつ前の瞬間のxを覚えておくための変数
int last_x = 0;

void draw () {

	//background(0);

	if ( lines.size() < 80 && random(1.0) < 0.5 ) AddLine();
	DrawLines();

	
	//　---------- センサの値を整える ここから ---------- //

	// sensorData[0]をもとに、0〜splitMaxまでの整数をつくる
	int x = int (map(sensorData[0], -1, 1, splitMax, 0));
	//println(x);

	//　---------- センサの値を整える ここまで ---------- //

	

	// constrainは、絶対に0〜splitMax-1をはみ出さないようにする役割
	// 配列の番号を超えないようにするため
	x = constrain(x, 0, splitMax-1);

	// 上の行で更新された今この瞬間のxが、last_x（=ひとつ前の瞬間のx）と違うとき、
	if (x != last_x) {

		if (x>=0 && x<splitNum) {

		} else if (x>=splitNum && x<splitNum*2) {

		}

	}

	// last_xに、この瞬間のxをおぼえておく（次のループで、ひとつ前の瞬間のxとなる）
	last_x = x;

}

void AddLine () {

	PVector lineSpeed = new PVector( random(1, 4), 0 );
	lineSpeeds.add( lineSpeed );


	ArrayList newLine = new ArrayList<PVector>();

	for ( int pointPosX = 0; pointPosX <= width; pointPosX+=2 ) {

		//newLine.add( new PVector(pointPosX, 0 + cos( ( ( pointPosX + second() ) * 0.005 ) * millis() ) * 10 ) );
		newLine.add( new PVector(pointPosX, 0 + cos( (pointPosX + millis()) * 0.01 * lineSpeed.x ) * 10 ) );

	}

	lines.add( newLine );

	//println( "Add newLine" );

}

void DrawLines () {

	stroke(255, 5);
 
	
	for ( int lineNumber = 0; lineNumber < lines.size(); lineNumber++ ) {

		PVector lineSpeed = lineSpeeds.get(lineNumber);
		lineSpeed.y += lineSpeed.x;
		lineSpeeds.set( lineNumber, lineSpeed );

		ArrayList<PVector> currentLine = lines.get(lineNumber);
		for ( int pointNumber = 0; pointNumber < currentLine.size(); pointNumber++ ) {

			PVector updatePoint = PVector.add( currentLine.get(pointNumber), new PVector( 0, lineSpeed.x ) );

			currentLine.set(pointNumber, updatePoint);

			if ( pointNumber > 0 ) {

				line( currentLine.get(pointNumber-1).x, currentLine.get(pointNumber-1).y,
						currentLine.get(pointNumber).x, currentLine.get(pointNumber).y );

			}

		}

		if ( lineSpeed.y > height * 1.1 ) {

			lines.remove( lineNumber );
			lineSpeeds.remove( lineNumber );			
			
		}

	}

	if ( lineSpeeds.size() > 0 )
		println( lineSpeeds.get(0) );

}

/* keyboard
	http://www.musashinodenpa.com/p5/index.php?pos=1439
 */

boolean paused = false;

void keyPressed () {

	if (key == CODED) {

		if (keyCode == ESC) {
			exit();
		}

	}
	
	if (keyCode == ' ') {
		paused = !paused;

		if (paused) {
			noLoop();
		} else {
			loop();
		}
	}

}


//　---------- シリアル通信の部分 ここから ---------- //

import processing.serial.*;

Serial myPort;
float[] sensorData=new float[4];


//データが送られてきたとき
void serialEvent (Serial p) {

	//文字列の改行まで読み取る
	String stringData=p.readStringUntil(10);
	//println(stringData);


	if (stringData!=null) {

		//受け取った文字列にある先頭と末尾の空白を取り除き、データだけにする
		stringData=trim(stringData);

		//「,」で区切られたデータ部分を分離してbufferに格納する
		float buffer[] = float(split(stringData, ','));

		//bufferのデータが4個そろっていたら、sensorDataへ
		if (buffer.length>=4) {

			sensorData[0] = buffer[0];
			sensorData[1] = buffer[1];
			sensorData[2] = buffer[2];
			sensorData[3] = buffer[3];

		}

	}

}

//　---------- シリアル通信の部分 ここまで ---------- //
