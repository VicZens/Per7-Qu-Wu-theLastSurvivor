public class Player {
  float x, y;
  
  public Player(float x, float y) {
     this.x = x;
     this.y = y; 
  }
  
  public void draw() {
    fill(0,100,100);
    rect(this.x,this.y,20,10);
    ellipse(this.x,this.y-3,10,10);
    ellipse(this.x+20,this.y-3,10,10);
  }

  public void goUp() {
    y = y - 5;
  }
  public void goDown() {
    y = y + 5;
  }
  public void goLeft() {
    x = x - 5;
  }
  public void goRight() {
    x = x + 5;
  }
  
  public void goUpRight() {
    goUp();
    goRight();
  } 
  public void goUpLeft() {
    goUp();
    goLeft(); 
  }
  public void goDownRight() {
    goDown();
    goRight(); 
  }
  public void goDownLeft() {
    goDown();
    goLeft(); 
  }
}


