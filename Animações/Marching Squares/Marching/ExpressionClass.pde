abstract class Expression {
  Expression() {
  }

  abstract void evaluate(Point p);
}

class FcAfim extends Expression {
  float a;
  float b;

  FcAfim(float a, float b) {
    this.a = a;
    this.b = b;
  }

  void evaluate(Point p) {
    float x = p.x/100.0;
    float y = p.y/100.0;

    p.value = y - a*x - b;

    if (p.value < 0) p.cor = YELLOW;
  }
}

class Ellipse extends Expression {
  float a;
  float b;
  float c;

  Ellipse(float a, float b, float c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }

  void evaluate(Point p) {
    float x = p.x/100.0;
    float y = p.y/100.0;

    p.value = x*x/(a*a) + y*y/(b*b) - c*c;

    if (p.value < 0) p.cor = YELLOW;
  }
}

class Hiperbole extends Expression {
  float a;
  float b;
  float c;

  Hiperbole(float a, float b, float c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }

  void evaluate(Point p) {
    float x = p.x/100.0;
    float y = p.y/100.0;

    p.value = x*x/(a*a) - y*y/(b*b) - c*c;

    if (p.value < 0) p.cor = YELLOW;
  }
}


class Soma extends Expression {
  float a;
  float b;
  float c;

  Soma(float a, float b, float c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }

  void evaluate(Point p) {
    float x = p.x/100.0;
    float y = p.y/100.0;

    p.value = 1/(x*x + y*y) + 0.8/((x+1.5)*(x+1.5) + y*y) + 0.2/((x-1.2)*(x-1.2) + (y-0.7)*(y-0.7)) - 2;

    if (p.value < 0) p.cor = YELLOW;
  }
}
