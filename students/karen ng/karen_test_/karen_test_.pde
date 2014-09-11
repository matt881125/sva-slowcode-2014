//Karen Ng
//

int x = 10;
int dx = 2;
int y = 5;
int dy = 5;

void setup() {
size (900, 900);
noStroke();
}

void draw () {
  
  frameRate(25);
  background (255, 255, 255); //so animation does not leave trail
  
  fill (97, 54, 84, 150); //circle's fill
  ellipse (x+40, y+100, 140, 140); //ellipse size
 
  x = x+dx;
  y = y+dy;
  
  if(x+80 > width) { //so it doesn't bounce off R-side of screen
     dx -= 1; 
  }   
  
  if(x-80 < 0) { //so it doesn't bounce off L-side of screen
     dx += 1;   
  } 
  
   if(y+80 > height) { //so it doesn't bounce off R-side of screen
     dy -= 1; 
  }   
  
  if(y-10 < 0) { //so it doesn't bounce off L-side of screen
     dy += 1;   
  } 
  
  if (mousePressed && (mouseButton == LEFT)) {
    clear();
    noStroke();
    frameRate (14);
    background (255, 255, 255);
    
    fill (249, 212, 222, 60);
    ellipse (random(width), y+20, 20, 20);
    
    fill (249, 212, 222, 100);
    ellipse (random(width), y+20, 20, 20);
    y = y+dy; //second ellipse goes down the screen
   
    fill (249, 212, 222, 150);
    ellipse (random(width), y+60, 40, 40);
    y = y+dy; //second ellipse goes down the screen
    
    fill (253, 144, 177, 150);
    ellipse (random(width), y+80, 40, 40);
    y = y+dy; //second ellipse goes down the screen
    
    fill (255, 255, 255, 150);
    ellipse (random(width), y+100, 50, 80);
    y = y+dy; //second ellipse goes down the screen
    
    if(y+80 > height) { //so it doesn't bounce off R-side of screen
     dy -= 1; 
    }   
  
    if(y-80 < 0) { //so it doesn't bounce off L-side of screen
     dy += 1;   
  } 
  }
  
}

   
  

