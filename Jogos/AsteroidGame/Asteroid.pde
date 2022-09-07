class Asteroid {
  float direcao;
  PVector posicao;
  
  boolean deletar;
  
 Asteroid(){
    float x = random(0, width);
    float y = random(0, height);
    
    if (x < width/2) x += width;
    else x -= width;
    
    if (y < height/2) y += height;
    else y -= height;
    
    posicao = new PVector(x,y);
    direcao = atan2(height/2 - y, width/2 - x) + random(-0.5, 0.5);
    
    deletar = false;
  }
  
  
  void display(){
    stroke(60);
    fill(180);
    ellipse(posicao.x, posicao.y, 30, 30);
  }
  
  void update(){
     posicao.add(PVector.fromAngle(direcao).setMag(3));
     
     if(posicao.x > width*2 || posicao.x < -width || posicao.y > height*2 || posicao.y < -height)
       deletar = true;
  }
  
  
  void destroy(Disparo d){
    PVector distancia = posicao.copy();
    distancia.sub(d.posicao);
    
    if(distancia.mag() < 15 + 5 && d.deletar == false){
      this.deletar = true;
      d.deletar = true;
    }
  }
}
