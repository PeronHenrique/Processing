class Brick {
  float x;
  float y;
  color c;

  boolean morto;

  Brick(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;

    morto = false;
  }

  void display() {
    if (morto) {
      return;
    }

    pushStyle();
    rectMode(CENTER);
    fill(c);
    rect(x, y, 48, 24, 2);
    popStyle();
  }

  void colide(Ball ball) {
    if (morto) {
      return;
    }

    // colisão no eixo x           &&  colisão no eixo y
    if (abs(x - ball.x) < 24 + 10 && abs(y - ball.y) < 12 + 10) {
      ball.vx = -ball.vx;
      ball.vy = -ball.vy;

      morto = true;
    }
  }
}
