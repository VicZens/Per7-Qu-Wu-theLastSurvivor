public class Background {
 Cell[][] c;
 float sizeX, sizeY;
 boolean top, bot, left, right;
 int level;
 boolean noStairs;
 Door d;
 
 public Background(int sizeX, int sizeY) {
   this.sizeX = sizeX;
   this.sizeY = sizeY;
   top = true;
   bot = true;
   left = true;
   right = true;
   c = new Cell[sizeX][sizeY];
   level = 1;
   noStairs = true;
   
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
      if (random(10)<2 & left & x == 0 & y != 0 & y != 19) {
        c[x][y] = new Door(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, true, true);
        left = false;
      } else if (random(10)<2 & right & x == 19 & y != 0 & y != 19) {
        c[x][y] = new Door(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, true, false);
        right = false;
      } else {
        c[x][y] = new Cell(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, false);
      }
    } 
   }
   
   for(int x = 1; x < sizeX-1; x++) {
    for(int y = 1; y < sizeY-1; y++) {
      if (random(10000)<5 & noStairs) {
        d = new Door(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY);
        c[x][y] = d;
        noStairs = false;
      }
    }
   }
 }
 
 public void show() {
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
      c[x][y].show();
    } 
   }
 }
 
 public Cell getCell(int x, int y) {
   if (-1 < x & x < sizeX & -1 < y & y < sizeY) {
     return c[x][y];
   } else {
     return new Cell(1,1,1,1, false); 
   }
 }
 
 public int getLevel() {
   return level; 
 }
 public void incLevel() {
   level++; 
 }
 
 public Door getStairs() {
   return d;
 }
 //End
}
