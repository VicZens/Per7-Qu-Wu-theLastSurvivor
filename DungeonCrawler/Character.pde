public class Character {
  Background[][] b;
  PVector nextPlace;
  int nextX, nextY;
  float health;
  float strength, agility;  //Strength determines how much damage is done.
                            //Agility determines how quickly you can move.
                           
  public PVector getNext() {
    return nextPlace;
  }
  public void setNext (int x, int y) {
    nextX = x;
    nextY = y;
  }
  public int getNextX() {
    return nextX; 
  }
  public int getNextY() {
    return nextY;
  }
  
}
