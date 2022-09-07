class Boid { //<>//
  PShape Corpo;
  PVector posicao;
  PVector velocidade;
  PVector aceleracao;
  int id;



  Boid (int _id) {
    id = _id;
    criar_corpo();
    posicao = new PVector(random(width), random(height), 0); 
    velocidade = PVector.random2D();
    velocidade.setMag(15);
    aceleracao = new PVector(0, 0, 0);
  }


  void Cohesion() {
    //move o elemento na direção do centro de massa dos demais individuos na faixa de visão
    PVector   acellCohesion = new PVector(0, 0, 0);

    int cont = 0;
    for (Boid other : boid) {
      if (IsVisible(other) && posicao.dist(other.posicao) > muito_longe) {
        PVector diff = PVector.sub(other.posicao, posicao);
        diff.normalize();
        acellCohesion.add(diff);
        cont++;
      }
    }

    if (cont > 0) acellCohesion.div(cont);
    acellCohesion.mult(Fator_Cohesion);
    aceleracao.add(acellCohesion);
  }

  void Separation() {
    //evita colisões
    PVector acellSeparation = new PVector(0, 0, 0);

    int cont = 0;
    for (Boid other : boid) {
      if (IsVisible(other) && posicao.dist(other.posicao) < muito_perto) {
        PVector diff = PVector.sub(posicao, other.posicao);
        diff.normalize();
        acellSeparation.add(diff);
        cont++;
      }
    }

    if (cont > 0) acellSeparation.mult(cont);
    acellSeparation.mult(Fator_Separation);
    aceleracao.add(acellSeparation);
  }


  void Alignment() {
    //alinha a direcao do elemento com a direcao dos demais
    PVector acelAlignment = new PVector(0, 0, 0);

    int cont = 0;
    for (Boid other : boid) {
      if (IsVisible(other)) {
        acelAlignment.add(other.velocidade);
        cont++;
      }
    }

    if (cont > 0) acelAlignment.div(cont);

    acelAlignment.normalize();
    acelAlignment.mult(Fator_Alignment);
    aceleracao.add(acelAlignment);
  }

  void Bound() {
    PVector acelBound = new PVector(0, 0, 0);


    if (posicao.x < muito_perto_parede)
      acelBound.add(1, 0, 0);
    if (posicao.x > width - muito_perto_parede)
      acelBound.sub(1, 0, 0);
    if (posicao.y < muito_perto_parede)
      acelBound.add(0, 1, 0);
    if (posicao.y > height - muito_perto_parede)
      acelBound.sub(0, 1, 0);

    acelBound.normalize();
    acelBound.mult(Fator_bound);
    aceleracao.add(acelBound);
  }

  void center() {
    PVector acellCenter = new PVector(mouseX, mouseY, 0);
    acellCenter.sub(posicao);
    acellCenter.normalize();
    acellCenter.mult(Fator_center);
    aceleracao.add(acellCenter);
  }

  void move() {
    PVector velocidade_antes = new PVector(velocidade.x, velocidade.y, velocidade.z);
    if (aceleracao.mag() > max_aceleracao)
      aceleracao.setMag(max_aceleracao);

    velocidade.add(aceleracao);

    if (velocidade.mag() > max_velocidade)
      velocidade.setMag(max_velocidade);

    float mag = velocidade.mag();
    if (PVector.angleBetween(velocidade, velocidade_antes) > radians(max_steer)) {
      velocidade = PVector.fromAngle(velocidade_antes.heading() + radians(max_steer));
      velocidade.setMag(mag);
    } else if (PVector.angleBetween(velocidade, velocidade_antes) < -radians(max_steer)) {
      velocidade = PVector.fromAngle(velocidade_antes.heading() - radians(max_steer));
      velocidade.setMag(mag);
    }
    
    PVector d_pos = PVector.div(velocidade, time_step);

    posicao.add(d_pos);
    if (posicao.x < 0)
      posicao.x += width;
    if (posicao.x > width)
      posicao.x -= width;
    if (posicao.y < 0)
      posicao.y += height;
    if (posicao.y > height)
      posicao.y -= height;

    aceleracao.set(0, 0, 0);
  }

  void display() {
    pushMatrix();
    translate(posicao.x, posicao.y);
    rotate(velocidade.heading());
    if (bola)
      circle(0, 0, 15);
    else
      shape(Corpo, 0, 0);

    popMatrix();
  }


  boolean IsVisible(Boid other) {
    float d = posicao.dist(other.posicao);
    PVector posicao_relativa = PVector.sub(other.posicao, posicao);
    float ang =  posicao_relativa.heading() - velocidade.heading();
    if (abs(degrees(ang) - 180) < 180-angulo_visao/2) return false;
    if (d > campoVisao) return false;
    if (other.id == id) return false;
    return true;
  }


  void criar_corpo() {
    Corpo = createShape();
    Corpo.beginShape();
    Corpo.fill(167);
    Corpo.stroke(0);
    Corpo.vertex(20, 0);
    Corpo.vertex(-5, -10);
    Corpo.vertex(-5, -5);
    Corpo.vertex(-15, -10);
    Corpo.vertex(-10, 0);
    Corpo.vertex(-15, 10);
    Corpo.vertex(-5, 5);
    Corpo.vertex(-5, 10);
    Corpo.endShape(CLOSE);
    Corpo.scale(0.6);
  }
}
