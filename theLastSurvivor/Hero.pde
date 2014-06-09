public class Hero extends Character {
  PVector mouse;
  
  public Hero(int x, int y) {
   currPlace = new PVector(x,y);
   mouse = new PVector(mouseX,mouseY);
   dir = PVector.sub(mouse,currPlace);
   dir.normalize();
   dir.mult(speed);
   setNextPlace();

   prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
   nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
   currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);

   speed = 4;
   health = 1;
   strength = 1;
  }
  
  public void update(Background bg) {
      mouse = new PVector(mouseX,mouseY);
      dir = PVector.sub(mouse,currPlace);
      dir.normalize();
      checkHero(bg);
      dir.mult(speed);
  }
  
  public void show() {
    pushMatrix();
    noStroke();
    fill(255);
    translate(currPlace.x,currPlace.y);
    rotate(atan(dir.y/dir.x));
    rectMode(CENTER);
    rect(0,0, 30,20);
    popMatrix();
  }
  
  public void swing() {
    if (nextCell.getEnemyOn()) {
      nextCell.getEnemy().getHurt(strength); 
    }
  }
  
  //Moving
  public void charge() {
    if (!nextCell.getEnemyOn() & !nextCell.getNoZone()) {
      currPlace.x = currPlace.x + dir.x;
      currPlace.y = currPlace.y + dir.y;
    }
  }

  //Background Update
  private void checkHero(Background bg) {
    currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
    currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
    setNextPlace();
    
    checkHeroOn(bg);
    checkHeroNext(bg);
  }
  
  private void checkHeroOn(Background bg) { 
    if ((int)currPlace.x/30 == (int)prevCell.getX()/30 & (int)currPlace.y/30 == (int)prevCell.getY()/30) {
       currCell.setHeroOn(true);
    } else {
       prevCell.setHeroOn(false);
       prevCell = currCell;
    }
  }
  
  private void checkHeroNext(Background bg) {
    if ((int)nextPlace.x/30 == (int)nextCell.getX()/30 & (int)nextPlace.y/30 == (int)nextCell.getY()/30) {
       nextCell.setHeroNext(true);
    } else {
       nextCell.setHeroNext(false);
       nextCell = currNextCell;
    }
  }
  
  private void setNextPlace() {
    nextPlace = PVector.add(currPlace, dir);
    nextPlace.add(dir.x * 31, dir.y * 31, 0);
  }
  
  //for Others' use
  public int getX() {
    return (int)currPlace.x;
  }
  public int getY() {
    return (int)currPlace.y; 
  }
  public PVector getCurrPlace() {
    return currPlace;
  }
  public float getHealth() {
    return health; 
  }
  public Cell getNextCell() {
    return nextCell; 
  }
  public Cell getCurrCell() {
    return currCell; 
  }
  public PVector getDir() {
    return dir; 
  }
  public void setDirXY(float x, float y) {
    dir.x = x;
    dir.y = y;
  }

  //End
}
