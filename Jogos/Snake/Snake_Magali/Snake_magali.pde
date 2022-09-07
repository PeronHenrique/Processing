snake eu;  //pessoa jogando;
inteligencia magali;  //computador jogando

int life_span = 300;             //maximo de jogadas sem comer maçã
boolean jogando = false;
// variaveis para display do jogo;

int[][] paredes;
boolean construindo;
int indice;
PImage reset;
int tela_x;
int tela_y;
int tam_cell = 10;
color grama = #76EA77;
color divisao = color(135, 245, 122);
color cobra = color(203, 29, 29);
color c_aplle = color(255, 0, 0);
color parede = color(60);

void setup() {
  reset = loadImage("reset.png");
  frameRate(15);
  size(501, 441);
  tela_x = width/(2*tam_cell);
  tela_y = height/tam_cell;

  indice = 0;
  paredes = new int[400][2];
  construindo = true;

  eu = new snake();
  magali = new inteligencia();
}

void draw() { 
  if (construindo) {
    eu.grid.printa(eu, 0, 0, "Player 1");
    if (mousePressed) {
      int[] novo = new int[2];
      novo[0] = floor(mouseX/tam_cell);
      novo[1] = floor(mouseY/tam_cell);
      if ( mouseX < width/2) {
        if (indice < 399 && eu.grid.campo[novo[0]][novo[1]] != 3) { 
          paredes[indice][0] = novo[0];
          paredes[indice][1] = novo[1];
          indice++;
          magali = new inteligencia();
          eu = new snake();
        }
      } else construindo = false;
    }
  } else {
    magali.isPlaying();

    if (jogando) {
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

      magali.joga();
      magali.jogo.grid.printa(magali.jogo, width/2, 0, "Magali");
      eu.grid.printa(eu, 0, 0, "Player 1");
    } else { 
      pushMatrix(); 
      fill(255);
      image(reset, width/2-25, height/2-25, 50, 50);
      if (mousePressed) {
        if ((mouseX < width/2+25 && mouseX > width/2-25) ||(mouseY < height/2+25 && mouseY > height/2-25)) {
          magali = new inteligencia();
          eu = new snake();
        }
      }
      popMatrix();
    }
  }
}
