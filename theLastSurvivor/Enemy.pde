public class Enemy extends Character {
  int currSteps, steps;
  float detRange;

  public Enemy(int x, int y) {
    currPlace = new PVector(x,y);
    dir = new PVector((int)random(2),(int)random(2));
    setNextPlace();
    
    prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
    nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    
    speed = 3;
    steps = 100;
    health = 1;
    detRange = 3;
  }
  
  public void update(Background bg, Hero h) {
    if (health > 0) {
     if (currSteps > steps) {
       dir = new PVector(dir.x*-1,dir.y*-1);
       currSteps = 0;
     }
    
     if (!nextCell.getHeroOn() & !nextCell.getEnemyOn()) {
       currPlace.add(dir);
       currSteps++;
     }
     checkForHero(h);
     checkEnemy(bg);
    } else {
      currCell.setEnemyOn(false);
    }
  }
  
  public void getHurt(int healthLost) {
    health = health - healthLost;
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
      fill(100,50,150);
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
    /*
    float theTan = atan2(dir.y, dir.x);
    if ((theTan > PI/6 & 2*PI/6 > theTan) || (theTan > 3*PI/6 & 5*PI/6 > theTan) || (theTan < -PI/6 & -2*PI/6 < theTan) || (theTan < -3*PI/6 & -5*PI/6 < theTan)) {
      nextPlace.add(dir.x * 35, dir.y * 35, 0);
    } else {
      
    }
    */
    nextPlace.add(dir.x * 35, dir.y * 35, 0);
    
  }
  //End
}
