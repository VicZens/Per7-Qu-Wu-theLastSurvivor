public class Door extends Cell {
  boolean newPlace;
  PImage img;
  
  public Door(int x, int y, float h, float w, boolean door, boolean left) {
    super(x,y,h,w, door);
    newPlace = false;
    isDoor = true;
    if (left) {
       img = loadImage("doorLeft.jpg");
    } else {
       img = loadImage("doorRight.jpg");
    } 
  }
  
  public Door(int x, int y, float h, float w) {
    super(x,y,h,w);
    newPlace = false;
    isStair = true;
    if (random(2)<1) {
      img = loadImage("stairsLeft.jpg");
    } else {
      img = loadImage("stairsRight.jpg");
    }
  }
  
  public void show() {
    pushMatrix();
    if (isStair) {
      image(img, x, y, 30, 30);
    } else {
      stroke(0);
      image(img, x, y, 30, 30);
    }
    popMatrix();
  }
  
 //End 
}
