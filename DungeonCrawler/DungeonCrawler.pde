Player p;
Background[][] b;
Enemy e;

void setup() {
  size(500,500);
  smooth();
  p = new Player();
  e = new Enemy();
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
  //e.update();
  isOn();
  bgShow();
  if (p.getHealth()>0)
    p.show();
  if (e.getHealth()>0)
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
         b[h][w].detected = true; 
       } else {
         b[h][w].detected = false; 
       }
    }     
  } 
}



