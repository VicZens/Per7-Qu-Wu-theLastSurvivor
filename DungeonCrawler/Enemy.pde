public class Enemy {
  PVector rand, enemy, direct;
  float maxSpeed;
  float health;
 
  public Enemy(float x) {
     enemy = new PVector(random(x), random(x));
     direct = new PVector(0,0);
     rand = new PVector(-0.001,.01);
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
     ellipseMode(CENTER);
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
