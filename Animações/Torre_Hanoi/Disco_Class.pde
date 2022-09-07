class Disco {

  int id;
  int altura = 28; 
  int largura;
  int pos_x;
  int pos_y;
  color cor = color(180, 0, 180);
  color contorno = color(255, 0, 255);


  Disco(int _id, int pino) {
    id = _id;
    largura = 50 + 30*(id+1);
    pos_x = 250 + 350*pino;
    pos_y = height - altura*discos.length - 114 + altura*(id+1);

    switch(id) {
    case 0:
      contorno = color(0, 180, 180);
      cor = color(0, 255, 255);
      break;
    case 4:
      contorno = color(180, 0, 180);
      cor = color(255, 0, 255);
      break;
    case 7:
      contorno = color(180, 180, 0);
      cor = color(255, 255, 0);
      break;
    case 3:
      contorno = color(0, 0, 180);
      cor = color(0, 0, 255);
      break;
    case 8:
      contorno = color(180, 0, 0);
      cor = color(255, 0, 0);
      break;
    case 5:
      contorno = color(0, 180, 0);
      cor = color(0, 255, 0);
      break;
    case 6:
      contorno = color(140,63,157);
      cor = color(#8E0BA2);
      break;
    case 2:
      cor = color(255, 158, 0);
      contorno = color(200, 138, 0);
      break;
    case 1:
      cor = color(#167121);
      contorno = color(#2AAD3A);
      break;
    case 9:
      cor = color(#9BD0E8);
      contorno = color(#719EB2);
      break;
    }
  }



  void display() {

    if (onTop()) {
      pushStyle();
      fill(cor, 150);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura, 28);
      popStyle();
    } else {
      pushStyle();
      fill(cor);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura, 28);
      popStyle();
    }
  }


  boolean onTop() {
    if (Etapa != SELECT_NUM_DISC) return false;
    if (mouseX > pos_x + largura/2 || mouseX < pos_x - largura/2) return false;
    if (mouseY > pos_y + altura/2 || mouseY < pos_y - altura/2)   return false;

    return true;
  }
}
