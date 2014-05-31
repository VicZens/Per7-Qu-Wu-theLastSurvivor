public class Hero extends Character{
  PVector mouse;
  
  public Hero(Background bg) {
   currPlace = new PVector(300,300);
   this.bg = bg;
   
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

  
  //End
}
