public class Character {
  PVector currPlace, nextPlace, dir;
  Cell currNextCell, nextCell, currCell, prevCell;
  int health, strength; 
  float speed;
  PImage currShape, _up, _down, _left, _right;
  PImage back = loadImage("grass.jpg");

  
  public void getHurt(int healthLost) {
    health = health - healthLost;
  } 
  
  public PImage fixed(PImage og, int x, int y) {
    int len = x*y;
    og.loadPixels();
    back.loadPixels();
    for (int r = 0; r < x; r++) {
      boolean edgeReached = false;
      for (int c = 0; c < y; c++) { 
        if (og.pixels[x*r+c] > -66000)
          og.pixels[x*r+c] = back.pixels[0];
        else
          edgeReached = true;
      }    
    }
    updatePixels();
    return og;    
  }

  public void shapeShift(){
  
  }
  
 //End
}
