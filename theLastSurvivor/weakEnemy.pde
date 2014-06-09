public class weakEnemy extends Enemy {
   
  public weakEnemy(int x, int y) {
    super(x,y);
    
    speed = 3;
    detRange = 5;
    health = 2;
    strength = 1;
    chance = 10;
    xpGive = 10;
  }
}
