Player p;

void setup() {
   size(500,500);
   background(255);
   smooth();
   p = new Player(250,250);
}

void draw() {
   background(255);
   p.draw();
}

void keyPressed() {
  if(key == 'w' || key == 'W') {
     p.forward();
  }
  if(key == 's' || key == 'S') {
     p.back();
  } 
}


