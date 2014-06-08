public class Door extends Cell {
  boolean newPlace;
  
  public Door(int x, int y, float h, float w, boolean door) {
    super(x,y,h,w, door);
    newPlace = false;
    isDoor = true;
  }
  
  public void show() {
    pushMatrix();
    rectMode(CORNER);
    fill(0);
    rect(x,y,h,w);
    popMatrix();
  }
  
  
 //End 
}
