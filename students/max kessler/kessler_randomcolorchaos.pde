void setup() {

  size(700, 700);
  background(255); // this makes the background black
}
void draw() {
  
    stroke(random(255),random(255),random(255)); 
  strokeWeight(10);
  
  line(350, 350, random(650), random(700) );

  if (mousePressed && (mouseButton == LEFT)) {
    stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255)); 
  strokeWeight(70);
  ellipse(mouseX, mouseY, 500, 500);

  
  }
}
