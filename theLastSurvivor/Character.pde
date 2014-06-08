public class Character {
  PVector currPlace, nextPlace, dir;
  Cell currNextCell, nextCell, currCell, prevCell;
  int health, strength; 
  float speed;
  
  public void getHurt(int healthLost) {
    health = health - healthLost;
  } 
  
 //End
}
