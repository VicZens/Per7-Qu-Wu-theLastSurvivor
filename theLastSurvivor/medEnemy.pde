public class medEnemy extends Enemy {
  
  public medEnemy(int x, int y) {
    super(x,y);
    c = color(0,255,0);
    
    speed = 5;
    detRange = 5;
    health = 3;
    strength = 2;
    chance = 20;
    xpGive = 15;
  }
}
