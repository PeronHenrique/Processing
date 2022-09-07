class Grid {
  Expression expression;

  int nSquares;
  Square[][] squares;
  Point[][] vertices;
  int nX;
  int nY;

  Grid (Expression expression) {
    this.expression = expression;

    nX = floor(GRID_WIDTH/RESOLUTION);
    nY = floor(GRID_HEIGHT/RESOLUTION);
    nSquares = nX*nY;

    squares = new Square[nX][nY];
    vertices = new Point[nX+1][nY+1];

    for (int i = 0; i < nX+1; i++)
      for (int j = 0; j < nY+1; j++) {
        vertices[i+nX][j+nY] = new Point(i*RESOLUTION, j*RESOLUTION);
        if (i < nX && j < nY)
          squares[i+nX][j+nY] = new Square(i, j);
      }

    update();
  }

  void display() {
    pushStyle();
    for (int i = 0; i < nX; i++)
      for (int j = 0; j < nY; j++)
        squares[i][j].display();

    noFill();
    stroke(255);
    rect(MARGIN*0.75, MARGIN*0.75, GRID_WIDTH + MARGIN*0.5, GRID_HEIGHT + MARGIN*0.5);
    popStyle();
  }

  void update () {
    for (int i = 0; i < nX+1; i++) {
      for (int j = 0; j < nY+1; j++) {
        vertices[i+nX][j+nY].evaluate(expression);
        if (i > 0 && j > 0)
          squares[i-1][j-1].update(vertices, expression);
      }
    }
  }
}
