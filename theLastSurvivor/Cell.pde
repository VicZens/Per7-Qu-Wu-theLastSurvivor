public class Cell {
  int x, y;
  float h, w;
  color c;
  
  boolean heroOn, heroNext;
  
  public Cell(int x, int y, float h, float w) {
   this.x = x;
   this.y = y;
   this.h = h;
   this.w = w;
   c = color(0);
  }
  
  public void show() {
   pushMatrix();
   stroke(0,0,255);
   fill(c);
   rectMode(CORNER);
   rect(x,y,h,w);
   popMatrix();
  }
  
  public void setHeroOn(boolean heroOn) {
    this.heroOn = heroOn;
    
    if (heroOn) {
      c = color(255,0,0);
    } else {
      c = color(0);
    }
  }
  
  public void setHeroNext(boolean heroNext) {
    this.heroNext = heroNext;
   
    if (heroNext) {
      c = color(0,255,0);
    } else {
      c = color(0);
    }
  }
  
  public int getX() {
    return x; 
  }
  public int getY() {
    return y; 
  }
  
  //End
}
