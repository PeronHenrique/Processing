class Point {
  float x, y;
  float value;

  Point (float x, float y) {
    this.x = x*RESOLUTION;
    this.y = y*RESOLUTION;
  }

  void evaluate(Expression ex) {
    value = ex.evaluate(x, y);
  }
}
