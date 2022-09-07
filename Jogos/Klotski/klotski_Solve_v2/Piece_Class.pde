class Piece {
  int x;
  int y;
  int tipo;

  Piece (int tipo_, int x_, int y_, int[][] quadro) {
    x = x_;
    y = y_;
    tipo = tipo_;
    switch(tipo) {
    case 1:
      quadro[x][y] = tipo;
      quadro[x][y+1] = tipo;
      break;
    case 2:
      quadro[x][y] = tipo;
      quadro[x+1][y] = tipo;
      break;
    case 3:
      quadro[x][y] = tipo;
      break;
    case 4:
      quadro[x][y] = tipo;
      quadro[x+1][y] = tipo;
      quadro[x][y+1] = tipo;
      quadro[x+1][y+1] = tipo;
      break;
    default:
      break;
    }
  }

  void move(String dir, int[][] quadro) {
    String movimento = dir + tipo;
    switch(movimento) {
    case "UP1":  
        quadro[x][y-1] = tipo;
        quadro[x][y+1] = 0;
        y--;
      break;
    case "UP2":
        quadro[x][y-1] = tipo;
        quadro[x+1][y-1] = tipo;
        quadro[x][y] = 0;
        quadro[x+1][y] = 0;
        y--;
      break;
    case "UP3":
        quadro[x][y-1] = tipo;
        quadro[x][y] = 0;
        y--;
      break;
    case "UP4":
        quadro[x][y-1] = tipo;
        quadro[x+1][y-1] = tipo;
        quadro[x][y+1] = 0;
        quadro[x+1][y+1] = 0;
        y--;
      break;
    case "DOWN1":
        quadro[x][y+2] = tipo;
        quadro[x][y] = 0;
        y++;
      break;
    case "DOWN2":
        quadro[x][y+1] = tipo;
        quadro[x+1][y+1] = tipo;
        quadro[x][y] = 0;
        quadro[x+1][y] = 0;
        y++;
      break;
    case "DOWN3":
        quadro[x][y+1] = tipo;
        quadro[x][y] = 0;
        y++;
      break;
    case "DOWN4":
        quadro[x][y+2] = tipo;
        quadro[x+1][y+2] = tipo;
        quadro[x][y] = 0;
        quadro[x+1][y] = 0;
        y++;
      break;
    case "LEFT1":
        quadro[x-1][y] = tipo;
        quadro[x-1][y+1] = tipo;
        quadro[x][y] = 0;
        quadro[x][y+1] = 0;
        x--;
      break;
    case "LEFT2":
        quadro[x-1][y] = tipo;
        quadro[x+1][y] = 0;
        x--;
      break;
    case "LEFT3":
        quadro[x-1][y] = tipo;
        quadro[x][y] = 0;
        x--;
      break;
    case "LEFT4":
        quadro[x-1][y] = tipo;
        quadro[x-1][y+1] = tipo;
        quadro[x+1][y] = 0;
        quadro[x+1][y+1] = 0;
        x--;
      break;
    case "RIGHT1":
        quadro[x+1][y] = tipo;
        quadro[x+1][y+1] = tipo;
        quadro[x][y] = 0;
        quadro[x][y+1] = 0;
        x++;
      break;
    case "RIGHT2":
        quadro[x+2][y] = tipo;
        quadro[x][y] = 0;
        x++;
      break;
    case "RIGHT3":
        quadro[x+1][y] = tipo;
        quadro[x][y] = 0;
        x++;
      break;
    case "RIGHT4":
        quadro[x+2][y] = tipo;
        quadro[x+2][y+1] = tipo;
        quadro[x][y] = 0;
        quadro[x][y+1] = 0;
        x++;
      break;
    default:
      break;
    }
  }

  boolean canMove(String dir, int[][] quadro) {
    String movimento = dir + tipo;
    switch(movimento) {
    case "UP1":
      if (y > 0)
        if (quadro[x][y-1] == 0) {
          return true;
        }
      break;
    case "UP2":
      if (y > 0)
        if (quadro[x][y-1] == 0 && quadro[x+1][y-1] == 0) {
          return true;
        }
      break;
    case "UP3":
      if (y > 0)
        if (quadro[x][y-1] == 0) {
          return true;
        }
      break;
    case "UP4":
      if (y > 0)
        if (quadro[x][y-1] == 0 && quadro[x+1][y-1] == 0) {
          return true;
        }
      break;
    case "DOWN1":
      if (y < 3)
        if (quadro[x][y+2] == 0) {
          return true;
        }
      break;
    case "DOWN2":
      if (y < 4)
        if (quadro[x][y+1] == 0 && quadro[x+1][y+1] == 0) {
          return true;
        }
      break;
    case "DOWN3":
      if (y < 4)
        if (quadro[x][y+1] == 0) {
          return true;
        }
      break;
    case "DOWN4":
      if (y < 3)
        if (quadro[x][y+2] == 0 && quadro[x+1][y+2] == 0) {
          return true;
        }
      break;
    case "LEFT1":
      if (x > 0)
        if (quadro[x-1][y] == 0 && quadro[x-1][y+1] == 0) {
          return true;
        }
      break;
    case "LEFT2":
      if (x > 0)
        if (quadro[x-1][y] == 0) {
          return true;
        }
      break;
    case "LEFT3":
      if (x > 0)
        if (quadro[x-1][y] == 0) {
          return true;
        }
      break;
    case "LEFT4":
      if (x > 0)
        if (quadro[x-1][y] == 0 && quadro[x-1][y+1] == 0) {
          return true;
        }
      break;
    case "RIGHT1":
      if (x < 3)
        if (quadro[x+1][y] == 0 && quadro[x+1][y+1] == 0) {
          return true;
        }
      break;
    case "RIGHT2":
      if (x < 2)
        if (quadro[x+2][y] == 0) {
          return true;
        }
      break;
    case "RIGHT3":
      if (x < 3)
        if (quadro[x+1][y] == 0) {
          return true;
        }
      break;
    case "RIGHT4":
      if (x < 2)
        if (quadro[x+2][y] == 0 && quadro[x+2][y+1] == 0) {
          return true;
        }
      break;
    default:
      break;
    }
    return false;
  }
}
