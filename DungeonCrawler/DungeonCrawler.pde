Player p;
Enemy e;

void setup() {
   size(500,500);
   smooth();
   p = new Player();
   e = new Enemy();
}

void draw() {
   background(255,255,255);   
   p.update();
   e.update();
   e.checkEdges();
   p.show();
   e.show();
}

void keyPressed() {
  if(key == 'w') {
     p.charge();
  }
  if(key == 's') {
     p.retreat();
  } 
}


