ArrayList<Solve> Quadros;
ArrayList<String> Estados_vistos;
int versao;

void setup() {
  for (int i=1; i<41; i++) {
    println(i+":");
    versao = i;
    Quadros = new ArrayList<Solve>(0);
    Quadros.add(new Solve(null));
    Estados_vistos = new ArrayList<String>(0);
    Solve();
  }
}

void Solve() {
  while (Quadros.size() > 0) {
    int n_quadros = Quadros.size();
    for (int i=0; i<n_quadros; i++) {
      if (Quadros.get(i).jaVisto()) {
        Quadros.remove(i); 
        i--;
        n_quadros--;
      } else {
        Estados_vistos.add(Quadros.get(i).estado);
      }
    }


    n_quadros = Quadros.size();
    for (int i=0; i<n_quadros; i++) {
      for (int j=0; j<10; j++) {
        String[] moves = Quadros.get(i).canMove(j);
        for (int m=0; m<moves.length; m++) {
          Quadros.add(new Solve(Quadros.get(i)));
          Quadros.get(Quadros.size()-1).move(j, moves[m]);
        }
      }
    }

    for (Solve s : Quadros)
      if (s.Solved) {
        print_Solve(s);
        return;
      }
      
  }
}

void print_Solve(Solve s) {

  PrintWriter output;
  output = createWriter("Soluções/Solucao Klotski " + versao + ".txt"); 
  for (String p : s.Passos) 
    output.println(p); 
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  println("acabou");
}
