import java.util.*;

Background bg;
Hero h;
Enemy[] e;
Visuals v;
int level;
LinkedList<Enemy> extraEnemies;

void setup() {
  size(600,600);
  level = 1;
  smooth();
  bg = new Background(20,20);
  h = new Hero(277,277);
  e = new Enemy[3];
  v = new Visuals();
  extraEnemies = new LinkedList<Enemy>();
  for(int i = 0; i < 5; i++) {
    extraEnemies.add(new Enemy((int)random(500)+50, (int)random(500)+50));
  }
  for (int i = 0; i < e.length; i++) {
    e[i] = new Enemy((int)random(500)+50, (int)random(500)+50);
  }
}

void draw() {
  if (h.getHealth()>0) {
    background(255);
    updateTheClasses();
    showEverything();
  } else {
    v.endScreen();
  }//Better do something after this cuz it just crashes
}

void updateTheClasses() {
  h.update(bg);
  for (int i = 0; i < e.length; i++) {
    e[i].update(bg, h);
  }
  v.update(bg, h, e);
  addDifficulty();
}

void showEverything() {
  bg.show();
  h.show();
  for (int i = 0; i < e.length; i++) {
    e[i].show();
  }
  v.show();
}

void renewLevel() {
  bg = new Background(20,20);
  h.getNextCell().setIsDoor(false);
  
  e = new Enemy[level*3];
  for (int i = 0; i < e.length; i++) {
    if (level == 1) {
      e[i] = new weakEnemy((int)random(500)+50, (int)random(500)+50);
    } else if (level == 2) {
      if (random(2)<1) {
        e[i] = new weakEnemy((int)random(500)+50, (int)random(500)+50);
      } else {
        e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
      }
    } else if (level == 3) {
      e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
    } else if (level == 4) {
      if (random(2)<1) {
        e[i] = new hardEnemy((int)random(500)+50, (int)random(500)+50);
      } else {
        e[i] = new medEnemy((int)random(500)+50, (int)random(500)+50);
      }
    } else {
      e[i] = new hardEnemy((int)random(500)+50, (int)random(500)+50);
    }
  }
  if(random(100)<1) {
    e[e.length-1] = extraEnemies.peek(); 
    e[e.length-1].setColor(0);
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
    if (h.getCurrCell().getIsStairs()) {
       check(); 
    }
  }
}

void addDifficulty() {
  if (random(1000)<10) {
    for(Enemy enemies : e) {
      extraEnemies.add(enemies); 
    }
  }
  extraEnemies.get((int)random(4)).addHealth((int)random(5)+2);
}

void check() {
  if (h.getX()/30 == bg.getStairs().getX()/30 & h.getY()/30 == bg.getStairs().getY()/30) {
    level++;
    renewLevel();
  }
}

