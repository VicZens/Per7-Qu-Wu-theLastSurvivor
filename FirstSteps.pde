Player p;

void setup() {
   size(500,500);
   background(255);
   p = new Player(0,0);
}

void draw() {
   background(255);
   p.draw();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
      p.goUp();
    } else if (key == 'e' || key == 'E') {
      p.goUpRight();
    } else if (key == 'd' || key == 'D') {
      p.goRight();
    } else if (key == 'c' || key == 'C') {
      p.goDownRight();
    } else if (key == 'x' || key == 'X') {
      p.goDown();
    } else if (key == 'z' || key == 'Z') {
      p.goDownLeft();
    } else if (key == 'a' || key == 'A') {
      p.goLeft();
    } else if (key == 'q' || key == 'Q') {
      p.goUpLeft();
    }
}  
