import com.hamoid.*;

VideoExport videoExport;

Cell[][] lab;
int cell_size = 15;
int parede = cell_size/2;
boolean resolveu_labirinto = false;
boolean animar = false;


void setup() {
  size(604, 484);
  fazer_labirinto();
  if (animar) {
    videoExport = new VideoExport(this, "Maze Solver "+cell_size+".mov");
    videoExport.startMovie();
  }
  Resolver_lab(inicio[0], inicio[1]);
}

void draw() {
  display_lab();
  if (!animar) save("lab "+cell_size+".png");
  if (animar) videoExport.endMovie();
  noLoop();
}

void Resolver_lab(int x, int y) {
  if (animar) display_lab();
  lab[x][y].visitado = true;

  if (lab[x][y].destino) {
    resolveu_labirinto = true;
    if (animar) display_lab();
    return;
  }

  if (!resolveu_labirinto && lab[x][y].conectado[0] && !lab[x][y-1].visitado) {
    Resolver_lab(x, y-1);
    if (resolveu_labirinto) lab[x][y].caminho = true;
  }
  if (!resolveu_labirinto && lab[x][y].conectado[1] && !lab[x][y+1].visitado) { 
    Resolver_lab(x, y+1);
    if (resolveu_labirinto) lab[x][y].caminho = true;
  }
  if (!resolveu_labirinto && lab[x][y].conectado[2] && !lab[x+1][y].visitado) { 
    Resolver_lab(x+1, y);
    if (resolveu_labirinto) lab[x][y].caminho = true;
  }
  if (!resolveu_labirinto && lab[x][y].conectado[3] && !lab[x-1][y].visitado) { 
    Resolver_lab(x-1, y);
    if (resolveu_labirinto) lab[x][y].caminho = true;
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
    videoExport.saveFrame();
  }
}
