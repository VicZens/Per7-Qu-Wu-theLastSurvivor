Player p;
Enemy e;

void setup() {
   size(500,500);
   smooth();
   p = new Player(250,250);
   e = new Enemy(200);
}

void draw() {
   background(255,255,255);
   p.update();
   p.show();
   e.update();
   e.show();
   e.checkEdges();
}

void keyPressed() {
  if(key == 'w') {
     p.charge();
  }
  if(key == 's') {
     p.retreat();
  } 
}


