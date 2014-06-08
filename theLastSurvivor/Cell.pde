public class Cell {
  int x, y;
  float h, w;
  Enemy enemy;
  Hero hero;
  PImage background;
  
  boolean rColorHelper;
  boolean heroOn, heroNext;
  boolean enemyOn, enemyNext;
  boolean noZone;
  
  public Cell(int x, int y, float h, float w) {
   this.x = x;
   this.y = y;
   this.h = h;
   this.w = w;

   background = loadImage("grass.jpeg");

   if ( (x/20) == 0 || (x/20) == 28 || (y/20) == 0 || (y/20) == 28) {
     background = loadImage("wall.jpeg");
     noZone = true;
   }
  }
  
  public void show() {
   pushMatrix();
   image(background, x, y, 30, 30);
   popMatrix();
  }
  
  public void setHeroOn(boolean heroOn) {
    this.heroOn = heroOn;
  }
  
  public void setHeroNext(boolean heroNext) {
    this.heroNext = heroNext;
  }
  
  public void setEnemyOn(boolean enemyOn) {
    this.enemyOn = enemyOn;
  }
  
  public void setEnemyNext(boolean enemyNext) {
    this.enemyNext = enemyNext;
  }
  
  public int getX() {
    return x; 
  }
  public int getY() {
    return y; 
  }
  
  public boolean getHeroOn() {
    return heroOn;
  }
  public boolean getEnemyOn() {
    return enemyOn; 
  }
  
  public void setHero(Hero h) {
    this.hero = h;
  }
  public void setEnemy(Enemy e) {
    this.enemy = e;
  }
  public Hero getHero() {
    return hero; 
  }
  public Enemy getEnemy() {
    return enemy; 
  }
  
  public boolean getNoZone() {
    return noZone; 
  }
  
  
  //End
}
