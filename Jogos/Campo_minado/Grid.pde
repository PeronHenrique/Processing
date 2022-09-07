class Grid { //<>//
  /*status
   0 = bomba           
   1 = vazio
   2 = bandeira
   3 = numero
   */
  Celula[][] campo;
  boolean jogando;
  boolean modo_bandeira;
  int n_bandeiras;

  Grid() {
    campo = new Celula[vari.tela_y][vari.tela_x];
    modo_bandeira = false;
    n_bandeiras = 0;
    jogando = true;
    Inicializa();
  } 


  void Inicializa() {//inicializa cada celula, calcula posiçao das bombas, desenha a borda do jogo;
    for (int i=0; i<vari.tela_y; i++) { //cria as celulas;
      for (int j=0; j<vari.tela_x; j++) {
        int x = j*vari.tam_cell + vari.resto;
        int y = i*vari.tam_cell + 40;
        campo[i][j] = new Celula(x, y);
      }
    }

    while (n_bandeiras < vari.bombas) { //coloca as bombas;
      int x = floor(random(vari.tela_x));
      int y = floor(random(vari.tela_y));
      if (campo[y][x].status_inicial == 0) {   
        campo[y][x].status_inicial = 1;
        campo[y][x].status_atual = 1;
        n_bandeiras++;
      }
    }

    for (int i=0; i<vari.tela_y; i++) { //calcula os numeros;
      for (int j=0; j<vari.tela_x; j++) {
        if (campo[i][j].status_inicial == 0)
          campo[i][j].valor = define_vizinhos(j, i);
        if (campo[i][j].valor > 0) { 
          campo[i][j].status_inicial = 3;
          campo[i][j].status_atual = 3;
        }
      }
    }

    background(vari.borda); //desenha a borda do jogo;
    image(vari.rosto, (width-30)/2, 5, 30, 30);
    display(0, 0);
  }


  int define_vizinhos(int x, int y) {  //define o numero de bombas na vizinhança;
    int num = 0;
    for (int i=-1; i<=1; i++) { 
      for (int j=-1; j<=1; j++) {
        if (i+y < vari.tela_y && j+x < vari.tela_x && i+y >= 0 && j+x >= 0 && (i != 0 || j != 0)) {
          if (campo[i+y][j+x].status_inicial == 1) num++;
        }
      }
    }
    return num;
  }

  void display(int x, int y) {//desenha o campo, conforme status atual das celulas;
    background(vari.borda); //desenha a borda do jogo;
    if(modo_bandeira) image(vari.bandeira, (width-30)/2, 5, 30, 30);
    else image(vari.rosto, (width-30)/2, 5, 30, 30);
    
    
    fill(0);
    textSize(30);
    text(n_bandeiras, (width-120)/4, 30);
    textSize(20);
    text("Desenvolvido por Henrique Peron, 05/2020.", 10, height - 15);

    boolean dentro = false;
    if (x > vari.resto && x < width-vari.resto && y > 40 && y < height-vari.rodape) { //se mouse dentro do campo, determina a celula
      x = floor((x-vari.resto)/vari.tam_cell);
      y = floor((y-40)/vari.tam_cell);
      dentro = true;
    }

    stroke(vari.divisao);
    for (int i=0; i<vari.tela_y; i++) { //desenha o grid;
      for (int j=0; j<vari.tela_x; j++) {
        if (campo[i][j].revelado) {
          switch(campo[i][j].status_atual) {
          case 0:
            fill(vari.vazio);
            rect(campo[i][j].pos_x, campo[i][j].pos_y, vari.tam_cell, vari.tam_cell);            
            break;
          case 1:
            image(vari.bomba, campo[i][j].pos_x+1, campo[i][j].pos_y+1, vari.tam_cell-2, vari.tam_cell-2);   
            break;
          case 2:
            image(vari.bandeira, campo[i][j].pos_x+1, campo[i][j].pos_y+1, vari.tam_cell-2, vari.tam_cell-2); 
            break;
          case 3:
            fill(vari.vazio);
            rect(campo[i][j].pos_x, campo[i][j].pos_y, vari.tam_cell, vari.tam_cell);
            fill(vari.numeros);
            textSize(vari.tam_cell - 6);
            text(campo[i][j].valor, campo[i][j].pos_x + 5, campo[i][j].pos_y + vari.tam_cell/2 + 5);
            break;
          }
        } else if (dentro && j == x && i == y) {
          fill(vari.selecionar);
          rect(campo[i][j].pos_x, campo[i][j].pos_y, vari.tam_cell, vari.tam_cell);
        } else {
          fill(vari.n_revelada);
          rect(campo[i][j].pos_x, campo[i][j].pos_y, vari.tam_cell, vari.tam_cell);
        }
      }
    }
  }  


  void Atualiza(int x, int y) {//atualiza o status do jogo e celula se houver mouse click;

    if (x > vari.resto && x < width - vari.resto && y > 40 && y < height - vari.rodape) { //se mouse dentro do campo, determina a celula

      x = floor((x-vari.resto)/vari.tam_cell);
      y = floor((y-40)/vari.tam_cell);

      if (modo_bandeira) {     
        if (campo[y][x].status_atual == 2) {
          campo[y][x].status_atual = campo[y][x].status_inicial;
          n_bandeiras++;
          campo[y][x].revelado = false;
        } else {
          if (campo[y][x].revelado == false && n_bandeiras > 0) {
            campo[y][x].status_atual = 2;
            n_bandeiras--;
            campo[y][x].revelado = true;
          }
        }
      } else {
        if (campo[y][x].status_atual == 1) {
          campo[y][x].revelado = true;
          game_over(x, y);//display tela da derrota
        } else {
          campo[y][x].revelado = true;
          if (campo[y][x].status_atual == 0)
            abre_campo(x, y);
        }
      }
    } else if ((width-30)/2 < x && (width+30)/2 > x && 5 < y && 35 > y) {//se esta no botão da bandeira;
      if (modo_bandeira) {   
        modo_bandeira = false;
        image(vari.rosto, (width-30)/2, 5, 30, 30);
      } else {                 
        modo_bandeira = true;
        image(vari.bandeira, (width-30)/2, 5, 30, 30);
      }
    }

    game_win();//verifica se venceu
  }

  void abre_campo(int x, int y) {
    for (int i=-1; i<=1; i++) { 
      for (int j=-1; j<=1; j++) {
        if (i+y < vari.tela_y && j+x < vari.tela_x && i+y >= 0 && j+x >= 0 && (i != 0 || j != 0)) {
          if ((campo[i+y][j+x].status_atual == 0 || campo[i+y][j+x].status_atual == 3) && campo[i+y][j+x].revelado == false) {
            campo[i+y][j+x].revelado = true;
            if (campo[i+y][j+x].status_atual == 0) abre_campo(j+x, i+y);
          }
        }
      }
    }
  }

  void game_over(int x, int y) {
    jogando = false;
    image(vari.bomba, campo[y][x].pos_x+1, campo[y][x].pos_y+1, vari.tam_cell-2, vari.tam_cell-2);
  }

  void game_win() {
    int cont = 0;
    for (int i=0; i<vari.tela_y; i++) { 
      for (int j=0; j<vari.tela_x; j++) {
        if (campo[i][j].status_atual == 2 && campo[i][j].status_inicial == 1) cont++;
      }
    }
    if (cont == vari.bombas) {
      jogando = false;
      image(vari.vitoria, 0,0,width,height);
      pushStyle();
      textAlign(CENTER, CENTER);
      textSize(35);
      fill(0);
      text("Você venceu!! \n Obrigado por jogar!! : )", width/2, height/2);
      popStyle();
    }
  }
}
