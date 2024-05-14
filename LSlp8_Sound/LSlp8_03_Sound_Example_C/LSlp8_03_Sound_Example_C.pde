import ddf.minim.*;
Minim jose;
AudioPlayer player;
PShader blur;
float ratio = 0.02;
float a1 = PI;
float a2 = 0;

float h1 = 0;
float h2 = 0;

float l1 = 0;
float l2 = 0;


void setup() {
  jose = new Minim(this);
  player = jose.loadFile("opn.mp3");
  fullScreen(P2D);
  background(0, 0, 255);
  blur = loadShader("blur.glsl"); 
  player.play();
}

void draw() {
  colorMode(RGB);
  noStroke();
  fill(0, 0, 255, 10);
  rect(0, 0, width, height);
  for (int x=0; x<=width; x+=64) {
    for (int y=0; y<=width; y+=32) {
      object(x, y);
    }
  }

  filter(blur);
}

void object(float x, float y) {

  float left = player.left.level();
  float mapLeft = map(left, 0, 0.35, PI, 0);
  float mapHueLeft = map(left, 0, 0.35, 0, 255);
  float mapLenLeft = map(left, 0, 0.35, 0, 100);

  a1 = ease(a1, mapLeft, ratio);
  h1 = ease(h2, mapHueLeft, ratio);
  l1 = ease(l2, mapLenLeft, ratio);

  float right = player.right.level();
  float mapRight = map(right, 0, 0.35, 0, -PI);
  float mapHueRight = map(right, 0, 0.35, 0, 255);
  float mapLenRight = map(right, 0, 0.35, 0, 100);

  a2 = ease(a2, mapRight, ratio);
  h2 = ease(h2, mapHueRight, ratio);
  l2 = ease(l2, mapLenRight, ratio);

  colorMode(HSB);
  strokeWeight(5);
  strokeCap(ROUND);

  float laX = x;
  float laY = y;
  float lbX = laX + cos(radians(frameCount+x)+a1)*l1;
  float lbY = laY + sin(radians(frameCount+y)+a1)*l1;
  stroke(h1, 255, 255);
  line(laX, laY, lbX, lbY);

  float raX = laX;
  float raY = laY;
  float rbX = raX + cos(radians(frameCount+x)+a2)*l2;
  float rbY = raY + sin(radians(frameCount+y)+a2)*l2;
  stroke(h2, 255, 255);
  line(raX, raY, rbX, rbY);
}



float ease (float actual, float target, float ratio) {
  float increment = target - actual;
  actual+= increment * ratio;
  return actual;
}
