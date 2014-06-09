public class Enemy extends Character {
  int currSteps, steps;
  float detRange;
  color c;

  public Enemy(int x, int y) {
    currPlace = new PVector(x,y);
    dir = new PVector((int)random(2),(int)random(2));
    setNextPlace();
    
    prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
    nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    
    health = 5;
    
    speed = 5;
    steps = 100;
    detRange = 5;
    
    c = color(0,0,255);
  }
  
  public void update(Background bg, Hero h) {
    if (health > 0) {
     if (currSteps > steps) {
       dir = new PVector(dir.x*-1,dir.y*-1);
       currSteps = 0;
     }
     
     if (nextCell.getNoZone()||nextCell.getEnemyOn()) {
       dir = new PVector(-dir.y, -dir.x); 
     }
    
     if (!nextCell.getHeroOn() & !nextCell.getEnemyOn() & !nextCell.getNoZone()) {
       currPlace.add(dir);
       currSteps++;
     }
     checkForHero(h);
     checkEnemy(bg);
     attack();
    } else {
      currCell.setEnemyOn(false);
    }
  }
  
  public void attack() {
    if (nextCell.getHeroOn() & ((int)random(100)<10)) {
       nextCell.getHero().getHurt(strength);
    }
  }
  
  public void checkForHero(Hero h) {
    PVector tempDir = dir;
    
    if (detRange > (sqrt(sq(h.getX()-currPlace.x) + sq(h.getY()-currPlace.y))/30)) {
      dir = PVector.add(h.getCurrPlace(), dir);
      dir.normalize();
      if (currPlace.x > h.getX()) {
        dir.x = dir.x * -1; 
      }
      if (currPlace.y > h.getY()) {
        dir.y = dir.y * -1; 
      }
    } else {
      dir = tempDir;
    } 
    
  }
  
  public void show() {
    if (health > 0) {
      ellipseMode(CORNER);
      fill(c);
      ellipse(currPlace.x, currPlace.y, 20,20);
    }
  }
  
  //Background Update
  private void checkEnemy(Background bg) {
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    setNextPlace();
    
    prevCell.setEnemyOn(false);
    currCell.setEnemy(this);
    
    checkEnemyOn(bg);
    checkEnemyNext(bg);  
  }
  
  private void checkEnemyOn(Background bg) { 
    if ((int)currPlace.x/30 == (int)prevCell.getX()/30 & (int)currPlace.y/30 == (int)prevCell.getY()/30) {
       currCell.setEnemyOn(true);
    } else {
       prevCell.setEnemyOn(false);
       prevCell = currCell;
    }
  }
  
  private void checkEnemyNext(Background bg) {
    if ((int)nextPlace.x/30 == (int)nextCell.getX()/30 & (int)nextPlace.y/30 == (int)nextCell.getY()/30) {
       nextCell.setEnemyNext(true);
    } else {
       nextCell.setEnemyNext(false);
       nextCell = currNextCell;
    }
  }
  
  private void setNextPlace() {
    nextPlace = PVector.add(currPlace, dir);
    nextPlace.add(dir.x * 35, dir.y * 35, 0);
    
  }
  //End
}
