Cell[][] lab;
int cell_size = 12;
int parede = 6;
int foto = 0;
boolean animar = false;

void setup() {
  size(603, 483);
  lab = new Cell[width/cell_size][height/cell_size];
  for (int i=0; i<width/cell_size; i++) 
    for (int j=0; j<height/cell_size; j++) 
      lab[i][j] = new Cell(i, j);
  lab_create(0, 0);
  lab[0][0].partida = true;
  lab[width/cell_size-1][height/cell_size-1].destino = true;
}

void draw() {
  display_lab();
  if (!animar) save("lab "+cell_size+".png");
  exit();
}


void lab_create(int x, int y) {
  if (animar) display_lab();
  int r = floor(random(4));
  lab[x][y].visitado = true;
  switch(r) {
  case 0:
    if (lab[x][y].vizinhos[0] && !lab[x][y-1].visitado) { 
      lab[x][y].conectar(0);
      lab_create(x, y-1);
    }

    if (lab[x][y].vizinhos[1] && !lab[x][y+1].visitado) { 
      lab[x][y].conectar(1);
      lab_create(x, y+1);
    }


    if (lab[x][y].vizinhos[2] && !lab[x+1][y].visitado) { 
      lab[x][y].conectar(2);
      lab_create(x+1, y);
    }


    if (lab[x][y].vizinhos[3] && !lab[x-1][y].visitado) { 
      lab[x][y].conectar(3);
      lab_create(x-1, y);
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
  if (animar) display_lab();
}


void display_lab() {
  background(0);
  for (int i=0; i<width/cell_size; i++) {
    for (int j=0; j<height/cell_size; j++) {
      lab[i][j].display();
    }
  }
  if (animar) {
    save("labs/lab"+nf(foto, 5)+".png");
    foto++;
  }
}
