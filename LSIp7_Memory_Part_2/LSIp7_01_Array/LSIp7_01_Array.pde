String[] planetNames = {"Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto"};
float[] planetDists = {3.5, 6.7, 9.3, 14.2, 48.4, 88.9, 179, 288, 367};
float[] planetRads = {2.440, 6.052, 6.371, 3.390, 69.911, 58.232, 25.362, 24.622, 1.188};
float[] planetSpeeds = {47.9, 35.0, 29.8, 24.1, 13.1, 9.7, 6.8, 5.4, 4.74};
float[] planetPos = {0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  fullScreen();
  background(0, 0, 255);
  smooth(64);
}

void draw() {
  background(0, 0, 255);
  for (int i=0; i<planetNames.length; i++) {
    float a = radians(planetPos[i]);
    planetPos[i]+=(planetSpeeds[i]*0.1);
    float d = planetDists[i]*1.8;
    float px = width/2+cos(a)*d;
    float py = height/2+sin(a)*d;
    float sz = planetRads[i]*1.5;
    noFill();
    strokeWeight(1);
    stroke(255);
    ellipse(width/2, height/2, d*2, d*2);
    strokeWeight(3);
    stroke(255, 0, 65);
    ellipse(px, py, sz*3, sz*3);
    line(px+(sz*1.5), py, width-100, py);
    text(planetNames[i], width-75, py);
    noStroke();
    fill(255);
    ellipse(px, py, sz, sz);
  }
}
