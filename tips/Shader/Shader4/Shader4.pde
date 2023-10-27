// https://qiita.com/EKey2210/items/876c6b2772a7c78443c0
// https://qiita.com/koske1814/items/1a8f8d1307faf0757380
// https://qiita.com/mizumasa/items/887c4e85c688a2b0d5f1

PGraphics graphics;
PShader shader;


void setup () {
  
  size(512, 512, P3D);

  background(0);

  graphics = createGraphics(500, 500, P3D);
  shader = loadShader("./datas/fragment.frag");  // シェーダーファイルを読み込む
  shader.set("resolution", (float)graphics.width, (float)graphics.height );
  
}

void draw () {
  
  shader.set("mouse", (float)mouseX, (float)(height - mouseY) );
  shader.set("time", millis() / 1000.0 );
    
  background(0);


  graphics.beginDraw();
  graphics.clear();
  
    graphics.colorMode(HSB, 360, 100, 100, 100);
    graphics.shader(shader);
      
      //graphics.fill(0, 0, 0,  100);
      //graphics.fill(0, 0, 100,  100);
      graphics.noStroke();
      graphics.rectMode(CENTER);
      graphics.rect(graphics.width/2, graphics.height/2, graphics.width, graphics.height);
      
      graphics.fill(220, 100, 100, 100);
      graphics.stroke(120, 100, 100, 100);
      graphics.ellipseMode(CENTER);
      //graphics.ellipse(graphics.width/2, graphics.height/2, 100, 100);
    
    graphics.resetShader();
    
  graphics.endDraw();


  imageMode(CENTER);
  image(graphics, width/2, height/2);
  
}
