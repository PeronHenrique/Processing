import peasy.*; //<>//
PeasyCam cam;
Cube cube;
int ordem = 30;
Moves moves;
int nIteration = 30;
int n_moves = 12*ordem;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 1000);
  cube = new Cube();
  moves = new Moves(n_moves);
  frameRate(30);
}

void draw() {
  background(120);
  //camera(width/40, height/80, width, width/2, height/2, 0, 0, 1, 0);
  if (frameCount%nIteration == 0) {
    if (floor(frameCount/nIteration)-1 < 2*n_moves) moves.make(floor(frameCount/nIteration)-1);
  } else {
    if (floor(frameCount/nIteration) < 2*n_moves) moves.animate(floor(frameCount/nIteration));
  }
  translate(width/2, height/2, 0);
  cube.display();
}

class Moves {
  char[] side;
  int[] layer;
  int[] direction;

  Moves(int n) {
    char[] m = {'U', 'D', 'F', 'B', 'R', 'L'};
    int[] d = {1, -1, 2};
    side = new char[2*n];
    layer = new int[2*n];
    direction = new int[2*n];
    side[0] = m[floor(random(6))];
    layer[0] = floor(random(ordem/2));
    direction[0] = d[floor(random(3))];
    for (int i = 1; i< n; i++) {
      side[i] = m[floor(random(6))];
      while (side[i] == side[i-1])
        side[i] = m[floor(random(6))];
      layer[i] = floor(random(ordem/2));
      direction[i] = d[floor(random(3))];
    }

    for (int i = 0; i< n; i++) {
      side[2*n-1 - i] = side[i];
      layer[2*n-1 - i] = layer[i];
      direction[2*n-1 - i] = -direction[i];
    }
  }

  void make(int i) {
    cube.move(side[i], layer[i], direction[i]);
  }

  void animate(int i) {
    cube.animate(side[i], layer[i], direction[i]);
  }
}
