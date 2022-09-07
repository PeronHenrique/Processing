class grid {
  int[][] campo;
  /*campo
   0 = aplle
   1 = grama
   2 = cobra
   3 = parede
   4 = cabeça
   */

  grid() {
    campo = new int[tela_x][tela_y];
    for (int i=0; i<tela_x; i++) {
      for (int j=0; j<tela_y; j++) {
        if (i == 0 || i == tela_x-1 || j == 0 || j == tela_y-1 ) //se for parede
          campo[i][j] = 3;
        else
          campo[i][j] = 1;
      }
    }
  }
  void atualiza(float x, float y, int novo) {
    campo[floor(x)][floor(y)] = novo;
  }
}
