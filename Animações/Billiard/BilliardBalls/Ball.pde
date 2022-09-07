class Ball {
  //private float maxSpeed = 15;
  private PVector pos;
  private PVector vel;
  private PVector acc;
  final float radius;
  final float mass;
  color cor;

  Ball(PVector p, PVector v, float r) {
    if (r > 15) r = 15;
    if (r < 2) r = 2;
    mass = PI*r*r;
    pos = p;
    vel = v;
    acc = new PVector(0, 0);
    cor = color(floor(random(255)), 255, 255);
    radius = r;
  }

  Ball(PVector p, PVector v) {
    mass = 25*PI;
    radius = 5;
    pos = p;
    vel = v;
    acc = new PVector(0, 0);
    cor = color(floor(random(255)), 255, 255);
  }

  Ball(Ball b) {
    pos = b.getPos();
    vel = b.getVel();
    acc = b.getAcc();
    radius = b.radius;
    mass = b.mass;
    cor = b.cor;
  }

  Ball copy() {
    return new Ball(this);
  }

  void update() {
    pos.add(getVel().mult(ts));
    vel.add(getAcc().mult(ts));
  }

  void display() {
    pushStyle();
    noStroke();
    fill(cor);
    circle(pos.x, pos.y, radius*2);
    popStyle();
  }

  PVector getPos() {
    return pos.copy();
  }

  PVector getVel() {
    return vel.copy();
  }

  PVector getAcc() {
    return  acc.copy();
  }

  void setPos(PVector p) {
    pos.set(p);
  }

  void setVel(PVector v) {
    vel.set(v);
    //if (vel.mag() > maxSpeed) vel.setMag(maxSpeed);
  }

  void setAcc(PVector a) {
    acc.set(a);
  }
}
