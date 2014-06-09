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
  
  public PImage fixed(PImage og) {
    og.loadPixels();
    back.loadPixels();
    for (int r = 0; r < 50; r++) {
      boolean edgeReached = false;
      for (int c = 0; c < 50; c++) { 
        if (og.pixels[50*r+c] > -66000)
          og.pixels[50*r+c] = back.pixels[0];
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
