class Trajeto {
  int posicao_x;
  int posicao_y;
  int lifespan;
  color Cor;

  Trajeto(float x, float y) {
    posicao_x = int(x);
    posicao_y = int(y);
    lifespan = 50;
    Cor = color(0, 230, 230);
  }

  void display() {
    pushStyle();
    stroke(Cor);
    strokeWeight(1);
    point(posicao_x, posicao_y);
    lifespan--;
    popStyle();
  }
}
