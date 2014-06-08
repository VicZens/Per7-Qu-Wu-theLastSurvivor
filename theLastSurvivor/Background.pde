public class Background {
 Cell[][] c;
 Door[] d;
 float sizeX, sizeY;
 
 public Background(int sizeX, int sizeY) {
   this.sizeX = sizeX;
   this.sizeY = sizeY;
   c = new Cell[sizeX][sizeY];
   d = new Door[1];
   //d = new Door[(int)random(3)+1];
   
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
        c[x][y] = new Cell(x*(600/sizeX), y*(600/sizeY), 600/sizeX, 600/sizeY, false);
    } 
   }
   
   for(int i = 0; i < d.length; i++) {
     int temp = (int)random(4)+1;
     if (temp == 1) {
       d[i] = new Door(((int)random(19)+1)*(600/sizeX), 0, 30,30, true);
     } else if (temp == 2) {
       d[i] = new Door(0, ((int)random(19)+1)*(600/sizeY), 30,30, true);
     } else if (temp == 3) {
       d[i] = new Door(((int)random(19)+1)*(600/sizeX), 570, 30,30, true);
     } else {
       d[i] = new Door(570, ((int)random(19)+1)*(600/sizeY), 30,30, true);
     }
   }
 }
 
 public void show() {
   for(int x = 0; x < sizeX; x++) {
    for(int y = 0; y < sizeY; y++) {
      c[x][y].show();
    } 
   }
   for(int x = 0; x < d.length; x++) {
     d[x].show(); 
   }
   //println("Door: " + d[0].getX() +" "+ d[0].getY());
 }
 
 public Cell getCell(int x, int y) {
   if (-1 < x & x < sizeX & -1 < y & y < sizeY) {
     return c[x][y];
   } else {
     return new Cell(1,1,1,1, false); 
   }
 }
 
 //End
}
