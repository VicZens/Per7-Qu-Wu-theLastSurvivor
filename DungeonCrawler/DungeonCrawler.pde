Player p;
Enemy e;

void setup() {
   size(500,500);
   smooth();
   p = new Player(250,250);
   e = new Enemy();
}

void draw() {
   background(255,255,255);
   e.update();
   e.show();
   e.checkEdges();
   
   p.update();
   p.show();
}

void keyPressed() {
  if(key == 'w') {
     p.charge();
  }
  if(key == 's') {
     p.retreat();
  } 
}


