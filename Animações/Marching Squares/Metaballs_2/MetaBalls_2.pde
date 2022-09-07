final float RESOLUTION = 4;

final int GRID_WIDTH = 600;
final int GRID_HEIGHT = 400;
final int MARGIN = 30;

final color YELLOW = color(255, 255, 120);
Grid grid;


void settings() {
  size(GRID_WIDTH + 2*MARGIN, GRID_HEIGHT + 3*MARGIN);
}

void setup() {
  grid = new Grid(new Soma());
}


void draw() {
  background(0);
  grid.display();
  printText();
  grid.update();
  noLoop();
}

void printText() {
  pushStyle();
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(MARGIN*.8);
  text("Henrique Peron, 04/2022", MARGIN, height-MARGIN);
  popStyle();
}
