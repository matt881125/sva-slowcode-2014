int value = 240;

void setup() {
  
  size(500, 500);
  background(255);
  
} 

void draw() {
  background(255);
  
  for (int i = 0; i <= 500; i = i+10) {
  fill(240);
  noStroke();
  rectMode(CORNERS);
  rect(0, i, 500, i+3);
  }
  //bg stripe

  for (int i = 20; i <= 400; i = i+80) {
  stroke(value);
  strokeWeight(10);
  noFill();
  ellipse(250, 250, i, i);
  }
  //circle1
  
    for (int i = 60; i <= 400; i = i+80) {
  stroke(value - 40);
  strokeWeight(10);
  noFill();
  ellipse(250, 250, i, i);
  }
  //circle2
  
}


void mouseClicked() {
  if (value == 240) {
    value = 80;
  } else {
    value = value + 40;
  }
}
