public class weakEnemy extends Enemy {
   
  public weakEnemy(int x, int y) {
    super(x,y);
    c = color(0,0,255);
    
    speed = 3;
    detRange = 5;
    health = 2;
    strength = 1;
    chance = 10;
  }
}
