public class hardEnemy extends Enemy {
  
  public hardEnemy(int x, int y) {
    super(x,y);
    c = color(255,0,0);
    
    speed = 7;
    detRange = 5;
    health = 5;
    strength = 3;
  }
}
