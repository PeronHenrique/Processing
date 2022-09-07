snake eu;  //pessoa jogando;

int life_span = 200;             //maximo de jogadas sem comer maçã

// variaveis para display do jogo;
int tela_x;
int tela_y;
int tam_cell = 15;
color grama = #76EA77;
color divisao = color(135, 245, 122);
color cobra = color(203, 29, 29);
color c_aplle = color(255, 0, 0);
color parede = color(60);

void setup() {
  frameRate(15);
  size(500, 600);
  tela_x = width/tam_cell;
  tela_y = (height)/tam_cell;

  eu = new snake();
}

void draw() {

  for (int i=0; i<tela_x; i++) {  //desenha o fundo
    for (int j=0; j<tela_y; j++) {
      if (eu.grid.campo[i][j] == 3) { //se for parede
        stroke(parede);
        fill(parede);
        rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
      } else {
        stroke(divisao);
        fill(grama);
        rect(tam_cell*i, tam_cell*j, tam_cell, tam_cell);
      }
    }
  }

    if (keyPressed) {    
      switch (key) {
      case 'w':
      case 'W':
        eu.atualiza(3, life_span);  //atualiza a direçao, posição e printa a snake
        break;
      case 'a':
      case 'A':
        eu.atualiza(2, life_span);  //atualiza a direçao, posição e printa a snake
        break;
      case 's':
      case 'S':
        eu.atualiza(4, life_span);  //atualiza a direçao, posição e printa a snake
        break;
      case 'd':
      case 'D':
        eu.atualiza(1, life_span);  //atualiza a direçao, posição e printa a snake
        break;
      }
    } else 
    eu.atualiza(0, life_span);  //atualiza a direçao, posição e printa a snake
  }
