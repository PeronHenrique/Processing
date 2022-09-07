class Cell {
  int x;
  int y;
  boolean visitado = false;
  boolean acabou = false;
  boolean destino = false;
  boolean partida = false;
  boolean caminho = false;
  boolean[] vizinhos = new boolean[4];   //cima, baixo, direita, esquerda//
  boolean[] conectado = new boolean[4];  //cima, baixo, direita, esquerda//

  Cell (int x_, int y_) {
    x = x_;
    y = y_;
    cria_vizinhos();
  }


  void cria_vizinhos() {
    if (!(y == 0)) vizinhos[0] = true;
    if (!(y+1 >= int(height/cell_size))) vizinhos[1] = true;
    if (!(x+1 >= int(width/cell_size))) vizinhos[2] = true;
    if (!(x == 0)) vizinhos[3] = true;
  }


  void display() {
    pushStyle();
    if (partida) fill(0, 255, 0); 
    else if (destino) fill(255, 0, 0);
    else if (caminho) fill(0, 255, 255);
    else if (acabou) fill(230, 100, 100);
    else if (visitado) fill(230, 230, 70); 
    else fill(255);
    noStroke();
    int px = x*cell_size;
    int py = y*cell_size;
    int l = cell_size;
    int a = cell_size;    
    rect(px+parede, py+parede, l-parede, a-parede);
    if (conectado[0]) rect(px+parede, py, l-parede, parede);
    if (conectado[1]) rect(px+parede, py+cell_size-parede, l-parede, parede);
    if (conectado[2]) rect(px+cell_size-parede, py+parede, parede/2, a-parede);
    if (conectado[3]) rect(px, py+parede, parede, a-parede);
    popStyle();
  }


  void conectar(int index) {
    if (vizinhos[index]) {
      switch(index) {
      case 0:
        lab[x][y-1].conectado[1] = true;
        break;
      case 1:
        lab[x][y+1].conectado[0] = true;
        break;
      case 2:
        lab[x+1][y].conectado[3] = true;
        break;
      case 3:
        lab[x-1][y].conectado[2] = true;
        break;
      }
      conectado[index] = true;
    }
  }
}
