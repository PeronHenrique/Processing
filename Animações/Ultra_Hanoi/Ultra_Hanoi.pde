int max_pinos = 8;
int n_pinos = max_pinos;
int n_discos = 0;
Pino[] pinos = new Pino[n_pinos];
Disco[] discos = new Disco[n_discos];
int inicio;
int destino;

void setup() {
  size(1300, 750);
  //surface.setLocation(-1300, 0);
  background(10);
  rectMode(CENTER);
  fill(150);
  stroke(50);
  textSize(25);
  for (int i = 0; i<pinos.length; i++)  pinos[i]  = new Pino(i);
}

void draw() {
  background(10);
  rect(width/2, height - 75, width, 50);
  Display_tela();
}

final int SELECT_NUM_PINS = 0;
final int SELECT_PIN_START = 1;
final int SELECT_PIN_END = 2;
final int SELECT_NUM_DISC = 3;
final int ANIMACAO = 4;
final int WAIT_RESET = 5;
int Etapa = 0;

void mousePressed() {
  switch (Etapa) {
    
  case SELECT_NUM_PINS:
    for (Pino  p : pinos)
      if (p.onTop() && p.id>1) {
        n_pinos = p.id+1;
        n_discos = 20*n_pinos - 30;
        Etapa++;
      } 
    discos = new Disco[n_discos];
    pinos = new Pino[n_pinos];
    for (int i = 0; i<pinos.length; i++)  
      pinos[i]  = new Pino(i);
    break;

  case SELECT_PIN_START:
    for (Pino  p : pinos)
      if (p.onTop()) {
        inicio = p.id;
        Etapa++;
      } 

    break;

  case SELECT_PIN_END:
    for (Pino  p : pinos)
      if (p.onTop() && p.id != inicio) {
        destino = p.id;
        Etapa++;
      }
    for (int i = 0; i<discos.length; i++) discos[i] = new Disco(i, inicio);
    break;

  case SELECT_NUM_DISC:
    for (Disco  d : discos)
      if (d.onTop()) {
        n_discos = d.id+1;
        Etapa++;
        Config_Animation();
      }
    break;

  case WAIT_RESET:
    Reset();
  case ANIMACAO:
    if(mouseButton == RIGHT) Reset();
    break;

  default:
    break;
  }
}


void Config_Animation() {
  discos = new Disco[n_discos];
  for (int i = 0; i<discos.length; i++) 
    discos[i] = new Disco(i, inicio);
  pinos[inicio].q_disco = n_discos;
  moves = hanoi_solve(n_discos-1, inicio, destino);
}


void Reset() {
  Etapa = 0;
  movimento = 0;
  n_pinos = max_pinos;
  n_discos = 0;
  pinos = new Pino[n_pinos];
  discos = new Disco[n_discos];
  for (int i = 0; i<pinos.length; i++)  pinos[i]  = new Pino(i);
  for (int i = 0; i<discos.length; i++) discos[i] = new Disco(i, 1);
  moves = new JSONArray();
  Passo_atual = 0;
  passo_finalizado = false;
}
