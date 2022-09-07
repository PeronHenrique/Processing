final float RESOLUTION = 4;

final int GRID_WIDTH = 600;
final int GRID_HEIGHT = 400;
final int MARGIN = 30;

//final int STEPS = GRID_WIDTH*GRID_HEIGHT/4;
final int STEPS = 1;

final color BLUE = color(120, 120, 255);
final color YELLOW = color(255, 255, 120);
boolean displayVertices = false;

Grid grid;
Expression expression;


void settings() {
  size(GRID_WIDTH + 2*MARGIN, GRID_HEIGHT + 3*MARGIN);
}

void setup() {
  //expression = new FcAfim(2/3.0, 0);
  //expression = new FcAfim(0.66, 0.0);
  //expression = new Ellipse(0.75, 0.5, 2);
  //expression = new Hiperbole(0.5, 0.5, 1);
  expression = new Soma(0.5, 0.5, 1);

  grid = new Grid();
}

int step = 0;
void draw() {
  background(0);

  grid.display();
  printText();
  for (int i = 0; i < STEPS; i++) {
    grid.update();
    step++;
  }
}

void printText() {
  pushStyle();
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(MARGIN*.8);
  text("Henrique Peron, 11/2021", MARGIN, height-MARGIN);
  popStyle();
}
