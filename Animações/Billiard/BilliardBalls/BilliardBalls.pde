Board board1;
Board board2;
Board[] boards;
float ts = 0.2;
int frame_rate = round(30/ts);

void setup() {
  size(900, 640);
  frameRate(frame_rate);
  colorMode(HSB);
  boards = new Board[1];
  //boards[0] = new CircleBoard(2, width/2, height/2, 300);
  //boards[0] = new RectangularBoard(50, width, height, 0, 0);
  createBoards();
}

void createBoards() {
  int raioC = 250;
  boards = new Board[3];
  boards[0] = new CircleBoard(20, width-raioC, raioC, raioC);
  boards[1] = new RectangularBoard(20, width - 2*raioC + Board.margem, 640, 0, 0);
  boards[2] = new RectangularBoard(7, 2*raioC, height - 2*raioC + Board.margem, width-2*raioC, 2*raioC - Board.margem);
}

void draw() {
  //println(frameRate);
  background(0);
  for (Board b : boards) {
    if (b != null) {
      b.display();
      b.update();
    }
  }
}
