public class Player {
  PVector mouse, hero, dir;
  float health, xp;
  float strength, agility;
   
  public Player(float x, float y){
     hero = new PVector(x,y);
  }
   
  public void update() {
     mouse = new PVector(mouseX,mouseY);
     dir = PVector.sub(mouse,hero);
     dir.normalize();
     dir.mult(5);
  }
  
  public void show() {
     fill(0);
     translate(hero.x,hero.y);
     rotate(atan(dir.y/dir.x));
     rectMode(CENTER);
     rect(0,0, 30,20);
  }
   
  public void charge() {
    hero.x = hero.x + dir.x;
    hero.y = hero.y + dir.y;
  }
  public void retreat() {
    hero.x = hero.x - dir.x;
    hero.y = hero.y - dir.y;
  }
  
  public PVector getHero() {
    return hero; 
  }
  
}


