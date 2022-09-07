class Botao {
  int x;
  int y;
  int largura;
  int altura;
  color cor;
  String texto;
  boolean ativo;


  Botao (int x_, int y_, int largura_, int altura_, color cor_, String texto_) {
    x = x_;
    y = y_;
    largura = largura_;
    altura = altura_;
    cor = cor_;
    texto = texto_;
    ativo = true;
  }


  void display() {
    if (ativo) {
      pushStyle();
      pushMatrix();
      rectMode(CENTER);
      textAlign(CENTER, CENTER);

      fill(cor);
      stroke(255);
      rect(x, y, largura, altura, (altura+largura)/16);


      fill(255);
      textSize(20);
      if (texto != null)
        text(texto, x, y-3); 
      popMatrix();
      popStyle();
    }
  }

  boolean IsPressed() {
    if (mouseX > x-largura/2 && mouseX < x+largura/2 && mouseY > y-altura/2 && mouseY < y+altura/2 && ativo)
      return true;
    else
      return false;
  }
}
