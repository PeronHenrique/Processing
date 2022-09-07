int[] inicio = {0, 0};
int[] fim = {0, 0};

void fazer_labirinto() {
  lab = new Cell[width/cell_size][height/cell_size];
  for (int i=0; i<width/cell_size; i++) 
    for (int j=0; j<height/cell_size; j++) 
      lab[i][j] = new Cell(i, j);

  int r = floor(random(width/cell_size));
  inicio[0] = r;
  fim[0] = r;
  r = floor(random(height/cell_size));
  inicio[1] = r;
  fim[1] = r;
  lab[inicio[0]][inicio[1]].partida = true;

  lab_create(inicio[0], inicio[1]);

  while (fim[0] == inicio[0] && fim[1] == inicio[1]) {
    lab[fim[0]][fim[1]].destino = false;
    r = floor(random(width/cell_size));
    fim[0] = r;
    r = floor(random(height/cell_size));
    fim[1] = r;
    lab[fim[0]][fim[1]].destino = true;
  }

  for (int i=0; i<width/cell_size; i++) 
    for (int j=0; j<height/cell_size; j++) {
      lab[i][j].visitado = false;
      lab[i][j].acabou = false;
    }
}


void lab_create(int x, int y) {
  int r = floor(random(4));
  lab[x][y].visitado = true;
  switch(r) {
  case 0:
    if (lab[x][y].vizinhos[3] && !lab[x-1][y].visitado) { 
      lab[x][y].conectar(3);
      lab_create(x-1, y);
    }
    if (lab[x][y].vizinhos[0] && !lab[x][y-1].visitado) { 
      lab[x][y].conectar(0);
      lab_create(x, y-1);
    }
    if (lab[x][y].vizinhos[2] && !lab[x+1][y].visitado) { 
      lab[x][y].conectar(2);
      lab_create(x+1, y);
    }
    if (lab[x][y].vizinhos[1] && !lab[x][y+1].visitado) { 
      lab[x][y].conectar(1);
      lab_create(x, y+1);
    }
    break;
  case 1:
    if (lab[x][y].vizinhos[1] && !lab[x][y+1].visitado) {
      lab[x][y].conectar(1); 
      lab_create(x, y+1);
    }
    if (lab[x][y].vizinhos[3] && !lab[x-1][y].visitado) { 
      lab[x][y].conectar(3);
      lab_create(x-1, y);
    }
    if (lab[x][y].vizinhos[2] && !lab[x+1][y].visitado) { 
      lab[x][y].conectar(2);
      lab_create(x+1, y);
    }
    if (lab[x][y].vizinhos[0] && !lab[x][y-1].visitado) {
      lab[x][y].conectar(0); 
      lab_create(x, y-1);
    }
    break;
  case 2:
    if (lab[x][y].vizinhos[2] && !lab[x+1][y].visitado) {
      lab[x][y].conectar(2); 
      lab_create(x+1, y);
    }
    if (lab[x][y].vizinhos[3] && !lab[x-1][y].visitado) { 
      lab[x][y].conectar(3);
      lab_create(x-1, y);
    }
    if (lab[x][y].vizinhos[0] && !lab[x][y-1].visitado) { 
      lab[x][y].conectar(0);
      lab_create(x, y-1);
    }
    if (lab[x][y].vizinhos[1] && !lab[x][y+1].visitado) { 
      lab[x][y].conectar(1);
      lab_create(x, y+1);
    }
    break;
  case 3:
    if (lab[x][y].vizinhos[2] && !lab[x+1][y].visitado) { 
      lab[x][y].conectar(2);
      lab_create(x+1, y);
    }
    if (lab[x][y].vizinhos[1] && !lab[x][y+1].visitado) { 
      lab[x][y].conectar(1);
      lab_create(x, y+1);
    }
    if (lab[x][y].vizinhos[0] && !lab[x][y-1].visitado) {
      lab[x][y].conectar(0); 
      lab_create(x, y-1);
    }
    if (lab[x][y].vizinhos[3] && !lab[x-1][y].visitado) { 
      lab[x][y].conectar(3);
      lab_create(x-1, y);
    }
    break;
  }
  lab[x][y].acabou = true;
}
