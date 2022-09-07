class Pino {
  int id;
  int q_disco = 0;
  int altura = 300; 
  int largura = 20;
  int pos_x;
  int pos_y;

  Pino(int _id) {
    id = _id;

    switch(id) {
    case 0:
      pos_x = 250;
      pos_y = height - 250;
      break;
    case 1:
      pos_x = 600;
      pos_y = height - 250;
      break;
    case 2:
      pos_x = 950;
      pos_y = height - 250;
      break;
    }
  }

  void display() {

    if ( onTop()) {
      pushStyle();
      fill(200);
      rect(pos_x, pos_y, largura, altura);
      popStyle();
    } else {
      rect(pos_x, pos_y, largura, altura);
    }
  }


  boolean onTop() {
    if (Etapa != SELECT_PIN_START && Etapa != SELECT_PIN_END) return false;
    if (mouseX > pos_x + largura/2 || mouseX < pos_x - largura/2) return false;
    if (mouseY > pos_y + altura/2 || mouseY < pos_y - altura/2)   return false;
    
    return true;
    }
}
