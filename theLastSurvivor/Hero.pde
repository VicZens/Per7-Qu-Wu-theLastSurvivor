public class Hero extends Character{
  PVector mouse;
  
  boolean firstTime;
  
  public Hero(Background bg) {
   currPlace = new PVector(277,277);
   
   update();
   setNextPlace();

   prevCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   currCell = bg.getCell((int)currPlace.x/30, (int)currPlace.y/30);
   
   nextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);
   currNextCell = bg.getCell((int)nextPlace.x/30, (int)nextPlace.y/30);

   speed = 5;
  }
  
  public void update() {
    mouse = new PVector(mouseX,mouseY);
    
    dir = PVector.sub(mouse,currPlace);
    dir.normalize();
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
  
  
  //Moving
  public void charge() {
    currPlace.x = currPlace.x + dir.x;
    currPlace.y = currPlace.y + dir.y;
  }
  public void retreat() {
    currPlace.x = currPlace.x - dir.x;
    currPlace.y = currPlace.y - dir.y;
  }

  //Changing the Background
  public void checkHero(Background bg) {
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
    nextPlace.add(dir.x * 6, dir.y * 6, 0);
  }


  //End
}
