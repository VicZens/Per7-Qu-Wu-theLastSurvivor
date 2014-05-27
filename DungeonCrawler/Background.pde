public class Background {
  PImage bg;
  float x, y;
  float sizeX, sizeY;
  boolean detectedHero, detectedEnemy;
  boolean heroNext, enemyNext;
  
  public Background(float x, float y, float sizeX, float sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  
  public Background(float x, float y) {
    this.x = x;
    this.y = y;
    bg = loadImage("b.jpeg");
  }
  
  public void show() {
    /*
    noStroke();
    image(bg,x,y);
    */
    stroke(255);
    if (detectedHero) {
     fill(255,0,0);
    } else if (detectedEnemy) {
     fill(0,255,0);
    } else if (heroNext) {
     fill(0,0,255);
    } else { 
     fill(138,238,255);
    }
    rect(x,y,sizeX,sizeY);
  }
}
