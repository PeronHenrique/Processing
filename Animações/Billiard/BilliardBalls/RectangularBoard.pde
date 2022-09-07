class RectangularBoard extends Board {
  int nBalls;
  private int width;
  private int height;
  private int x;
  private int y;

  RectangularBoard(int n, int w, int h, int x_, int y_) {
    nBalls = n;
    width = w;
    height = h;
    x = x_;
    y = y_;
    
    createBoard();
    createBalls();
    
    //balls = new Ball[2];
    //balls[0] = new Ball(new PVector(300, 420), new PVector(0, -3), 8);
    //balls[1] = new Ball(new PVector(300, 500), new PVector(0, -4), 10);
  }

  void createBoard() {
    board = createShape(GROUP);
    PShape t = createShape(RECT, x+margem, y+margem, width-2*margem, height-2*margem);
    t.setFill(#794B20);
    board.addChild(t);

    t = createShape(RECT, x+margem+espessura, y+margem+espessura, width-2*(margem+espessura), height-2*(margem+espessura));
    t.setFill(#23A50A);
    board.addChild(t);
  }

  void createBalls() {
    balls = new Ball[nBalls];
    for (int i=0; i<nBalls; i++) {
      float x_ = random(x+margem+espessura, x+width-2*(margem+espessura));
      float y_ = random(y+margem+espessura, y+height-2*(margem+espessura));
      PVector p = new PVector(x_, y_);
      PVector v = PVector.random2D().mult(random(10));

      balls[i] = new Ball(p, v, random(3, 15));
    }
  }

  void colideBoundaries() {
    for (Ball b : balls) {
      PVector p = b.getPos();

      if (p.x > x+width-(margem+espessura)-b.radius) {
        PVector boardPos = new PVector(x+width-(margem+espessura), p.y);
        Colisions.boardColision(b, new PVector(-1, 0), boardPos);
      }
      if (p.x < x+margem+espessura+b.radius) {
        PVector boardPos = new PVector(x+margem+espessura, p.y);
        Colisions.boardColision(b, new PVector(1, 0), boardPos);
      }
      if (p.y > y+height-(margem+espessura)-b.radius) {
        PVector boardPos = new PVector(p.x, y+height-(margem+espessura));
        Colisions.boardColision(b, new PVector(0, -1), boardPos);
      }
      if (p.y < y+margem+espessura+b.radius) {
        PVector boardPos = new PVector(p.x, y+margem+espessura);
        Colisions.boardColision(b, new PVector(0, 1), boardPos);
      }
    }
  }
}
