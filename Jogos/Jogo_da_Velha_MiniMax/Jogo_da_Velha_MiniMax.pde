int[][] grid;

void setup() {
  size(300, 400);
  textSize(30);
  fill(255);
  textAlign(CENTER, CENTER);
  Criar_Botoes();
}


void draw() {
  background(20);

  if (estado == JOGANDO && n_jogadores == 1 && vez_jogador == -1)
    IA_jogar();


  displayTela();
}


void mousePressed() {
  color verde = color(0, 140, 0);
  color botao = 187;
  if (estado != JOGANDO) {
    if (Iniciar.onTop()) {
      Iniciar_jogo();
      estado = JOGANDO;
      return;
    }

    if (Jogadores.onTop()) { 
      estado = ESCOLHER_JOGADORES;
      return;
    }



    if (Um_Jogador.onTop()) {
      n_jogadores = 1;
      Um_Jogador.cor = verde;
      Dois_Jogador.cor = botao;
      tamanho = 3;
      return;
    } 

    if (Dois_Jogador.onTop()) {
      n_jogadores = 2;
      Um_Jogador.cor = botao;
      Dois_Jogador.cor = verde;
      return;
    }

    if (Voltar.onTop() || Voltar_jogadores.onTop()) {
      estado = MENU_INICIAL;
      return;
    }
  } else  Jogada();
}
