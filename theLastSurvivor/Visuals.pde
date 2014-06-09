public class Visuals {
  PFont heroHealth;
  float currHealth;
  
  public void update(Background bg, Hero h, Enemy[] e) {
    currHealth = h.getHealth();
  }
  
  public void show() {
    pushMatrix();
    stroke(0);
    fill(255,0,0);
    rect(50,10,currHealth*20,10);
    fill(0);
    text("Health", 10, 25);
    popMatrix(); 
  }
  
  public void endScreen() {
    
  }
}
