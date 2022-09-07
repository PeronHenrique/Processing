class Pino {
  int id;
  int q_disco = 0;
  float altura = height - 200; 
  float largura = 20;
  float pos_x;
  float pos_y;
  color cor;
  color contorno;

  Pino(int _id) {
    contorno = contornos[6];
    cor = cores[6];
    id = _id;
    q_disco = 0;
    altura = height - 200; 
    largura = 20;
    pos_y = height/2 ;
    pos_x = (2*id+1)*width/(2*pinos.length);
  }

  void display() {

    if ( onTop()) {
      pushStyle();
      fill(cor, 150);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura);
      popStyle();
    } else {
      pushStyle();
      fill(cor);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura);
      popStyle();
    }
  }


  boolean onTop() {
    if (Etapa != SELECT_NUM_PINS && Etapa != SELECT_PIN_START && Etapa != SELECT_PIN_END) return false;
    if (mouseX > pos_x + largura/2 || mouseX < pos_x - largura/2) return false;
    if (mouseY > pos_y + altura/2 || mouseY < pos_y - altura/2)   return false;

    return true;
  }
}
