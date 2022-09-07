class Ball {
  float x = 250;
  float y = 310;

  float vx = 5;
  float vy = 5;
  
  boolean morta = false;


  void display() {
    pushStyle();
    fill(240, 120, 30);
    ellipse(x, y, 20, 20);
    popStyle();
  }

  void update() {
    x = x + vx;
    y = y + vy;

    if (x > width) {
      vx = -vx;
    }
    if (y > height) {
      morta = true;
    }
    if (x < 0) {
      vx = -vx;
    }
    if (y < 0) {
      vy = -vy;
    }
  }
  
  
  void setDir(float angle){
    vx = 7 * cos(angle);
    vy = 7 * sin(angle);
  }
  
}
