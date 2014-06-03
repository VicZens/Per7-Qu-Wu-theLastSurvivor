public class Enemy extends Character {
  int currSteps, steps;
  float detRange;

  public Enemy() {
    currPlace = new PVector(215,215);
    dir = new PVector(1,0);
    setNextPlace();
    
    prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
    nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    
    speed = 3;
    steps = 300;
    detRange = 100;
  }
  
  public void update(Background bg, Hero h) {
     if (currSteps > steps) {
       dir = new PVector(dir.x*-1,0);
       currSteps = 0;
     }
     
     checkForHero(h);
     currPlace.add(dir);
     currSteps++;
     checkEnemy(bg);
  }
  
  public void checkForHero(Hero h) {
    if (detRange > (sqrt(sq(h.getX()-currPlace.x) + sq(h.getY()-currPlace.y))/30)) {
      dir = PVector.add(h.getCurrPlace(), dir);
      dir.normalize();
      if (currPlace.x > h.getX()) {
        dir.x = dir.x * -1; 
      }
      if (currPlace.y > h.getY()) {
        dir.y = dir.y * -1; 
      }
    }
    println(dir.x +" "+ h.getX());
  }
  
  public void show() {
    ellipseMode(CORNER);
    fill(100,50,150);
    ellipse(currPlace.x, currPlace.y, 20,20);
  }
  
  //Background Update
  private void checkEnemy(Background bg) {
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    setNextPlace();
    
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
    nextPlace.add(dir.x * 31, dir.y * 31, 0);
  }
  //End
}
