class Celula {
  /*status
   0 = vazio           
   1 = bomba
   2 = bandeira
   3 = numero
   */

  int status_atual;
  int status_inicial;
  boolean revelado;
  int valor;
  int pos_x;
  int pos_y;

  Celula(int x, int y) {
    revelado = false;
    status_inicial = 0;
    pos_x = x;
    pos_y = y;
  }
}
