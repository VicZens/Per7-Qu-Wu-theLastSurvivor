public class Hero extends Character {
  PVector mouse;
  PImage _attack;

  
  public Hero(int x, int y) {
   currPlace = new PVector(x,y);
   mouse = new PVector(mouseX,mouseY);
   dir = PVector.sub(mouse,currPlace);
   dir.normalize();
   dir.mult(speed);
   setNextPlace();
   
   _up = loadImage("h_up.jpg");
   _left = loadImage("h_left.jpg");
   _right = loadImage("h_right.jpg");
   _down = loadImage("h_down.jpg");
   _attack = loadImage("h_attack.jpg");
   currShape = fixed(_down);

   prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
   nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
   currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);

   speed = 4;
   health = 25;
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
    if (mouseX > currPlace.x) {
      if (mouseY > currPlace.y)
        currShape = fixed(_right);
      else
        currShape = fixed(_up); 
    }
    else if (mouseX < currPlace.x) {
      if (mouseY < currPlace.y)
        currShape = fixed(_left);
      else
        currShape = fixed(_down);
    }
    image(currShape,currPlace.x,currPlace.y);
    translate(currPlace.x,currPlace.y);
    rotate(atan(dir.y/dir.x));
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
    
    prevCell.setHeroOn(false);
    currCell.setHero(this);
    
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
