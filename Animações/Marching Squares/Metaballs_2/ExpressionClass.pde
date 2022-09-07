abstract class Expression {
  abstract float evaluate(float x, float y);
}

class Soma extends Expression {
  Soma() {
  }

  float evaluate(float x, float y) {
    x = x/100.0;
    y = y/100.0;
    return  1/(x*x + y*y) + 0.8/((x+1.5)*(x+1.5) + y*y) + 0.2/((x-1.2)*(x-1.2) + (y-0.7)*(y-0.7)) - 2;
  }
}
