class Padlle {

  void display() {
    pushStyle();
    rectMode(CENTER);
    fill(255);
    rect(mouseX, 520, 120, 20, 10);
    popStyle();
  }
  
  void colide(Ball ball){
        // colisão no eixo x           &&  colisão no eixo y
    if (abs(mouseX - ball.x) < 60 + 10 && abs(520 - ball.y) < 10 + 10) {
                  // valor, limI1, limS1, limS2, limI2;
      float angle = map(mouseX - ball.x, 60 + 10, -60 -10, -PI, 0);
      ball.setDir(angle);
    }
    
  }
}
