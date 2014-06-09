public class Visuals {
  PFont endScreen;
  float currHealth;
  float currEHealth;
  
  public void update(Background bg, Hero h, Enemy[] e) {
    currHealth = h.getHealth();
    if (h.getNextCell().getEnemyOn()) {
      currEHealth = h.getNextCell().getEnemy().getHealth();
    }
  }
  
  public void show() {
    pushMatrix();
    rectMode(CORNER);
    stroke(0);
    fill(255,0,0);
    rect(20,5,currHealth*10,10);
    fill(255);
    text("Health"+"   "+currHealth, 10, 25);
    
    stroke(255);
    fill(255,0,0);
    rect(500,5,currEHealth*10,10);
    fill(255);
    text("Enemy Health"+"   "+currEHealth, 500, 25);
    popMatrix(); 
  }
  
  public void endScreen() {
    background(0);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("YOU HAVE LOST", 300,300);
  }
}
