public class Background {
 Cell[][] c;
 float sizeX, sizeY;
 boolean top, bot, left, right;
 int level;
 
 public Background(int sizeX, int sizeY) {
   this.sizeX = sizeX;
   this.sizeY = sizeY;
   top = true;
   bot = true;
   left = true;
   right = true;
   c = new Cell[sizeX][sizeY];
   level = 1;
   
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
      if (random(10)<2 & left & x == 0) {
        c[x][y] = new Door(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, true, true);
        left = false;
      } else if (random(10)<2 & right & x == 19) {
        c[x][y] = new Door(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, true, false);
        right = false;
      } else {
        c[x][y] = new Cell(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, false);
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
 
 //End
}
