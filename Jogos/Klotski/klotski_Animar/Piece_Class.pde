class Piece { //<>//
  int x;
  int y;

  int tipo;
  color cor;
  int largura;
  int altura;

  Piece (int tipo_, int x_, int y_) {
    x = x_;
    y = y_;
    tipo = tipo_;
    
    switch(tipo) {
    case 1:
      largura = 71;
      altura = 146;
      quadro[x][y] = tipo;
      quadro[x][y+1] = tipo;
      cor = color(250, 250, 30);
      break;
    case 2:
      largura = 146;
      altura = 71;
      quadro[x][y] = tipo;
      quadro[x+1][y] = tipo;
      cor = color(124, 123, 254);
      break;
    case 3:
      largura = 71;
      altura = 71;
      quadro[x][y] = tipo;
      cor = color(70, 254, 70);
      break;
    case 4:
      largura = 146;
      altura = 146;
      quadro[x][y] = tipo;
      quadro[x+1][y] = tipo;
      quadro[x][y+1] = tipo;
      quadro[x+1][y+1] = tipo;
      cor = color(254, 50, 50);
      break;
    }
  }

  void  display() {
    pushStyle();
    fill(cor);
    rect(offsetX+x*75+2, offsetY+y*75+2, largura, altura);
    popStyle();
  }





  void move(String dir) {
    String movimento = dir + tipo;
    switch(movimento) {
    case "UP1":
        if (canMove("UP")) {
          quadro[x][y-1] = tipo;
          quadro[x][y+1] = 0;
          y--;
        }
      break;
    case "UP2":
        if (canMove("UP")) {
          quadro[x][y-1] = tipo;
          quadro[x+1][y-1] = tipo;
          quadro[x][y] = 0;
          quadro[x+1][y] = 0;
          y--;
        }
      break;
    case "UP3":
        if (canMove("UP")) {
          quadro[x][y-1] = tipo;
          quadro[x][y] = 0;
          y--;
        }
      break;
    case "UP4":
        if (canMove("UP")) {
          quadro[x][y-1] = tipo;
          quadro[x+1][y-1] = tipo;
          quadro[x][y+1] = 0;
          quadro[x+1][y+1] = 0;
          y--;
        }
      break;
    case "DOWN1":
        if (canMove("DOWN")) {
          quadro[x][y+2] = tipo;
          quadro[x][y] = 0;
          y++;
        }
      break;
    case "DOWN2":
        if (canMove("DOWN")) {
          quadro[x][y+1] = tipo;
          quadro[x+1][y+1] = tipo;
          quadro[x][y] = 0;
          quadro[x+1][y] = 0;
          y++;
        }
      break;
    case "DOWN3":
        if (canMove("DOWN")) {
          quadro[x][y+1] = tipo;
          quadro[x][y] = 0;
          y++;
        }
      break;
    case "DOWN4":
        if (canMove("DOWN")) {
          quadro[x][y+2] = tipo;
          quadro[x+1][y+2] = tipo;
          quadro[x][y] = 0;
          quadro[x+1][y] = 0;
          y++;
        }
      break;
    case "LEFT1":
        if (canMove("LEFT")) {
          quadro[x-1][y] = tipo;
          quadro[x-1][y+1] = tipo;
          quadro[x][y] = 0;
          quadro[x][y+1] = 0;
          x--;
        }
      break;
    case "LEFT2":
        if (canMove("LEFT")) {
          quadro[x-1][y] = tipo;
          quadro[x+1][y] = 0;
          x--;
        }
      break;
    case "LEFT3":
        if (canMove("LEFT")) {
          quadro[x-1][y] = tipo;
          quadro[x][y] = 0;
          x--;
        }
      break;
    case "LEFT4":
        if (canMove("LEFT")) {
          quadro[x-1][y] = tipo;
          quadro[x-1][y+1] = tipo;
          quadro[x+1][y] = 0;
          quadro[x+1][y+1] = 0;
          x--;
        }
      break;
    case "RIGHT1":
        if (canMove("RIGHT")) {
          quadro[x+1][y] = tipo;
          quadro[x+1][y+1] = tipo;
          quadro[x][y] = 0;
          quadro[x][y+1] = 0;
          x++;
        }
      break;
    case "RIGHT2":
        if (canMove("RIGHT")) {
          quadro[x+2][y] = tipo;
          quadro[x][y] = 0;
          x++;
        }
      break;
    case "RIGHT3":
        if (canMove("RIGHT")) {
          quadro[x+1][y] = tipo;
          quadro[x][y] = 0;
          x++;
        }
      break;
    case "RIGHT4":
        if (canMove("RIGHT")) {
          quadro[x+2][y] = tipo;
          quadro[x+2][y+1] = tipo;
          quadro[x][y] = 0;
          quadro[x][y+1] = 0;
          x++;
        }
      break;
    default:
      break;
    }
  }

  boolean canMove(String dir) {
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
