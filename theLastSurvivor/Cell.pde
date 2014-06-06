public class Cell {
  int x, y;
  float h, w;
  color c;
  Enemy enemy;
  Hero hero;
  
  boolean heroOn, heroNext;
  boolean enemyOn, enemyNext;
  boolean hasHero, hasEnemy;
  
  public Cell(int x, int y, float h, float w) {
   this.x = x;
   this.y = y;
   this.h = h;
   this.w = w;
   c = color(0);
  }
  
  public void show() {
   pushMatrix();
   stroke(0,0,255);
   fill(c);
   rectMode(CORNER);
   rect(x,y,h,w);
   popMatrix();
  }
  
  public void setHeroOn(boolean heroOn) {
    this.heroOn = heroOn;
    
    if (heroOn) {
      c = color(255,0,0);
    } else {
      c = color(0);
    }
  }
  
  public void setHeroNext(boolean heroNext) {
    this.heroNext = heroNext;
   
    if (heroNext) {
      c = color(0,255,0);
    } else {
      c = color(0);
    }
  }
  
  public void setEnemyOn(boolean enemyOn) {
    this.enemyOn = enemyOn;
    
    if (enemyOn) {
      c = color(255,0,255);
    } else {
      c = color(0);
    }
  }
  
  public void setEnemyNext(boolean enemyNext) {
    this.enemyNext = enemyNext;
   
    if (enemyNext) {
      c = color(255,255,0);
    } else {
      c = color(0);
    }
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
    hasHero = true;
  }
  public void setEnemy(Enemy e) {
    this.enemy = e;
    hasEnemy = true;
  }
  public Hero getHero() {
    return hero; 
  }
  public Enemy getEnemy() {
    return enemy; 
  }
  public void removeHero() {
    hasHero = false; 
  }
  public void removeEnemy() {
    hasEnemy = false; 
  }
  public boolean hasHero() {
    return hasHero; 
  }
  public boolean hasEnemy() {
    return hasEnemy; 
  }
  
  
  //End
}
