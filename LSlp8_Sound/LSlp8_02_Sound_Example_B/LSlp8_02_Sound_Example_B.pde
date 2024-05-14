import ddf.minim.*;
Minim jose;
AudioPlayer player;
PShader blur;
float ratio = 0.01;
float a1 = PI;
float a2 = 0;

float h1 = 0;
float h2 = 0;

float l1 = 0;
float l2 = 0;


void setup() {
  jose = new Minim(this);
  player = jose.loadFile("atx.mp3");
  fullScreen(P2D);
  background(0, 0, 255);
  blur = loadShader("blur.glsl"); 
  player.play();
}

void draw() {

  float left = player.left.level();
  float mapLeft = map(left, 0, 0.35, PI, 0);
  float mapHueLeft = map(left, 0, 0.35, 0, 255);
  float mapLenLeft = map(left, 0, 0.35, 0, width/2);
  a1 = ease(a1, mapLeft, ratio);
  h1 = ease(h2,mapHueLeft, ratio);
  l1 = ease(l2,mapLenLeft, ratio);

  float right = player.right.level();
  float mapRight = map(right, 0, 0.35, 0, -PI);
  float mapHueRight = map(right, 0, 0.35, 0, 255);
  float mapLenRight = map(right, 0, 0.35, 0, width/2);
  a2 = ease(a2, mapRight, ratio);
  h2 = ease(h2,mapHueRight, ratio);
  l2 = ease(l2,mapLenRight, ratio);

  colorMode(RGB);
  noStroke();
  
  fill(0, 0, 255, 1);
  rect(0, 0, width, height);

  colorMode(HSB);
  strokeWeight(10);
  strokeCap(ROUND);
  
  float laX = width/2;
  float laY = height/2;
  float lbX = laX + cos(radians(frameCount)+a1)*l1;
  float lbY = laY + sin(radians(frameCount)+a1)*l1;
  stroke(h1,255,255);
  line(laX, laY, lbX, lbY);

  float raX = width/2;
  float raY = height/2;
  float rbX = raX + cos(radians(frameCount)+a2)*l2;
  float rbY = raY + sin(radians(frameCount)+a2)*l2;
  stroke(h2,255,255);
  line(raX, raY, rbX, rbY);
  
  filter(blur);
}





float ease (float actual, float target, float ratio) {
  float increment = target - actual;
  actual+= increment * ratio;
  return actual;
}
