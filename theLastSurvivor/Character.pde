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
    loadPixels();
    for (int i = 0; i < len; i++) {
      if (pixels[i] == 255)
        pixels[i] = back[0];    
    }
    updatePixels();
    return og;    
  }

  public void shapeShift(){
  
  }
  
 //End
}
