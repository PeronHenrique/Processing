void hanoi_solve(int n, int start, int end) {
  JSONObject move = new JSONObject();
  if (n == 0) {
    move.setInt("Peça", n);
    move.setInt("Posição", start);
    move.setInt("Destino", end);
    moves.setJSONObject(moves.size(), move);
    return;
  }
  int outro = 3 - start - end;
  hanoi_solve(n-1, start, outro);
  move.setInt("Peça", n);
  move.setInt("Posição", start);
  move.setInt("Destino", end);
  moves.setJSONObject(moves.size(), move);
  hanoi_solve(n-1, outro, end);
}
