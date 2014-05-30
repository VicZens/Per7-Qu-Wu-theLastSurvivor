Background bg;
Hero h;

void setup() {
  size(600,600);
  smooth();
  bg = new Background(20,20);
  h = new Hero(bg);
}

void draw() {
  background(255);
  bg.show();
  h.update();
  h.show();
}

void keyPressed() {
  if(key == 'w') {
     h.charge();
  }
  if(key == 's') {
     h.retreat();
  }
}
