void Display_tela() { //<>// //<>// //<>// //<>//

  switch (Etapa) {
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
      if (passo_finalizado) {
        if (Passo_atual == moves.size()) {
          Etapa = WAIT_RESET;
          break;
        }
        passo_finalizado = false;
        ler_detalhes_passo();
        Passo_atual++;
        pinos[detalhes_passo_atual[2]]. q_disco++;
        pinos[detalhes_passo_atual[1]]. q_disco--;
      } else {
        pushStyle();
        fill(255);
        String texto = "Passo " + (Passo_atual) + " : mover disco ";
        texto += (detalhes_passo_atual[0]+1) + " do pino " + (detalhes_passo_atual[1]+1);
        texto += " para o pino" + (detalhes_passo_atual[2]+1) + ".";
        text(texto, 10, 45);
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
    String texto = "Para reiniciar clique na tela.";
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
  text("08/12/2020", 1000, height - 15);
  popStyle();
}


void mover_disco() {
  int disco_atual = detalhes_passo_atual[0];

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
      int pin_dest = detalhes_passo_atual[2];

      if (detalhes_passo_atual[1] < pin_dest) dir = 1;
      else dir = -1;

      if (abs(discos[disco_atual].pos_x - (250 + 350*pin_dest)) > velocidade)
        discos[disco_atual].pos_x += velocidade*dir;
      else {
        discos[disco_atual].pos_x = (250 + 350*pin_dest);
        movimento = DESCIDA;
      }
    }
    break;

  case DESCIDA:
    {
      int pin_dest = detalhes_passo_atual[2];
      int altura_destino = height - 86 - 28*pinos[pin_dest].q_disco;


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
