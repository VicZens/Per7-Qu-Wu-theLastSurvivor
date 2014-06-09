public class medEnemy extends Enemy {
  
  public medEnemy(int x, int y) {
    super(x,y);
    
    speed = 5;
    detRange = 5;
    health = 3;
    strength = 2;
    chance = 20;
    xpGive = 15;
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
      tint(100,200,0);
      image(currShape,currPlace.x,currPlace.y);
    }
    else {
      tint(100,200,0); 
      image((fixed(_die)),currPlace.x,currPlace.y);   
    }
  }
  
}
