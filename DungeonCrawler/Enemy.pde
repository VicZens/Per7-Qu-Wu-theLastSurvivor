public class Enemy {
  PVector rand, enemy, direct;
  float health, detection;
  float strength, agility;
 
  public Enemy() {
     enemy = new PVector(100,100);
     direct = new PVector(0,0);
     agility = 1;
  }
  
  public void update() {
     rand = new PVector(random(-.5,.5),random(-.5,.5));
     rand.normalize();
     
     direct.add(rand);
     direct.limit(maxSpeed);
     enemy.add(direct);
  }
  
  public void show() {
     fill(100,50,150);
     ellipse(enemy.x,enemy.y, 20,20);
  }
  
  public void checkEdges() {
    if (enemy.x > width) {
      enemy.x = 0;
    } else if (enemy.x < 0) {
      enemy.x = width;
    } 
    if (enemy.y > height) {
      enemy.y = 0;
    } else if (enemy.y < 0) {
      enemy.y = height;
    }
  }
  
  public PVector getEnemy() {
    return enemy;
  }  
}
