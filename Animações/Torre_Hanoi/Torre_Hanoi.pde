void setup() {
  size(1200, 500);
  background(10);
  for (int i = 0; i<pinos.length; i++)  pinos[i]  = new Pino(i);
  for (int i = 0; i<discos.length; i++) discos[i] = new Disco(i, 1);
  rectMode(CENTER);
  fill(150);
  stroke(50);
  textSize(25);
}

void draw() {
  background(10);
  rect(600, height - 75, 1100, 50);
  Display_tela();
}


void mousePressed() {

  switch (Etapa) {
  case SELECT_PIN_START:
    for (Pino  p : pinos)
      if (p.onTop()) {
        inicio = p.id;
        Etapa++;
        break;
      } 
    break;

  case SELECT_PIN_END:
    for (Pino  p : pinos)
      if (p.onTop() && p.id != inicio) {
        destino = p.id;
        Etapa++;
        break;
      }
    break;

  case SELECT_NUM_DISC:
    for (Disco  d : discos)
      if (d.onTop()) {
        tamanho = d.id;
        Etapa++;
        Config_Animation();
        break;
      }
    break;

  case WAIT_RESET:
    Reset();
    break;

  default:
    break;
  }
}
