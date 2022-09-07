Botao Iniciar;
Botao Jogadores;
Botao Voltar;
Botao Voltar_jogadores;
Botao Um_Jogador;
Botao Dois_Jogador;

void Criar_Botoes() {
  int div_y = height/5;
  Iniciar = new Botao(width/2, 2*div_y, 200, 50, MENU_INICIAL);
  Jogadores = new Botao(width/2, 3*div_y, 200, 50, MENU_INICIAL);
  Voltar = new Botao(150, 35, 150, 50, ACABOU);

  Um_Jogador = new Botao(width/2, 2*div_y, 200, 50, ESCOLHER_JOGADORES);
  Dois_Jogador = new Botao(width/2, 3*div_y, 200, 50, ESCOLHER_JOGADORES);
  Voltar_jogadores = new Botao(width/2, 4*div_y, 200, 50, ESCOLHER_JOGADORES);


  Iniciar.texto = "Iniciar"; 
  Jogadores.texto = "Selecionar Jogadores"; 
  Voltar.texto = "Voltar";
  Um_Jogador.texto = "1 Jogador"; 
  Dois_Jogador.texto = "2 Jogadores";
  Voltar_jogadores.texto = "Voltar";

  Um_Jogador.cor =  color(0, 140, 0);
}


void display_botoes() {
  Iniciar.display(); 
  Jogadores.display();
  Voltar.display();
  Um_Jogador.display();
  Dois_Jogador.display();
  Voltar_jogadores.display();
}



class Botao {
  int x;
  int y;
  int largura;
  int altura;
  color cor;
  String texto;
  int tela;


  Botao (int x_, int y_, int largura_, int altura_, int tela_) {
    x = x_;
    y = y_;
    largura = largura_;
    altura = altura_;
    cor = 187;
    tela = tela_;
  }


  void display() {
    if (tela == estado) {
      pushStyle();

      rectMode(CENTER);

      if (onTop()) fill(cor, 200);
      else  fill(cor);
      stroke(100);
      strokeWeight(3);
      rect(x, y, largura, altura, (altura+largura)/10);

      textAlign(CENTER, CENTER);
      fill(0);
      textSize(18);
      if (texto != null)
        text(texto, x, y-2); 

      popStyle();
    }
  }

  boolean onTop() {
    if (mouseX > x-largura/2 && mouseX < x+largura/2 && mouseY > y-altura/2 && mouseY < y+altura/2 && tela == estado)
      return true;
    else
      return false;
  }
}
