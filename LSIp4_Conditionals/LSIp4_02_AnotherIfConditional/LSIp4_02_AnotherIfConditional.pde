float posX;
float diam = 200;
void setup() {
  size(800, 800);
  background(0, 0, 255);
  smooth();
  posX = width/2;
}

void draw() {
  background(0, 0, 255);
  noStroke();
  fill(255);

  if (mousePressed) {
    fill(255, 0, 65);
  }
  
  ellipse(posX, height/2, diam, diam);
  posX = posX + 5;

  if ((posX-diam/2)>width) {
    posX = -diam/2;
  }
}
