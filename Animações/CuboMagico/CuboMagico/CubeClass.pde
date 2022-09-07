color[] cores = {color(255, 255, 255), color(255, 255, 0), color(0, 0, 255), color(0, 255, 0), color(255, 0, 0), color(255, 125, 0)};
float offset = 1;
class Cube {
  Cubie[][][] cubies;

  Cube () {
    cubies = new Cubie[ordem][ordem][ordem];
    makeCubies();
  }

  void makeCubies() {
    for (int i = 0; i<ordem; i++) {
      for (int j = 0; j<ordem; j++) {
        for (int k = 0; k<ordem; k++) {
          if (borda(i, j, k)) {     
            cubies[i][j][k] = new Cubie(i, j, k);
          } else cubies[i][j][k] = null;
        }
      }
    }
  }

  boolean borda(int i, int j, int k) {
    if (i == 0) return true;
    if (j == 0) return true;
    if (k == 0) return true;
    if (i == ordem-1) return true;
    if (j == ordem-1) return true;
    if (k == ordem-1) return true;
    return false;
  }

  void display() {
    for (int i = 0; i<ordem; i++) 
      for (int j = 0; j<ordem; j++) 
        for (int k = 0; k<ordem; k++) 
          if (cubies[i][j][k] != null) cubies[i][j][k].display();
  }

  void move(char Move, int layer, int direction) {
    int i = 0, j = 0, k = 0;
    if (layer < float(ordem)/2) {
      Cubie[][] camada = new Cubie[ordem][ordem];
      switch(Move) {
      case 'R':
        i = ordem-1 - layer;
        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++) {
            if (cubies[i][j][k] != null)
              cubies[i][j][k].setRotation(HALF_PI*direction, 1, 0, 0);
            camada[k][j] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, direction);

        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++)
            cubies[i][j][k] = camada[k][j];
        break;


      case 'L':
        i = layer;
        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++) {
            if (cubies[i][j][k] != null)
              cubies[i][j][k].setRotation(-HALF_PI*direction, 1, 0, 0);
            camada[k][j] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, -direction);

        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++)
            cubies[i][j][k] = camada[k][j];
        break;



      case 'F':
        k = ordem-1 - layer;
        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++) {
            if (cubies[i][j][k] != null)
              cubies[i][j][k].setRotation(HALF_PI*direction, 0, 0, 1);
            camada[i][j] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, -direction);

        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++)
            cubies[i][j][k] = camada[i][j];
        break;




      case 'B':
        k = layer;
        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++) {
            if (cubies[i][j][k] != null)
              cubies[i][j][k].setRotation(-HALF_PI*direction, 0, 0, 1);
            camada[i][j] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, direction);

        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++)
            cubies[i][j][k] = camada[i][j];
        break;



      case 'U':
        j = layer;
        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++) {
            if (cubies[i][j][k] != null) 
              cubies[i][j][k].setRotation(-HALF_PI*direction, 0, 1, 0);
            camada[i][k] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, -direction);

        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++)
            cubies[i][j][k] = camada[i][k];
        break;


      case 'D':
        j = ordem-1 - layer;
        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++) {
            if (cubies[i][j][k] != null)
              cubies[i][j][k].setRotation(HALF_PI*direction, 0, 1, 0);
            camada[i][k] = cubies[i][j][k];
            cubies[i][j][k] = null;
          }

        girar(camada, direction);

        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++)
            cubies[i][j][k] = camada[i][k];
        break;

      default:
        break;
      }
    }
  }
  
  void animate(char Move, int layer, int direction) {
    int i = 0, j = 0, k = 0;
    if (layer < float(ordem)/2) {
      switch(Move) {
      case 'R':
        i = ordem-1 - layer;
        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++) 
            if (cubies[i][j][k] != null)
              cubies[i][j][k].Rotate(HALF_PI*direction/nIteration, 1, 0, 0);
        break;


      case 'L':
        i = layer;
        for (k = 0; k<ordem; k++) 
          for (j = 0; j<ordem; j++) 
            if (cubies[i][j][k] != null)
              cubies[i][j][k].Rotate(-HALF_PI*direction/nIteration, 1, 0, 0);
        break;



      case 'F':
        k = ordem-1 - layer;
        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++) 
            if (cubies[i][j][k] != null)
              cubies[i][j][k].Rotate(HALF_PI*direction/nIteration, 0, 0, 1);
        break;




      case 'B':
        k = layer;
        for (i = 0; i<ordem; i++) 
          for (j = 0; j<ordem; j++) 
            if (cubies[i][j][k] != null)
              cubies[i][j][k].Rotate(-HALF_PI*direction/nIteration, 0, 0, 1);
        break;



      case 'U':
        j = layer;
        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++) 
            if (cubies[i][j][k] != null) 
              cubies[i][j][k].Rotate(-HALF_PI*direction/nIteration, 0, 1, 0);
        break;


      case 'D':
        j = ordem-1 - layer;
        for (i = 0; i<ordem; i++) 
          for (k = 0; k<ordem; k++) 
            if (cubies[i][j][k] != null)
              cubies[i][j][k].Rotate(HALF_PI*direction/nIteration, 0, 1, 0);
        break;

      default:
        break;
      }
    }
  }

  void girar(Cubie[][] camada, int total) {
    float lim_l = float(ordem)/2;
    float lim_n;
    if (ordem % 2 == 0) lim_n = float(ordem)/2;
    else lim_n = float(ordem-1)/2;
    
    for (int m = 0; m < abs(total); m++) {
      if (total > 0) {
        for (int n = 0; n < lim_n; n++) 
          for (int l = 0; l < lim_l; l++) {
            Cubie temp = camada[n][l];
            camada[n][l] = camada[ordem-1 - l][n];
            camada[ordem-1 - l][n] = camada[ordem-1 -n][ordem-1 - l];
            camada[ordem-1 -n][ordem-1 - l] = camada[l][ordem-1 -n];
            camada[l][ordem-1 -n] = temp;
          }
      } else {
        for (int n = 0; n < lim_n; n++) 
          for (int l = 0; l < lim_l; l++) {
            Cubie temp = camada[n][l];
            camada[n][l] = camada[l][ordem-1 - n];
            camada[l][ordem-1 -n] = camada[ordem-1 -n][ordem-1 - l];
            camada[ordem-1 -n][ordem-1 - l] = camada[ordem-1 - l][n];
            camada[ordem-1 - l][n] = temp;
          }
      }
    }
  }
}
