void setup() {
  size(800, 800);
  background(0, 0, 255);
  smooth();
}

void draw() {
  background(0, 0, 255);
  stroke(255);
  for (float i=0; i<600; i++) {
    float xoff = i*0.001;
    float n = noise(xoff, frameCount*0.01);
    float noise = map(n, 0, 1, 0, height/2);
    float r = map(i, 0, 600, 255, 255);
    float g = map(i, 0, 600, 255, 0);
    float b = map(i, 0, 600, 255, 65);
    stroke(r, g, b);
    line(100+i, height/2, 100+i, height/2+noise);
    line(699-i, height/2, 699-i, height/2-noise);
  }
}
