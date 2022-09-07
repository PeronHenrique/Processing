Grid jogo;      //contem as posições da tela e o seu status atual;
Variaveis vari;  // variaveis para display do jogo;

void setup() {
  surface.setTitle("Campo Minado");
  size(800, 480);
  vari = new Variaveis(10);
  jogo = new Grid();
}

void draw() {
  vari.cont_debounce++;
  vari.cont_debounce = vari.cont_debounce%30000;
  jogo.game_win();

  if (jogo.jogando) {
    if (mousePressed && vari.cont_debounce > 10) { 
      vari.cont_debounce = 0;
      jogo.Atualiza(mouseX, mouseY);
    }
    jogo.display(mouseX, mouseY);
  } else {
    if (mousePressed && vari.cont_debounce > 50) {
      jogo = new Grid();
      vari.cont_debounce = 0;
    }
  }
}
