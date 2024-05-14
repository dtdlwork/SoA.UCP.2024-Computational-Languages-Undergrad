void setup(){
  println("I'll be here first, and just once…");
  anotherFunction();
}

void draw(){
  println("I'll be here afterwards… and I'll never leave!");
}

void anotherFunction(){
  println("If you call this function, I'll jump right over here!"); 
}
