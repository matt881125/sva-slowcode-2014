hello. is karen testing

int x = 10;
int dx = 1;

void setup() {
size (900, 900);

noStroke();
frameRate(60);
}

void draw () {

  background (0, 0, 0); //so animation does not leave trail
  
  fill (255, 100);
  ellipse (x, 100, 80, 80); 
  x = x+dx;
  
  if(x+40 > width) { //40 is the radius of the ellipse
     dx -= 1;
    
  }   
   
 
   
    fill (0, 255, 0, 100);
    rect(30, 20, 55, 55, 7);
    x = x+dx;
  

  if(x-40 < 0) {
     dx += 1;   
  } 
  
  
}
