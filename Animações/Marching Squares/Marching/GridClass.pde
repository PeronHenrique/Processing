class Grid {
  int nSquares;
  Square[][] squares;
  Point[][] vertices;

  Grid () {
    int nX = floor(GRID_WIDTH/(RESOLUTION*2)); 
    int nY = floor(GRID_HEIGHT/(RESOLUTION*2)); 
    nSquares = 4*nX*nY;
    squares = new Square[nX*2][nY*2];
    vertices = new Point[nX*2+1][nY*2+1];

    for (int i = -nX; i < nX+1; i++)
      for (int j = -nY; j < nY+1; j++) {
        vertices[i+nX][j+nY] = new Point(i, j);
        expression.evaluate(vertices[i+nX][j+nY]);
        if (i < nX && j < nY)
          squares[i+nX][j+nY] = new Square(i, j);
      }
  }

  void display() {
    pushStyle();

    for (int i = 0; i < vertices.length; i++)
      for (int j = 0; j < vertices[0].length; j++) {
        if(displayVertices) vertices[i][j].display(); 
        if (i < vertices.length-1 && j < vertices[0].length-1)
          squares[i][j].display();
      }

    noFill();
    stroke(255);
    rect(MARGIN*0.75, MARGIN*0.75, GRID_WIDTH + MARGIN*0.5, GRID_HEIGHT + MARGIN*0.5);
    popStyle();
  }

  void update () {
    if (step == nSquares) {
      step = -1;
      int nX = floor(GRID_WIDTH/(RESOLUTION*2)); 
      int nY = floor(GRID_HEIGHT/(RESOLUTION*2)); 
      for (int i = -nX; i < nX; i++)
        for (int j = -nY; j < nY; j++) {
          squares[i+nX][j+nY] = new Square(i, j);
        }
      return;
    }

    int x = step % squares.length;
    int y = step / squares.length;
    squares[x][y].update(vertices, x, y);

    pushStyle();
    stroke(YELLOW);
    strokeWeight(1);
    noFill();
    rect(x*RESOLUTION + MARGIN, height - (y*RESOLUTION + 2*MARGIN), RESOLUTION, -RESOLUTION);
    popStyle();
  }
}
