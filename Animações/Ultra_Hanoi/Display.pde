final int SUBIDA = 0;
final int HORIZONTAL = 1;
final int DESCIDA = 2;
int movimento = 0;

JSONArray moves = new JSONArray();
int Passo_atual = 0;
boolean passo_finalizado = false;
int velocidade = 10;
JSONObject move;

void Display_tela() {
  switch (Etapa) {
    
  case SELECT_NUM_PINS:
    pushStyle();
    fill(255);
    text("Escolha a quantidade de pinos.", 10, 45);
    popStyle();
    for (Pino  p : pinos)
      p.display();
    break;

  case SELECT_PIN_START:
    pushStyle();
    fill(255);
    text("Escolha o Pino Inicial.", 10, 45);
    popStyle();
    for (Pino  p : pinos)
      p.display();
    break;

  case SELECT_PIN_END:
    pushStyle();
    fill(255);
    text("Escolha o Pino Final.", 10, 45);
    popStyle();
    for (Pino  p : pinos)
      p.display();
    break;

  case SELECT_NUM_DISC:
    pushStyle();
    fill(255);
    text("Escolha a Quantidade de Discos.", 10, 45);
    popStyle();
    for (Pino  p : pinos)
      p.display();
    for (Disco  d : discos)
      d.display();
    break;

  case ANIMACAO:
    {
      if (Passo_atual < moves.size()) move = moves.getJSONObject(Passo_atual);
      if (passo_finalizado) {
        passo_finalizado = false;
        pinos[move.getInt("Destino")]. q_disco++;
        pinos[move.getInt("Posição")]. q_disco--;
        Passo_atual++;
        if (Passo_atual == moves.size()) {
          Etapa = WAIT_RESET;
          break;
        }
      } else {
        pushStyle();
        fill(255);
        text("Número de passos: " + moves.size(), 10, 45);
        String texto = "Passo " + (Passo_atual+1) + " : mover disco ";
        texto += (move.getInt("Peça")+1) + " do pino " + (move.getInt("Posição")+1);
        texto += " para o pino " + (move.getInt("Destino")+1) + ".";
        textAlign(RIGHT);
        text(texto, width-10, 45);
        textAlign(CENTER);
        text(n_discos + " Peças", width/2, height - 15);
        popStyle();
        mover_disco();
      }

      for (Pino  p : pinos)
        p.display();
      for (Disco  d : discos)
        d.display();
    }
    break;

  case WAIT_RESET:
    pushStyle();
    fill(255);
    String texto = "Para reiniciar, clique na tela.";
    text(texto, 10, 45);
    popStyle();

    for (Pino  p : pinos)
      p.display();
    for (Disco  d : discos)
      d.display();
    break;
  }

  pushStyle();
  fill(255);
  text("Desenvolvido por Henrique Peron", 10, height - 15);
  textAlign(RIGHT);
  text("09/04/2021", width -10, height - 15);
  popStyle();
}


void mover_disco() {
  int disco_atual = move.getInt("Peça");
  int pin_dest = move.getInt("Destino");

  switch (movimento) {
  case SUBIDA:
    if (abs(discos[disco_atual].pos_y - 70) > velocidade)
      discos[disco_atual].pos_y -= velocidade;
    else {
      discos[disco_atual].pos_y = 70;
      movimento = HORIZONTAL;
    }
    break;

  case HORIZONTAL:
    {
      int dir;

      if (move.getInt("Posição") < pin_dest) dir = 1;
      else dir = -1;

      if (abs(discos[disco_atual].pos_x - pinos[pin_dest].pos_x) > velocidade)
        discos[disco_atual].pos_x += velocidade*dir;
      else {
        discos[disco_atual].pos_x = pinos[pin_dest].pos_x;
        movimento = DESCIDA;
      }
    }
    break;

  case DESCIDA:
    {
      float altura_destino = height - 100 - discos[0].altura*(0.5+pinos[pin_dest].q_disco);


      if (abs(discos[disco_atual].pos_y - altura_destino) > velocidade)
        discos[disco_atual].pos_y += velocidade;
      else {
        discos[disco_atual].pos_y = altura_destino;
        movimento = SUBIDA;
        passo_finalizado = true;
      }
    }
    break;
  }
}
