void setup() {
  size(500,500);
  background(10,33,100);
}

void draw() {

  // petals
  fill(204,0,102);
  
  ellipseMode(CORNER);
  ellipse(250,250, -mouseX, -mouseY);
  
  ellipseMode(CORNER);
  ellipse(250,250, mouseX, -mouseY);
  
  ellipseMode(CORNER);
  ellipse(250,250, mouseX, mouseY);
  
  ellipseMode(CORNER);
  ellipse(250,250, -mouseX, mouseY);
  
  // pistol
  fill(255,153, 51);
  ellipseMode(CENTER);
  ellipse(250, 250, 100, 100);
  
  
  if (mousePressed) {
    background(10,33,100);
  }
  
  
}
