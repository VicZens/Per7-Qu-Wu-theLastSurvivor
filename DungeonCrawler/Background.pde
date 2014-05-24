public class Background {
  float x, y;
  float sizeX, sizeY;
  
  public Background(float x, float y, float sizeX, float sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  
  public void show() {
    stroke(255);
    fill(138,238,255);
    rect(x,y,sizeX,sizeY);
  }
  
}
