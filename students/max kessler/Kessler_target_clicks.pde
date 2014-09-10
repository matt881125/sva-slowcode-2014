void setup() {

  size(700, 700);
  background(50); // this makes the background black
}
void draw() {

  if (mousePressed && (mouseButton == LEFT)) {
    stroke(0, 0, 255);
  fill(204, 102, 0);
  strokeWeight(10);
  ellipse(mouseX, mouseY, 100, 100);
  }
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(0, 300, 0);
  fill(200, 50, 0);
  strokeWeight(10);
  ellipse(mouseX, mouseY, 100, 100);
   
  stroke(0, 0, 255);
  noFill();
  strokeWeight(30);
  ellipse(mouseX, mouseY, 300, 300);
  
  }
}
