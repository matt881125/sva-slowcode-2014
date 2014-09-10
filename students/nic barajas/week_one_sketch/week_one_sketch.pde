PFont helvetica;
boolean ready = false;

void setup(){
  size(600,600);
  background(255);
  ellipseMode(CENTER);
  noLoop();
  helvetica = createFont("HelveticaNeue-Light", 54);
  textFont(helvetica);
  textAlign(LEFT);
  fill(51);
  text("Hello, world.", 100, 100, 400, 400);
}

void draw(){
  
  // Woo.
  if (ready == true) {
    stroke(0);
    strokeWeight(6);
    fill(255,255,0);
    ellipse(mouseX, mouseY, 133, 133);
    noStroke();
    fill(0,0,0);
    ellipse((mouseX - 30), (mouseY - 15), 10, 17);
    ellipse((mouseX + 30), (mouseY - 15), 10, 17);
    noFill();
    stroke(0);
    strokeWeight(6);
    arc(mouseX, (mouseY + 20), 64, 32, 0, PI);
  } 
}

void mousePressed(){
  ready = true;
  background(255);
  loop();
}

void mouseReleased(){
  noLoop();
}
