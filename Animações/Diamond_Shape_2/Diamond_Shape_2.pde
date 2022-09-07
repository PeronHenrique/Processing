int dimensao = 1; 
int estado = 4;
float tile_size = 0;
int estagio_animacao = 20;
boolean pausado = true;
boolean foto = false;
ArrayList<Tile> tiles; 
boolean expandir = true;

void setup() {
  size(500, 500);
  tiles = new ArrayList<Tile>(0);
}

void draw() {
  switch(estado) {
  case 0: 
    expande();
    break;
  case 1:
    mostra_direcao();
    break;
  case 2:
    destaca_conflitos();
    break;
  case 3:
    elimina_conflitos();
    break;
  case 4:
    movimenta();
    break;
  case 5:
    destaca_buracos();
    break;
  case 6:
    preenche_buracos();
    break;
  case 7:
    colorir();
    if (foto) {
      foto = false;
      saveFrame("Ladrilhos Astecas A(" + (int)dimensao + ").png");
    }
    break;
  default:
    break;
  }
 // saveFrame("animação/Ladrilhos Astecas####.png");  //para criar o video
}



void mousePressed() {
  if (mouseButton == LEFT) { 
    loop();
  }
  if (mouseButton == RIGHT) { 
    if (pausado) loop();
    else noLoop();
    pausado = !pausado;
  }
  if (mouseButton == CENTER) {
    foto = true;
  }
}
