float posX, posY;
float len = 100;
float Xdir = 1;
float Ydir = 1;

void setup() {
  size(800, 800, P2D);
  background(0, 0, 255);
  smooth();
  posX = random(width);
  posY = random(height);
}

void draw() {

  colorMode(HSB);
  stroke(frameCount%255, 255, 255);
  line(posX, posY, posX+len, posY);
  posX = posX + Xdir;
  posY = posY + Ydir;


  if ((posX+len)>width || posX<0) {
    Xdir = Xdir * -1;
  }

  if (posY>height || posY<0) {
    Ydir = Ydir * -1;
  }
}
