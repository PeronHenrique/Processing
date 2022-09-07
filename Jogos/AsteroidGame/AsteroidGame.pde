Nave n;
ArrayList<Disparo> disparos;
ArrayList<Asteroid> asteroids;


void setup() {
  size(500, 500);
  n = new Nave();
  disparos = new ArrayList<>();
  asteroids = new ArrayList<>();
}


void draw() {
  background(0);
  n.display();

  for (Disparo d : disparos) {
    d.display();
    d.update();
  }
  
  for (Asteroid a : asteroids) {
    a.display();
    a.update();
    for (Disparo d : disparos)
      a.destroy(d);
  }
  


  for (int i = disparos.size() - 1; i>=0; i--) {
    Disparo d = disparos.get(i);
    if (d.deletar)
      disparos.remove(d);
  }

  for (int i = asteroids.size() - 1; i>=0; i--) {
    Asteroid a = asteroids.get(i);
    if (a.deletar)
      asteroids.remove(a);
  }

  if (random(1) < 0.02)
    asteroids.add(new Asteroid());
    
    
    //println("disparos: " + disparos.size());    
    //println("asteroides: " + asteroids.size());
}

void keyPressed() {
  switch(keyCode) {
  case LEFT:
    n.rotate(-PI/30);
    break;
  case RIGHT:
    n.rotate(PI/30);
    break;
  default:
    break;
  }
}


void mousePressed() {
  disparos.add(new Disparo(n.pegaDiracao()));
}
