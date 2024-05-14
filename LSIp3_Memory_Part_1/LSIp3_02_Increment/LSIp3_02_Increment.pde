float posX = 0;

void setup() {
  size(800, 800);
  background(0, 0, 255);
  smooth();
}

void draw(){
  noFill();
  stroke(255);
  ellipse(posX,height/2,200,200);
  posX = posX + 4;
}
