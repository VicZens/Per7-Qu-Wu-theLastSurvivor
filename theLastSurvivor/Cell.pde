public class Cell {
  float x, y;
  float h, w;
  
  public Cell(float x, float y, float h, float w) {
   this.x = x;
   this.y = y;
   this.h = h;
   this.w = w;
  }
  
  public void show() {
   stroke(255);
   fill(0);
   rect(x,y,h,w);
  }
  
  //End
}
