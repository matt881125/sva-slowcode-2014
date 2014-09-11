

void setup(){
  size(900,900);
  background(255);
  ellipseMode(CENTER);
  noStroke();
  frameRate(100);
}

void draw(){
  mouseTargetLogo();
}

void mouseTargetLogo(){
  background(255);
  
  fill(200);
  rect(0,0,mouseX,mouseY);
  rect(mouseX,mouseY,width-mouseX,height-mouseY);
  
  fill(255,0,0);
  ellipse(mouseX,mouseY,300,300);
  
  fill(255);
  ellipse(mouseX,mouseY,200,200);
  
  fill(255,0,0);
  ellipse(mouseX,mouseY,100,100);
  
  
}
