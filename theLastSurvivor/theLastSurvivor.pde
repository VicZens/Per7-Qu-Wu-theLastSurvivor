Background bg;
Hero h;
Enemy[] e;

void setup() {
  size(600,600);
  smooth();
  bg = new Background(20,20);
  h = new Hero(277,277);
  e = new Enemy[5];
  for (int i = 0; i < e.length; i++) {
    e[i] = new Enemy((int)random(500)+50, (int)random(500)+50);
  }
}

void draw() {
  if (h.getHealth()>0) {
    background(255);
    updateTheClasses();
    showEverything();
  } //Better do something after this cuz it just crashes
}

void updateTheClasses() {
  h.update(bg);

  for (int i = 0; i < e.length; i++) {
    e[i].update(bg, h);
  }
}

void showEverything() {
  bg.show();
  h.show();
  for (int i = 0; i < e.length; i++) {
    e[i].show();
  }
}

void renewLevel() {
  bg = new Background(20,20);
  h.getNextCell().setIsDoor(false);
  for (int i = 0; i < e.length; i++) {
    if (bg.getLevel() == 1) {
      e[i] = new weakEnemy((int)random(500)+50, (int)random(500)+50);
    } else if (bg.getLevel() == 2) {
      if (random(2)<1) {
        e[i] = new weakEnemy((int)random(500)+50, (int)random(500)+50);
      } else {
        e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
      }
    } else if (bg.getLevel() == 3) {
      e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
    } else if (bg.getLevel() == 4) {
      if (random(2)<1) {
        e[i] = new hardEnemy((int)random(500)+50, (int)random(500)+50);
      } else {
        e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
      }
    } else {
      e[i] = new hardEnemy((int)random(500)+50, (int)random(500)+50);
    }
  }
}

void keyPressed() {
  if(key == 'w') {
     h.charge();
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    h.swing();
  }
  if(mouseButton == RIGHT) {
    if (h.getNextCell().getIsDoor()) {
      renewLevel();
    }
    check(); 
  }
}

void check() {
  if (h.getX()/30 == bg.getStairs().getX()/30 & h.getY()/30 == bg.getStairs().getY()/30) {
    bg.incLevel();
    renewLevel();
  }
}

