final int MENU_INICIAL = 0; //<>//
final int ESCOLHER_JOGADORES = 1;
final int ESCOLHER_TAMANHO = 2;
final int JOGANDO = 3;
final int ACABOU = 4;
int estado = 0;

int n_jogadores = 1;
int tamanho = 3;
int vez_jogador = 0;
int vencedor = 0;


void displayTela() {
  pushStyle();
  switch(estado) {
  case MENU_INICIAL:
    text("Jogo da Velha", width/2, height/6);
    break;
  case ESCOLHER_JOGADORES:
    text("Jogo da Velha", width/2, height/6);
    break;
  case ESCOLHER_TAMANHO:
    text("Jogo da Velha", width/2, 25);
    break;
  case JOGANDO:
    text("Jogo da Velha", width/2, 25);
    displayGrid();
    textSize(22);
    if (vez_jogador == 1) text("Vez do jogador 1: X", width/2, height-55);
    else text("Vez do jogador 2: O", width/2, height-55);
    break;
  case ACABOU:
    displayGrid();
    if (vencedor == 0) text("Empate!!", width/2, height-55);
    else if (vencedor == 1) text("Jogador 1 venceu!!", width/2, height-55);
    else if (n_jogadores == 1) text("Você perdeu!!", width/2, height-55);
    else text("Jogador 2 venceu!!", width/2, height-55);
    break;
  }

  textSize(15);
  text("Henrique Peron  12/12/2020", width/2, height-15);
  popStyle();
  display_botoes();
}

void Iniciar_jogo() {
  grid = new int[tamanho][tamanho];
  for (int i = 0; i< tamanho; i++)
    for (int j = 0; j< tamanho; j++)
      grid[i][j] = 0;

  vencedor = 0;
  vez_jogador = 1;
}

void displayGrid() {
  pushStyle();
  int comeco_y = 70;
  int final_y = height-80;
  float tam_cell = (final_y -comeco_y)/tamanho;
  float margem_x = (width - tam_cell*tamanho)/2;
  stroke(0);
  textSize(tam_cell);
  for (int i = 0; i< tamanho; i++)
    for (int j = 0; j< tamanho; j++) {
      float pos_x = margem_x + i*tam_cell;
      float pos_y = comeco_y + j*tam_cell;
      if (grid[i][j] == 0 && mouseX > pos_x && mouseX < pos_x+tam_cell && mouseY > pos_y && mouseY < pos_y+tam_cell) {
        fill(250);
        rect(pos_x, pos_y, tam_cell, tam_cell);
      } else {
        fill(220);
        rect(pos_x, pos_y, tam_cell, tam_cell);
      }
      fill(0);
      if (grid[i][j] == 1)text("X", margem_x + (i+0.5)*tam_cell, comeco_y + (j+0.4)*tam_cell);
      else if (grid[i][j] == -1)text("O", margem_x + (i+0.5)*tam_cell, comeco_y + (j+0.4)*tam_cell);
    }
  popStyle();
}

void Jogada() {
  int comeco_y = 70;
  int final_y = height-80;
  float tam_cell = (final_y -comeco_y)/tamanho;
  float margem_x = (width - tam_cell*tamanho)/2;

  if (mouseX > margem_x && mouseX < width-margem_x && mouseY > comeco_y && mouseY < final_y) {
    int i = int((mouseX-margem_x)/tam_cell);
    int j = int((mouseY-comeco_y)/tam_cell);
    if (grid[i][j] == 0) {
      grid[i][j] = vez_jogador;
      vez_jogador *= -1;
      vencedor = verificaVitoria();
      if (acabou(grid) || vencedor != 0) estado = ACABOU;
    }
  }
}


int verificaVitoria() {


  for (int i = 0; i< tamanho; i++) {
    for (int j = 0; j< tamanho; j++) {
      if (i > 0 && i < tamanho-1) { //horizontal
        if (grid[i-1][j] == 1  && grid[i][j] == 1   && grid[i+1][j] == 1)  return  1;
        if (grid[i-1][j] == -1 && grid[i][j] == -1  && grid[i+1][j] == -1) return -1;
      } 
      if (j > 0 && j < tamanho-1) { //vertical
        if (grid[i][j-1] == 1  && grid[i][j] == 1   && grid[i][j+1] == 1)  return  1;
        if (grid[i][j-1] == -1 && grid[i][j] == -1  && grid[i][j+1] == -1) return -1;
      }       
      if (i > 0 && i < tamanho-1 && j > 0 && j < tamanho-1) { //diagonais
        if (grid[i-1][j-1] == 1  && grid[i][j] == 1   && grid[i+1][j+1] == 1)  return  1;
        if (grid[i-1][j-1] == -1 && grid[i][j] == -1  && grid[i+1][j+1] == -1) return -1;
        if (grid[i+1][j-1] == 1  && grid[i][j] == 1   && grid[i-1][j+1] == 1)  return  1;
        if (grid[i+1][j-1] == -1 && grid[i][j] == -1  && grid[i-1][j+1] == -1) return -1;
      }
    }
  }
  return 0;
}

boolean acabou(int[][] campo) {
  for (int i = 0; i< tamanho; i++)
    for (int j = 0; j< tamanho; j++) 
      if (campo[i][j] == 0) return false;
  return true;
}
