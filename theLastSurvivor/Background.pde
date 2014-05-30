public class Background {
 Cell[][] c;
 float sizeX, sizeY;
 
 public Background(int sizeX, int sizeY) {
   c = new Cell[sizeX][sizeY];
   this.sizeX = sizeX;
   this.sizeY = sizeY;
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
      c[x][y] = new Cell(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY);
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
 
 //End
}
