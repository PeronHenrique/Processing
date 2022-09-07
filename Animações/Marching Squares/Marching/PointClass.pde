class Point {
  float x, y;
  float value;
  color cor = BLUE;


  Point (float x, float y) {
    this.x = x*RESOLUTION;
    this.y = y*RESOLUTION;
  }

  void display() {
    pushMatrix();
    translate(MARGIN + GRID_WIDTH/2, MARGIN + GRID_HEIGHT/2);

    pushStyle();
    strokeWeight(2);
    stroke(cor);
    point(x, -y);
    popStyle();
    popMatrix();
  }
}
