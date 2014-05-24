public class Player extends Character{
  PVector mouse, hero, dir;  //mouse is the vector that contains the x and y of the current location of the mouse.
                             //hero is the vector that contains the x and y of the current location of the hero.
                             //dir is the current direction that the hero is going towards.
  float xp;
                             //xp determines the level of the hero.
   
  public Player(){
    hero = new PVector(250,250);
    agility = 3;
    health = 1;
  }
   
  public void update() {
    //Creates a direction that is directed towards the mouse, 
    //converts it into a unit vector and then multiplies that by agility.
    mouse = new PVector(mouseX,mouseY);
    dir = PVector.sub(mouse,hero);
    dir.normalize();
    dir.mult(agility);
  }
  
  public void show() {
    //Push and pop matrix are here so that this does not affect other characters' movement. 
    //It colors the hero black, translates it to the hero's x and y, rotates it so that it
    //faces the mouse, and then creates the hero's image.
    pushMatrix();
    fill(0);
    translate(hero.x,hero.y);
    rotate(atan(dir.y/dir.x));
    rectMode(CENTER);
    rect(0,0, 30,20);
    popMatrix();
  }
  
  //Moving the hero forwards and backwards.
  public void charge() {
    hero.x = hero.x + dir.x;
    hero.y = hero.y + dir.y;
  }
  public void retreat() {
    hero.x = hero.x - dir.x;
    hero.y = hero.y - dir.y;
  }
  
  public float getHealth() {
    return health; 
  }
  
}


