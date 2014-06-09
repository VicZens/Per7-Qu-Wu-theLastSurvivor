public class hardEnemy extends Enemy {
  
  public hardEnemy(int x, int y) {
    super(x,y);
    
    speed = 7;
    detRange = 5;
    health = 5;
    strength = 3;
    chance = 30;
    xpGive = 20;
  }
  
  public void show() {
    if (health > 0) {
      if (mouseX > currPlace.x) {
        if (mouseY > currPlace.y)
          currShape = (fixed(_right));
        else
          currShape = (fixed(_up)); 
      }
      else if (mouseX < currPlace.x) {
        if (mouseY < currPlace.y)
          currShape = (fixed(_left));
        else
          currShape = (fixed(_down));
      }
      tint(200,0,0);
      image(currShape,currPlace.x,currPlace.y);
    }
    else {
      tint(200,100,0);
      image((fixed(_die)),currPlace.x,currPlace.y);   
    }
  }
}
