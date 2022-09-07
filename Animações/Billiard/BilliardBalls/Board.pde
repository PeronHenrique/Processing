abstract class Board { 
  PShape board;
  static final int margem = 30;
  static final int espessura = 10;

  Ball[] balls;

  Board() {
  }
  
  
  public void display() {
    shape(board);
    for (Ball b : balls)
      b.display();
  }


  public void update() {
    moveBalls();
    colideBalls();
    colideBoundaries();
  }

  private void moveBalls() {
    for (Ball b : balls) {
      b.update();
    }
  }

  void colideBalls() {
    for (int i=0; i<balls.length-1; i++) {
      for (int j=i+1; j<balls.length; j++) {
        PVector pi = balls[i].getPos();    
        PVector pj = balls[j].getPos();

        if (PVector.dist(pj, pi) < balls[i].radius+balls[j].radius) {
          Colisions.ballCololision(balls[i], balls[j]);
        }
      }
    }
  }

  //classes filhos devem implementar!!
  abstract void createBoard();
  abstract void createBalls();
  abstract void colideBoundaries();
}
