public class Enemy {
  PVector rand, enemy, direct;
  float maxSpeed;
  float health;
 
  public Enemy() {
     enemy = new PVector(100,100);
     direct = new PVector(0,0);
     maxSpeed = 10;
  }
  
  public void update() {
     rand = new PVector(random(-1,1),random(-1,1));
     rand.normalize();
    
     direct.add(rand);
     direct.limit(maxSpeed);
     enemy.add(direct);
  }
  
  public void show() {
     fill(255);
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
  
}
