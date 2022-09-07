class Disparo {
  float direcao;
  PVector posicao;
  
  color ORANGE = #FFB039;
  
  boolean deletar;
  
  Disparo (float direcao){
    this.direcao = direcao;  
    posicao = new PVector(width/2, height/2);
    
    deletar = false;
  }
  
  
  void display(){
    noStroke();
    fill(ORANGE);
    ellipse(posicao.x, posicao.y, 10, 10);
  }
  
  void update(){
     posicao.add(PVector.fromAngle(direcao).setMag(5));
     
     if(posicao.x > width || posicao.x < 0 || posicao.y > height || posicao.y < 0)
       deletar = true;
     
  }
  
}
