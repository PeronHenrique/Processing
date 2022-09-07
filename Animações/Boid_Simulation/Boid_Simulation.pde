Botao Trajetos;
Botao Bola;
Botao Pause;
Botao Exit;

Boid[] boid;
ArrayList<Trajeto> pontos;
int tamanho_boid = 100;
boolean bola = false;
boolean trajetos = false;
boolean Pausado = false;
int time_step = 10;

int campoVisao = 150;
int angulo_visao = 250;
int muito_perto = 30;
int muito_perto_parede = 30;
int muito_longe = 80;
float max_velocidade = 40;  
float max_aceleracao = 3;
int max_steer = 360; //angulo maximo de rotação decada boid

float Fator_Cohesion = 0.7;
float Fator_Separation = 2;
float Fator_Alignment = 0.5;
float Fator_bound = 1;
float Fator_center = 2;


void setup() {
  size(1200, 620);
  //frameRate(25);

  boid = new Boid[tamanho_boid];

  for (int i=0; i<tamanho_boid; i++) {
    boid[i] = new Boid(i);
  }

  Trajetos = new Botao(170, height-30, 300, 50, color(80), "Desenhar trajetos");
  Bola = new Botao(width-170, height-30, 300, 50, color(80), "Desenhar peixinho");
  Pause = new Botao(width/2, height-30, 35, 35, color(80), "| |");
  Exit = new Botao(20, 20, 35, 35, color(230, 0, 0), "X");
}

void draw() {
  background(0, 150, 150);
  //println("Frame Rate: " + frameRate);

  for (Boid b : boid) { 
    b.Cohesion();
    b.Separation();
    b.Alignment();
    //b.Bound();
    if (mousePressed && !Trajetos.IsPressed() && !Bola.IsPressed() && !Pause.IsPressed() && !Exit.IsPressed())
      b.center();
  }



  if (pontos != null) {
    for (int i =0; i<pontos.size(); i++) {
      if (pontos.get(i).lifespan > 0)
        pontos.get(i).display();
      else {
        pontos.remove(i); 
        i--;
      }
    }
  }
  
  for (Boid b : boid) {
    b.move();
    b.display();
    if (trajetos == true)
      pontos.add(new Trajeto(b.posicao.x, b.posicao.y));
  }

  Bola.display();
  Trajetos.display();
  Pause.display();
  Exit.display();
}

void mousePressed() {
  if (Bola.IsPressed()) {
    if (bola) bola = false;
    else bola = true;
  }

  if (Trajetos.IsPressed()) {
    if (trajetos) {
      trajetos = false;
      pontos = null;
    } else { 
      trajetos = true;
      pontos  = new ArrayList<Trajeto>(0);
    }
  }

  if (Pause.IsPressed()) {
    if (Pausado) {
      Pausado = false;
      loop();
    } else { 
      Pausado = true;
      noLoop();
    }
  }

  if (Exit.IsPressed()) exit();
}
