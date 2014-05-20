public class Player {
  PVector pos;
  PVector velocity;
  float x, y;
  
  public Player(float x, float y) {
     this.x = x;
     this.y = y;
     pos = new PVector(x,y);
  }
  
  public void draw() {
    fill(0,100,100);
    rectMode(CENTER);
    fill(0);
    translate(pos.x, pos.y);
    rotate(atan2(mouseY-pos.y, mouseX-pos.x));
    rect(0,0,10,20);
    ellipse(2,-5,10,10);
    ellipse(2,5,10,10); 
  }
  
  public void forward() {
    
  }
  
  
}


