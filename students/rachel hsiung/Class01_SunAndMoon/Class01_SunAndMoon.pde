void setup(){
  size(500,500);
  background(0);
  noStroke();
}

void draw(){
  // black background
  background(0);
  
  // white circle (moon)
  fill(255);
  ellipse(350,100,100,100);
  
  // yellow circle (sun)
  fill(255,255,0);
  ellipse(mouseX,mouseY,250,250);
}
