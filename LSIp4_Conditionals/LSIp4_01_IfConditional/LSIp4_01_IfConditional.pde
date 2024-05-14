float posX;
float diam = 200;
void setup() {
  size(800, 800);
  background(0, 0, 255);
  smooth();
  posX = width/2;
}

void draw() {
  noStroke();
  fill(255);
  ellipse(posX, height/2, diam, diam);
  posX = posX + 1;

  if ((posX-diam/2)>width) {
    posX = -diam/2;
  }
}
