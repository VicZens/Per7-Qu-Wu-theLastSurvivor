public class Cell {
  int x, y;
  float h, w;
  color c, origColor;
  Enemy enemy;
  Hero hero;
  
  boolean rColorHelper;
  boolean heroOn, heroNext;
  boolean enemyOn, enemyNext;
  boolean noZone;
  
  public Cell(int x, int y, float h, float w) {
   this.x = x;
   this.y = y;
   this.h = h;
   this.w = w;

   c = color(0);

   if ( (x/20) == 0 || (x/20) == 28 || (y/20) == 0 || (y/20) == 28) {
     c = color(255,255,0);
     noZone = true;
   }
   
   origColor = c;
  }
  
  public void show() {
   pushMatrix();
   fill(c);
   rectMode(CORNER);
   rect(x,y,h,w);
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
