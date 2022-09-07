int[] others;

JSONArray hanoi_solve(int n, int start, int end) {
  others = new int[0];
  for (int i = 0; i < n_pinos; i++)
    if (i != start && i != end) 
      others = append(others, i);
      
  HyperDisco Discos = new HyperDisco(n+1, n_pinos-2, 0);
  JSONArray temp = new JSONArray();
  Discos.getMoves(Discos.tamanhos.length-1, start, end, others[n_pinos-3], temp);
  return temp;
}
