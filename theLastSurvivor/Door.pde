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
  
  public void show() {
    pushMatrix();
    image(img, x, y, 30, 30);
    popMatrix();
  }
  
 //End 
}
