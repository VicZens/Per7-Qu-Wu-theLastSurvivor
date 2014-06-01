Background bg;
Hero h;
Enemy e;

void setup() {
  size(600,600);
  smooth();
  bg = new Background(20,20);
  h = new Hero();
  e = new Enemy();
}

void draw() {
  background(255);
  bg.show();
  h.update(bg);
  e.update(bg);
  h.show();
  e.show();
}

void keyPressed() {
  if(key == 'w') {
     h.charge();
  }
  if(key == 's') {
     h.retreat();
  }
}
