class CircleBoard extends Board {
  int nBalls;
  private int radius;
  private int x;
  private int y;

  CircleBoard(int n, int x_, int y_, int r) {
    nBalls = n;
    radius = r;
    x = x_;
    y = y_;
    
    
    createBoard();
    createBalls();
  }

  void createBoard() {
    board = createShape(GROUP);
    PShape t = createShape(ELLIPSE, x, y, 2*(radius-margem), 2*(radius-margem));
    t.setFill(#794B20);
    board.addChild(t);

    t = createShape(ELLIPSE, x, y, 2*(radius-margem-espessura), 2*(radius-margem-espessura));
    t.setFill(#23A50A);
    board.addChild(t);
  }

  void createBalls() {
    balls = new Ball[nBalls];
    for (int i=0; i<nBalls; i++) {
      float x_ = x + random(-(radius-margem-espessura-20), radius-margem-espessura-20);
      float y_ = y + random(-(radius-margem-espessura), radius-margem-espessura);
      PVector p = new PVector(x_, y_);
      PVector v = PVector.random2D().mult(random(10));

      balls[i] = new Ball(p, v, random(3, 15));
    }
  }

  void colideBoundaries() {
    for (Ball b : balls) {
      PVector p = b.getPos();
      if (p.dist(new PVector(x, y)) > radius-margem-espessura-b.radius) {
        PVector boardNorm = new PVector(x-p.x, y-p.y);
        PVector boardPos = new PVector(x, y).sub(boardNorm.copy().setMag(radius-margem-espessura));
        Colisions.boardColision(b, boardNorm, boardPos);
      }
    }
  }
}
