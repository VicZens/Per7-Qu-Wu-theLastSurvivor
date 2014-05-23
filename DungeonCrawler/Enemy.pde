public class Enemy extends Character{
  PVector rand, enemy, dir;  //rand is the vector that determines acceleration, it helps with random movement, hence the name.
                             //enemy is the vector of the enemy Character that will serve as the xp source and item source.
                             //dir is the vector that determines the current direction the enemy is going towards.
  float detection;
                             //detection is the range in which the enemy can find the hero.

  public Enemy() {
    enemy = new PVector(100,100);
    dir = new PVector(0,0);
    agility = 1;
  }
  
  public void update() {
    //Generates a random direction and then converts it into a unit vector.
    rand = new PVector(random(-.5,.5),random(-.5,.5));
    rand.normalize();
    
    //Adding the acceleration to the direction, and then moving the enemy in that direction.
    dir.add(rand);
    dir.limit(agility);
    enemy.add(dir);
  }
  
  public void show() {
    //Filler for what the enemy will look like, can change based on the type of enemy.
    fill(100,50,150);
    ellipse(enemy.x,enemy.y, 20,20);
  }
  
  //Allows for wrapping around the world.
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
