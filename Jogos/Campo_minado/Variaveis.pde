class Variaveis {
  int tela_x;
  int tela_y;
  int tam_cell;
  int resto;
  int rodape;
  int cont_debounce;
  int bombas;

  PImage bomba;
  PImage bandeira;
  PImage rosto;
  PImage vitoria;

  color borda = color(200);
  color divisao = color(0);
  color vazio = color(125);
  color numeros = #AA1526;
  color n_revelada = color(75);
  color selecionar = color(150);

  Variaveis(int bombs) {
    bomba = loadImage("bomba.jpg");
    bandeira = loadImage("bandeira.jpg");
    rosto = loadImage("rosto.jpg");
    vitoria = loadImage("vitoria.jpg");
    tam_cell = 18;
    tela_x = (width-20)/tam_cell;
    resto = (width - tela_x*tam_cell)/2;
    tela_y = (height-80)/tam_cell;
    rodape = height - 40 - tela_y*tam_cell;
    bombas = bombs;
    cont_debounce = 0;
  }
}
