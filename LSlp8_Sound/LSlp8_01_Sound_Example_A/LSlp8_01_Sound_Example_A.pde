import ddf.minim.*;
Minim jose;
AudioPlayer player;

void setup(){
  jose = new Minim(this);
  player = jose.loadFile("lrz.mp3");
  fullScreen();
  background(0,0,255);
}

void draw(){
  float left = player.left.level();
  float mapLeft = map(left,0,0.24,10,width/2);
  float right = player.right.level();
  float mapRight = map(right,0,0.24,10,width/2);
  
  float colorLeft = map(left,0,0.24,128,100);
  float colorRight = map(right,0,0.24,56,200);
  float colorMono = map((left+right)/2,0,0.24,255,0);
  
  background(0,0,255);
  noStroke();
  fill(colorLeft,colorRight,colorMono);
  ellipse(width/4,height/2,mapLeft,mapLeft);
  fill(colorRight,colorMono,colorLeft);
  ellipse(3*width/4,height/2,mapRight,mapRight);
}


void keyPressed(){
  if(key=='q')player.play();
  if(key=='w')player.pause();
}
