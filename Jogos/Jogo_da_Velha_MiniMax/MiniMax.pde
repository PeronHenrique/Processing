void IA_jogar() {

  int   melhor_pontuacao = 10;
  int[] melhor_jogada = {-1, -1};

  for (int m = 0; m< tamanho; m++) {
    for (int n = 0; n< tamanho; n++) {
      if (grid[m][n] == 0) {
        grid[m][n] = -1;
        int pontuacao = Minimax(9, -10, 10, true);
        grid[m][n] = 0;
        if (pontuacao < melhor_pontuacao) {
          melhor_pontuacao = pontuacao;
          melhor_jogada[0] = m;
          melhor_jogada[1] = n;
        }
      }
    }
  }

  grid[melhor_jogada[0]][melhor_jogada[1]] = vez_jogador;
  vez_jogador *= -1;
  vencedor = verificaVitoria();
  if (acabou(grid) || vencedor != 0) estado = ACABOU;
}

int Minimax(int profundidade, int alpha, int beta, boolean maximizar) {
  int valor_atual = verificaVitoria();
  if (acabou(grid) || profundidade <= 0 || valor_atual != 0) 
    return valor_atual;

  if (maximizar) {
    int maximo = -10;
    for (int i = 0; i< tamanho; i++) {
      for (int j = 0; j< tamanho; j++) {
        if (grid[i][j] == 0) {
          grid[i][j] = 1;
          int avaliar = Minimax(profundidade-1, alpha, beta, false);
          grid[i][j] = 0;
          maximo = max(maximo, avaliar);
          alpha = max(alpha, avaliar);
          if (beta <= alpha) break;
        }
      }
      if (beta <= alpha) break;
    }
    return maximo;
  } else {
    int minimo = 10;
    for (int i = 0; i< tamanho; i++) {
      for (int j = 0; j< tamanho; j++) {
        if (grid[i][j] == 0) {
          grid[i][j] = -1;
          int avaliar = Minimax(profundidade-1, alpha, beta, true);
          grid[i][j] = 0;
          minimo = min(minimo, avaliar);
          beta = min(beta, avaliar);
          if (beta <= alpha) break;
        }
      }
      if (beta <= alpha) break;
    }
    return minimo;
  }
}
