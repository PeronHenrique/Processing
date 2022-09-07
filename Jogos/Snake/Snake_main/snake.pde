class snake {   //<>//
  /*dir 
   0 = mesma direção
   1 = direita
   2 = esquerda
   3 = cima
   4 = baixo    
   */
  grid grid;
  int dir;
  int tamanho_corpo;
  int life;
  PVector[] corpo;
  PVector aplle;
  boolean viva;
  boolean comida;


  snake() { 
    grid = new grid();
    dir = 1;
    corpo = new PVector[tela_x*tela_y];
    corpo[0] = new PVector(floor(tela_x/2), floor(tela_y/2));
    tamanho_corpo = 1;
    grid.atualiza(corpo[0].x, corpo[0].y, 4);
    life = 0;
    viva = true;
    comida = false;
    come();
  }

  void atualiza(int nova_dir, int life_span) {
    if (viva == true) {
      life ++;
      move(nova_dir); //atualiza a posiçao
      is_alive(life_span); //verifica se a snake está viva 
      come(); //verifica se comeu maçã e desenha a maçã      
      printa();  //desenha a snake ou acaba o jogo
    }
  }

  void move(int nova_dir) { //atualiza a posiçao
    PVector nova_pos = new PVector(corpo[0].x, corpo[0].y);

    if ((dir==1 && nova_dir==2)||(dir==2 && nova_dir==1)||(dir==3 && nova_dir==4)||(dir==4 && nova_dir==3))  //se tenta dar marcha ré na cobra
      nova_dir = 0;

    if (nova_dir != 0)
      dir = nova_dir;

    switch (dir) {
    case 1:
      nova_pos.x++; 
      corre_corpo(nova_pos);
      break;
    case 2:
      nova_pos.x--;
      corre_corpo(nova_pos);
      break;
    case 3:
      nova_pos.y--;
      corre_corpo(nova_pos);
      break;
    case 4:
      nova_pos.y++;    
      corre_corpo(nova_pos);
      break;
    }
  }

  void corre_corpo(PVector nova_pos) {
    grid.atualiza(corpo[tamanho_corpo-1].x, corpo[tamanho_corpo-1].y, 1);
    for (int i=tamanho_corpo-1; i>0; i--) {
      corpo[i] = corpo[i-1];
      grid.atualiza(corpo[i].x, corpo[i].y, 2);
    }
    corpo[0] = nova_pos;
    if (grid.campo[floor(corpo[0].x)][floor(corpo[0].y)] == 1)
      grid.atualiza(corpo[0].x, corpo[0].y, 4);
  }

  void is_alive(int life_span) {  //verifica se a snake está viva

    if (grid.campo[floor(corpo[0].x)][floor(corpo[0].y)] == 2)  //se bateu no proprio corpo;
      viva = false;

    if (life > life_span) //se passou muito tempo sem se alimentar;
      viva = false;

    if (grid.campo[floor(corpo[0].x)][floor(corpo[0].y)] == 3) // se bateu na parede
      viva = false;
  }

  void come() { //verifica se comeu maçã

    while (comida == false) {
      aplle = new PVector(floor(random(tela_x)), floor(random(tela_y)));
      if (grid.campo[int(aplle.x)][int(aplle.y)] == 1) {   
        comida = true;
        grid.atualiza(aplle.x, aplle.y, 0);
      }
    }

    if (grid.campo[floor(corpo[0].x)][floor(corpo[0].y)] == 0) {
      corpo[tamanho_corpo] = corpo[tamanho_corpo-1];
      tamanho_corpo++;
      life = 0;
      comida = false;
      grid.atualiza(corpo[0].x, corpo[0].y, 4);
      come();
    }
  }

  void printa() {  //desenha a snake e maçã

    if (viva == true) {

      noStroke();
      fill(c_aplle);
      rect(tam_cell*aplle.x, tam_cell*aplle.y, tam_cell, tam_cell);

      for (int i=0; i<tamanho_corpo; i++) {
        fill(cobra);
        rect(tam_cell*corpo[i].x, tam_cell*corpo[i].y, tam_cell, tam_cell);
      }
    } else {
      // repensar o texto a ser disposto
      background(0);
      String Pontos = "Pontuação: ";
      String texto1 = "GAME";
      String texto2 = "OVER";
      fill(255);
      textSize(30);
      text(Pontos, 30, 250);
      text(eu.tamanho_corpo, 95, 285);
      text(texto1, 70, 150);
      text(texto2, 70, 190);
      noLoop();
    }
  }
}
