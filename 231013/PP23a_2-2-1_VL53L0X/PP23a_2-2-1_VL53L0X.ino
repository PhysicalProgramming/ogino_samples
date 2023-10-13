/**
 * https://sites.google.com/view/pp23a/device/2-2/2-2-1
 */

#include <M5Core2.h>

// M5Core2でバッテリーチェック用のライブラリ
#include <AXP192.h>
AXP192 power;

// 外部センサー用のライブラリ
#include "Adafruit_VL53L0X.h"
Adafruit_VL53L0X lox = Adafruit_VL53L0X();
bool isLox = false;


//センサの情報をいれる変数
float accX = 0;
float accY = 0;
float accZ = 0;
int distance = 0;
float batteryLevel = 0;


void setup() {

	//M5の機能を使い始める
	M5.begin();
	//M5のセンサを使い始める
	M5.IMU.Init();

	// VL53L0X（測距センサー）を使い始める
	isLox = lox.begin();
	if ( isLox ) lox.startRangeContinuous();


	//背景の色など
	M5.Lcd.fillScreen(BLACK);
	M5.Lcd.setTextColor(WHITE, BLACK);
	M5.Lcd.setTextSize(2);

	//座標と文字
	M5.Lcd.setCursor(160, 5);
	M5.Lcd.print("SENSOR+USB");

	//PCとの通信を始める
	Serial.begin(9600);

}

void loop() {

	//センサ情報を変数にいれる
	M5.IMU.getAccelData(&accX, &accY, &accZ);

	//---------------------------------------------------------
	//加速度センサ X軸
	M5.Lcd.setCursor(5, 5);
	M5.Lcd.print("accX");
	M5.Lcd.setCursor(80, 5);
	M5.Lcd.print(accX);

	//数値を使いやすく変換
	int ax = map(accX * 100, 100, -100, 0, 320);

	//四角を描画
	M5.Lcd.fillRect(ax, 30, 320 - ax, 10, DARKGREY); //灰色の四角
	M5.Lcd.fillRect(0, 30, ax, 10, RED); //赤い四角


	//---------------------------------------------------------
	//加速度センサ Y軸
	M5.Lcd.setCursor(5, 60);
	M5.Lcd.print("accY");
	M5.Lcd.setCursor(80, 60);
	M5.Lcd.print(accY);

	//数値を使いやすく変換
	int ay = map(accY * 100, 100, -100, 0, 320);

	//四角を描画
	M5.Lcd.fillRect(ay, 85, 320 - ay, 10, DARKGREY); //灰色の四角
	M5.Lcd.fillRect(0, 85, ay, 10, GREEN); //緑の四角


	//---------------------------------------------------------
	//加速度センサ Z軸
	M5.Lcd.setCursor(5, 115);
	M5.Lcd.print("accZ");
	M5.Lcd.setCursor(80, 115);
	M5.Lcd.print(accZ);

	//数値を使いやすく変換
	int az = map(accZ * 100, 100, -100, 0, 320);

	//四角を描画
	M5.Lcd.fillRect(az, 140, 320 - az, 10, DARKGREY); //灰色の四角
	M5.Lcd.fillRect(0, 140, az, 10, CYAN); //水色の四角


	//---------------------------------------------------------
	//測距センサ 距離
	if ( isLox && lox.isRangeComplete() ) {

		distance = lox.readRange();

		M5.Lcd.setCursor(0, 165);
		M5.Lcd.printf("Distance %4d mm", distance);

	}


	//---------------------------------------------------------
	//バッテリー残量
	// constrainは特定の範囲に数値を収める関数
	batteryLevel = constrain( power.GetBatVoltage(), 3.4, 4.2 );


	//数値を使いやすく変換
	//int btRate = map( (int)batteryLevel, 34, 42, 0, 100 );
	int btRate = int( ( (batteryLevel-3.4) / (4.2-3.4) ) * 100.0 );
	int btWidth = map(btRate, 0, 100, 0, 320);

	M5.Lcd.setCursor(5, 195);
	//M5.Lcd.printf("Battery Voltage %1.1f %c", batteryLevel, 'V');
	M5.Lcd.printf("Battery %3d %c (%1.2fV)", btRate, '%', batteryLevel);

	//四角を描画
	M5.Lcd.fillRect(btWidth, 215, 320 - btWidth, 10, DARKGREY); //灰色の四角
	M5.Lcd.fillRect(0, 215, btWidth, 10, YELLOW); //マゼンダの四角


	//---------------------------------------------------------
	//PCにデータを送信する（USBで）
	//変数をコンマ区切りにして送る
	Serial.print(accX);
	Serial.print(",");
	Serial.print(accY);
	Serial.print(",");
	Serial.print(accZ);
	Serial.print(",");
	Serial.print(distance);
	Serial.println(); //最後は改行を送る


	//---------------------------------------------------------
	//PCにデータを送りすぎるので、繰り返す前に少し待つ
	delay(10);

}


/* End */
