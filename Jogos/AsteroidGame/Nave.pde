class Nave {
  PShape nave;
  float angulo;
  color GREEN = color(0,255,0);

  Nave () {
    nave = createShape(TRIANGLE, -10, -10, -10, 10, 20, 0);
    nave.setFill(255);
    nave.setStroke(GREEN);
    
    angulo = 0;
  }

  void display() {
    shape(nave, width/2, height/2);
  }
  
  void rotate(float amt){
    nave.rotate(amt);
    angulo += amt;
  }
  
  float pegaDiracao(){
    return angulo;
  }
}
