Background bg;
Hero h;
Enemy[] e;

void setup() {
  size(600,600);
  smooth();
  bg = new Background(20,20);
  h = new Hero(277,277);
  e = new Enemy[1];
  for (int i = 0; i < e.length; i++) {
    e[i] = new Enemy((int)random(600), (int)random(600));
  }
}

void draw() {
  background(255);
  updateTheClasses();
  showEverything();
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


void keyPressed() {
  if(key == 'w') {
     h.charge();
  }
  if(key == 's') {
     h.retreat();
  }
}
