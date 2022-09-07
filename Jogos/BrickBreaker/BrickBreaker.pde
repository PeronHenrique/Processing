color RED = color(255, 0, 0);
color GREEN = color(0, 255, 0);
color BLUE = color(0, 0, 255);
color YELLOW = color(255, 255, 0);

Ball ball;
Padlle padlle;
Brick[] bricks;

void setup() {
  size(800, 600);
  reset();
}

void draw() {
  background(0);

  ball.display();
  ball.update();

  padlle.display();

  padlle.colide(ball);
  
  for(Brick b : bricks){
    b.display();
    b.colide(ball);
  }
  

  if (ball.morta) {
    reset();
  }
}


void reset() {
  ball = new Ball();
  padlle = new Padlle();

  bricks = new Brick[60];

  for (int i = 0; i < 15; i++) {
    bricks[i*4] = new Brick(50 + 50*i, 100, RED);
    bricks[i*4 + 1] = new Brick(50 + 50*i, 125, YELLOW);
    bricks[i*4 + 2] = new Brick(50 + 50*i, 150, GREEN);
    bricks[i*4 + 3] = new Brick(50 + 50*i, 175, BLUE);
  }
}
