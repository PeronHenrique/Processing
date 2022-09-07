color[] cores ={color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), color(0, 255, 255), color(150)};
color[] contornos ={color(180, 0, 0), color(0, 180, 0), color(0, 0, 180), color(180, 180, 0), color(180, 0, 180), color(0, 180, 180), color(50)};

class Disco {
  int id;
  float altura = 28; 
  float largura;
  float pos_x;
  float pos_y;
  color cor;
  color contorno;

  Disco(int _id, int pino) {
    id = _id;
    cor = cores[id%6];
    contorno = contornos[id%6];
    // arrumar direito;
    altura = (height-200)/discos.length;
    if (altura > 20) altura = 20;
    float max_l = width/pinos.length;
    largura = map(id, discos.length, 0, max_l, 40); 
    pos_x = pinos[pino].pos_x;
    pos_y = (height-100) - altura*(discos.length-id-0.5);
  }
  
  void display() {
    if (onTop()) {
      pushStyle();
      fill(cor, 150);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura, altura);
      popStyle();
    } else {
      pushStyle();
      fill(cor);
      stroke(contorno);
      rect(pos_x, pos_y, largura, altura, altura);
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


class HyperDisco {
  int discosInclusos;
  int ordem;
  int offset;
  int[] tamanhos;
  HyperDisco[] discos;

  HyperDisco(int n, int o, int off) {
    discosInclusos = n;
    ordem = o;
    offset = off;
    tamanhos = encontraHiperdiscos(discosInclusos, ordem);

    discos = new HyperDisco[tamanhos.length];
    if (ordem > 0) {
      int offsetAcum = offset;
      for (int i = 0; i < tamanhos.length; i++) {
        discos[i] = new HyperDisco(tamanhos[i], ordem-1, offsetAcum);
        offsetAcum += tamanhos[i];
      }
    }
  }



  private int[] encontraHiperdiscos(int discos, int ordem) {
    if (ordem == 0) return new int[0];
    if (ordem == 1) {
      int[] val = new int[discos];
      for (int i=0; i < val.length; i++) val[i] = 1;
      return val;
    }

    int[] ndiscHiper = new int[ordem+1];
    int[] val = new int[0];
    while (ndiscHiper[ordem] < discos) {
      ndiscHiper[0] = 1;
      for (int i=1; i < ordem+1; i++) {
        ndiscHiper[i] += ndiscHiper[i-1];
      }
      val = append(val, ndiscHiper[ordem-1]);
    }

    val[val.length-1] -= ndiscHiper[ordem]-discos;

    if (val.length > 1 && val[val.length-1] < val[val.length-2]) {
      int diff = val[val.length-2] - val[val.length-1];
      diff/=2;
      val[val.length-2] -= diff;
      val[val.length-1] += diff;
    }
    return val;
  }


  void getMoves(int n, int start, int end, int other, JSONArray aux) {
    JSONObject move = new JSONObject();
    if (n == 0) {
      switch(ordem) {
      case 0:
        move.setInt("Peça", offset);
        move.setInt("Posição", start);
        move.setInt("Destino", end);
        aux.setJSONObject(aux.size(), move);
        break;
      case 1:
        discos[n].getMoves(0, start, end, others[0], aux);
        break;
      default:
        discos[n].getMoves(discos[n].tamanhos.length-1, start, end, others[ordem-2], aux);
        break;
      }
      return;
    }
    
    getMoves(n-1, start, other, end, aux);
    
    switch(ordem) {
    case 0:
      move.setInt("Peça", offset);
      move.setInt("Posição", start);
      move.setInt("Destino", end);
      aux.setJSONObject(aux.size(), move);
      break;
    case 1:
      discos[n].getMoves(0, start, end, others[0], aux);
      break;
    default:
      discos[n].getMoves(discos[n].tamanhos.length-1, start, end, others[ordem-2], aux);
      break;
    }
    
    getMoves(n-1, other, end, start, aux);
  }
}
