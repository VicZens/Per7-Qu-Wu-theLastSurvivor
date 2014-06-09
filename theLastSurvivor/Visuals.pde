public class Visuals {
  PFont endScreen;
  float currHealth;
  float currEHealth;
  float amtXP;
  
  public void update(Background bg, Hero h, Enemy[] e) {
    amtXP = h.getXP();
    currHealth = h.getHealth();
    if (h.getNextCell().getEnemyOn()) {
      currEHealth = h.getNextCell().getEnemy().getHealth();
    }
  }
  
  public void show() {
    pushMatrix();
    textSize(10);
    rectMode(CORNER);
    stroke(0);
    fill(255,0,0);
    rect(20,5,currHealth*10,10);
    fill(255);
    text("Health"+"   "+currHealth, 10, 25);
    
    stroke(0,0,255);
    fill(255);
    rect(25, 590,(amtXP-(((int)(amtXP+100)/100)*100)+100)*6,10);
    fill(255);
    text("XP"+"   "+(amtXP-(((int)(amtXP+100)/100)*100)+100), 25, 570);
    text("Level"+"   "+(int)(amtXP+100)/100, 25, 580);
    
    stroke(255);
    fill(255,0,0);
    rect(500,5,currEHealth*10,10);
    fill(255);
    text("Enemy Health"+"   "+currEHealth, 500, 25);
    popMatrix();
  }
  
  public void startScreen() {
     
  }
  
  /*
  public void endScreen() {
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("YOU HAVE DIED...LOSER.", 300,300);
  }
  */
}
