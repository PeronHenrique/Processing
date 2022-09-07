class grid {
  int[][] campo;
  boolean morreu;
  /*campo
   0 = aplle
   1 = grama
   2 = cobra
   3 = parede
   4 = cabeça
   */

  grid() {
    morreu = false;
    campo = new int[tela_x][tela_y];
    for (int i=0; i<tela_x; i++) {
      for (int j=0; j<tela_y; j++) {
        if (i == 0 || j == 1 || i == tela_x-1 || j == 0 || j == tela_y-1 ) //se for parede
          campo[i][j] = 3;
        else
          campo[i][j] = 1;
      }
    }
    for (int i=0;i<paredes.length;i++)
      campo[paredes[i][0]][paredes[i][1]] = 3;
  }


  void atualiza(float x, float y, int novo) {
    campo[floor(x)][floor(y)] = novo;
  }

  void printa(snake jogador, int xInit, int yInit, String nome) {
    pushMatrix();
    translate(xInit, yInit);
    for (int i=0; i<tela_x; i++) {
      for (int j=0; j<tela_y; j++) {
        if (jogador.viva) {
          switch(jogador.grid.campo[i][j]) {
          case 0:
            noStroke();
            fill(c_aplle);
            rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
            break;
          case 1:
            stroke(divisao);
            fill(grama);
            rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
            break;
          case 2:
          case 4:
            noStroke();
            fill(cobra);
            rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
            break;
          case 3:
            stroke(parede);
            fill(parede);
            rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
            break;
          }

          fill(255);
          textSize(15);
          text(life_span-jogador.life, 110, 17);
          
        } else {
          if (morreu == false) {
            fill(0);
            rectMode(CORNER);
            rect(0, 0, tela_x*tam_cell, height);

            fill(255);
            textSize(30);
            text(nome, 80, 100);
            text("Pontuação:", 50, 250);
            text(jogador.tamanho_corpo, 115, 285);
            text("GAME", 90, 150);
            text("OVER", 90, 185);

            morreu = true; //pra printar só uma vez essa parte;
          }
        }
      }
    }
    popMatrix();
  }
}
