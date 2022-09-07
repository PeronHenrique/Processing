class Solve {
  Piece pieces[] = new Piece[10];
  int quadro[][] = new int [4][5];
  boolean Solved = false;
  String estado = "";
  String mirror = "";
  ArrayList<String> Passos = new ArrayList<String>(0);


  Solve(Solve s) {
    copia(s);
    criar_pecas(s);
  }

  void copia (Solve s) {
    if (s != null)
      for (String p : s.Passos) 
        Passos.add(p);
  }

  void criar_pecas(Solve s) {
    if (s == null) 
      pieces = make(quadro);
    else
      for (int i=0; i < 10; i++) {
        Piece p = s.pieces[i];
        pieces[i] = new Piece(p.tipo, p.x, p.y, quadro);
      }
    atualiza_estados();
    isSolved();
  }

  void atualiza_estados() {
    estado = "";
    mirror = "";
    for (int i=0; i<4; i++) {
      for (int j=0; j<5; j++) {
        estado += quadro[i][j];
        mirror += quadro[3-i][j];
      }
    }
  }

  void isSolved() {
    if (pieces[0].x == 1 && pieces[0].y == 3) Solved = true;
    else Solved = false;
  }

  String[] canMove(int index) {
    String[] Moves = new String[0];
    if (pieces[index].canMove("UP", quadro)) Moves = append(Moves, "UP");
    if (pieces[index].canMove("DOWN", quadro)) Moves = append(Moves, "DOWN");
    if (pieces[index].canMove("LEFT", quadro)) Moves = append(Moves, "LEFT");
    if (pieces[index].canMove("RIGHT", quadro)) Moves = append(Moves, "RIGHT");
    return Moves;
  }

  void move(int index, String dir) {
    pieces[index].move(dir, quadro);
    atualiza_estados();
    isSolved();
    Passos.add(index+","+dir);
  }


  boolean jaVisto() {
    for (String s : Estados_vistos) 
      if (s.equals(estado) || s.equals(mirror))
        return true;

    return false;
  }
}
