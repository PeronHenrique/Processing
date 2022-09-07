static class Colisions { //<>//
  static void boardColision(Ball ball, PVector boardNormal, PVector boardPosition) {
    boardNormal.setMag(1);

    PVector deltaP = boardNormal.copy().mult(ball.radius);
    PVector p = boardPosition.copy().add(deltaP);

    PVector v = ball.getVel();
    PVector deltaV = boardNormal.mult(2 * v.dot(boardNormal));
    v.sub(deltaV);


    //println("\nAntes:");
    //printEnergy(ball);
    //printMomentum(ball);
    ball.setPos(p);
    ball.setVel(v);
    //println("\nDepois:");
    //printEnergy(ball);
    //printMomentum(ball);
  }

  static void  ballCololision(Ball b1, Ball b2) {
    PVector normal = b2.getPos().sub(b1.getPos()).normalize();  
    PVector tangent = new PVector(-normal.y, normal.x);

    float v1n = b1.getVel().dot(normal);
    float v2n = b2.getVel().dot(normal);
    float v1t = b1.getVel().dot(tangent);
    float v2t = b2.getVel().dot(tangent);
    float m1 = b1.mass;
    float m2 = b2.mass;

    float v1f = ((m1 - m2)*v1n + 2*m2*v2n)/(m1 + m2);
    float v2f = ((m2 - m1)*v2n + 2*m1*v1n)/(m1 + m2);

    PVector v_1 = normal.copy().setMag(v1f).add(tangent.copy().setMag(v1t));
    PVector v_2 = normal.copy().setMag(v2f).add(tangent.copy().setMag(v2t));

    float displace = b1.radius + b2.radius - b2.getPos().sub(b1.getPos()).mag();
    PVector x_1 = b1.getPos().copy().sub(normal.setMag(displace/2)); 
    PVector x_2 = b2.getPos().copy().add(normal.setMag(displace/2)); 

    //println("\nAntes:");
    //printEnergy(b1, b2);
    //printMomentum(b1, b2);
    b1.setPos(x_1);
    b2.setPos(x_2);
    b1.setVel(v_1);
    b2.setVel(v_2);
    //println("\nDepois:");
    //printEnergy(b1, b2);
    //printMomentum(b1, b2);
  }

  static void printEnergy(Ball b1, Ball b2) {
    float energy = 0.5*b1.mass*b1.getVel().mag()*b1.getVel().mag() + 0.5*b2.mass*b2.getVel().mag()*b2.getVel().mag();
    println("Cinética: " + nfc(energy, 2));
  }

  static void printMomentum(Ball b1, Ball b2) {
    float momentum = b1.mass*b1.getVel().mag() + b2.mass*b2.getVel().mag();
    println("Momento: " + nfc(momentum, 2));
  }

  static void printEnergy(Ball b1) {
    float energy = 0.5*b1.mass*b1.getVel().mag()*b1.getVel().mag();
    println("Cinética: " + nfc(energy, 2));
  }

  static void printMomentum(Ball b1) {
    float momentum = b1.mass*b1.getVel().mag();
    println("Momento: " + nfc(momentum, 2));
  }
}
