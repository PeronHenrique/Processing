class inteligencia { //<>//
  snake jogo;
  int modo_safe;
  int contar_tamanho;
  int jogada_magali;
  int direita;
  int esquerda;
  int cima;
  int baixo;


  inteligencia () {
    jogo = new snake();
    jogada_magali = 0;
    modo_safe = 25;
  }

  void isPlaying() {
    if (eu.viva == true || jogo.viva == true)
      jogando = true;
    else
      jogando = false;
  }


  void joga() { //jogar de verdade hehe;
    jogada_magali = 0;
    direita = jogo.grid.campo[floor(jogo.corpo[0].x)+1][floor(jogo.corpo[0].y)];
    esquerda = jogo.grid.campo[floor(jogo.corpo[0].x)-1][floor(jogo.corpo[0].y)];
    cima = jogo.grid.campo[floor(jogo.corpo[0].x)][floor(jogo.corpo[0].y)-1];
    baixo = jogo.grid.campo[floor(jogo.corpo[0].x)][floor(jogo.corpo[0].y)+1];

    switch(jogo.dir) {
    case 1:
      if (jogo.comeu_recente && jogo.tamanho_corpo > modo_safe) {
        jogada_magali = 1;
        contar_tamanho++;
        if (contar_tamanho > jogo.tamanho_corpo) jogo.comeu_recente = false;
      } else {
        contar_tamanho = 0;
        if (jogo.corpo[0].x < jogo.aplle.x) jogada_magali = 1;
        else jogada_magali = escolhe_cima_baixo();
      }

      if (vaiBater(jogada_magali)) {
        if (direita == 3) jogada_magali = escapa_baixo_cima();
        else jogada_magali = escapa_cima_baixo();
        break;
      }

      break;
    case 2:
      if (jogo.comeu_recente && jogo.tamanho_corpo > modo_safe) {
        jogada_magali = 2;
        contar_tamanho++;
        if (contar_tamanho > jogo.tamanho_corpo) jogo.comeu_recente = false;
      } else {
        contar_tamanho = 0;
        if (jogo.corpo[0].x > jogo.aplle.x) jogada_magali = 2;
        else jogada_magali = escolhe_cima_baixo();
      }

      if (vaiBater(jogada_magali)) {
        if (esquerda == 3) jogada_magali = escapa_cima_baixo();
        else jogada_magali = escapa_baixo_cima();
        break;
      }

      break;
    case 3:
      if (jogo.comeu_recente && jogo.tamanho_corpo > modo_safe) {
        jogada_magali = 3;
        contar_tamanho++;
        if (contar_tamanho > jogo.tamanho_corpo) jogo.comeu_recente = false;
      } else {
        contar_tamanho = 0;
        if (jogo.corpo[0].y > jogo.aplle.y) jogada_magali = 3;
        else jogada_magali = escolhe_direita_esquerda();
      }

      if (vaiBater(jogada_magali)) {
        if (cima == 3) jogada_magali = escapa_direita_esquerda();
        else jogada_magali = escapa_esquerda_direita();
        break;
      }

      break;
    case 4:
      if (jogo.comeu_recente && jogo.tamanho_corpo > modo_safe) {
        jogada_magali = 4;
        contar_tamanho++;
        if (contar_tamanho > jogo.tamanho_corpo) jogo.comeu_recente = false;
      } else {
        contar_tamanho = 0;
        if (jogo.corpo[0].y < jogo.aplle.y) jogada_magali = 4;
        else jogada_magali = escolhe_direita_esquerda();
      }

      if (vaiBater(jogada_magali)) {
        if (baixo == 3) jogada_magali = escapa_esquerda_direita();
        else jogada_magali = escapa_direita_esquerda();        
        break;
      }

      break;
    }

    jogo.atualiza(jogada_magali, life_span);
  }

  int escolhe_cima_baixo() {
    if  (jogo.corpo[0].y > jogo.aplle.y) return 3;
    else return 4;
  }

  int escolhe_direita_esquerda() {
    if (jogo.corpo[0].x < jogo.aplle.x) return 1;
    else return 2;
  }

  boolean vaiBater(int dir) {
    if ((dir == 1) && (direita == 3 || direita == 2)) return true;
    if ((dir == 2) && (esquerda == 3 || esquerda == 2)) return true;
    if ((dir == 3) && (cima == 3 || cima == 2)) return true;
    if ((dir == 4) && (baixo == 3 || baixo == 2)) return true;
    return false;
  }


  int escapa_direita_esquerda() {
    if (direita != 3 && direita != 2) return 1;
    else if (esquerda != 3 && esquerda != 2) return 2;
    else return 0;
  }

  int escapa_esquerda_direita() {
    if (esquerda != 3 && esquerda != 2) return 2;
    else if (direita != 3 && direita != 2) return 1;
    else return 0;
  }

  int escapa_cima_baixo() {
    if (cima != 3 && cima != 2) return 3;
    else if (baixo != 3 && baixo != 2) return 4;
    else return 0;
  }

  int escapa_baixo_cima() {
    if (baixo != 3 && baixo != 2) return 4;
    else if (cima != 3 && cima != 2) return 3;
    else return 0;
  }
}
