void setup() {
  size(800, 800);
  background(0, 0, 255);
  smooth();
}

void draw() {
  stroke(255);
  line(0, 0, mouseX, mouseY);
}
