Player p;
Background[][] b;
Enemy e;

void setup() {
  size(500,500);
  smooth();
  p = new Player(b);
  e = new Enemy(b);
  b = new Background[20][20];
  for(int h = 0; h < b.length; h++) {
    for(int w = 0; w < b.length; w++) {
       b[h][w] = new Background(h*25,w*25,25,25);
    }     
  } 
}

void draw() {
  background(255,255,255); 
  p.update();
  e.update();
  isOn();
  bgShow();
  if (p.getHealth()<=0) {
    p.setDead();
  } else {
    p.show();
  }
  if (e.getHealth()<=0) {
    e.setDead();
  } else {
    e.show(); 
  }
}

void keyPressed() {
  if(key == 'w') {
     p.charge();
  }
  if(key == 's') {
     p.retreat();
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if(b[p.getNextX()][p.getNextY()].detectedEnemy) {
      e.health = e.health - 1;
    }
  }
  println(e.health + " " + b[p.getNextX()][p.getNextY()].detectedEnemy);
  println(p.getNextX() + " " + p.getNextY());
  println(e.getX()/25 + " " + e.getY()/25);
}

void bgShow() {
  rectMode(CORNER);
  for(int h = 0; h < b.length; h++) {
    for(int w = 0; w < b.length; w++) {
       b[h][w].show();
    }     
  } 
}

void isOn() {
  for(int h = 0; h < b.length; h++) {
    for(int w = 0; w < b.length; w++) {
       if((p.getX()>((h)*25)) && (p.getX()<((h+1)*25)) && (p.getY()>((w)*25)) && (p.getY()<((w+1)*25))) {
         b[h][w].detectedHero = true; 
       } else {
         b[h][w].detectedHero = false; 
       }
       
       if((e.getX()>((h)*25)) && (e.getX()<((h+1)*25)) && (e.getY()>((w)*25)) && (e.getY()<((w+1)*25))) {
         b[h][w].detectedEnemy = true; 
       } else {
         b[h][w].detectedEnemy = false; 
       }
       
       if((p.getNext().x>((h)*25)) && (p.getNext().x<((h+1)*25)) && (p.getNext().y>((w)*25)) && (p.getNext().y<((w+1)*25))) {
         b[h][w].heroNext = true;
         p.setNext(h,w);
       } else {
         b[h][w].heroNext = false; 
       }
       
    }     
  } 
}



