public class Player {
  PVector pos;
  PVector mouse;
  float x, y;
  float dx, dy;
  
  public Player(float x, float y) {
     pos = new PVector(x,y);
  }
  
  public void draw() {
    mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,pos);
    dir.normalize();
    dx = dir.x;
    dy = dir.y;
    fill(0,100,100);
    rectMode(CENTER);
    translate(pos.x+dx, pos.y+dy);
    rotate(atan2(mouseY-pos.y, mouseX-pos.x));
    rect(x,y,10,20);
  }
  
  public void forward() {
    x = x+dx;
    y = y+dy;
  }
  public void back() {
    x = x-dx;
    y = y-dy;
  }
  
  
}


