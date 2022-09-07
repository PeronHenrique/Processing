Piece pieces[]; //<>//
int quadro[][];
int offsetX = 50;
int offsetY = 50;
boolean finalizou;
String[] Passos;
int passo;
int versao = 32;

void setup() {
  if(versao > 40) versao = 40;
  if(versao < 1) versao = 1;
   //<>//
  finalizou = false;
  Passos = new String[0];
  passo = 0;
  size(400, 475); 
  frameRate(30);
  criate_pieces();
  ler_passos();
}

void draw() {
  displayFundo();
  for (Piece p : pieces)  p.display();

  if (frameCount % 15 == 0 && passo < Passos.length) {
    int index = Passos[passo].charAt(0)-'0';
    String movimento = Passos[passo].substring(2);
    pieces[index].move(movimento);
    passo++;
  } else if (frameCount % 15 == 0 && passo == Passos.length) {
    exit();
  }
}

void ler_passos() {  
  BufferedReader reader = createReader("Soluções/Solucao Klotski "+versao+".txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      Passos = append(Passos, line);
    }
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
} 


void criate_pieces() {
  pieces = new Piece[10];
  quadro = new int[4][5];
  switch(versao) {
  default:
    break;
  case 1:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 0, 2);
    pieces[4] = new Piece(1, 3, 2);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 1, 3);
    pieces[7] = new Piece(3, 2, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 2:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 0, 3);
    pieces[4] = new Piece(1, 3, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 0, 2);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 1, 3);
    pieces[9] = new Piece(3, 2, 3);
    break;
  case 3:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(1, 2, 2);
    pieces[5] = new Piece(2, 0, 4);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 2, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 4:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 0, 3);
    pieces[4] = new Piece(1, 3, 3);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 0, 2);
    pieces[7] = new Piece(3, 1, 2);
    pieces[8] = new Piece(3, 2, 2);
    pieces[9] = new Piece(3, 3, 2);
    break;
  case 5:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(1, 0, 3);
    pieces[4] = new Piece(1, 3, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 1, 3);
    pieces[9] = new Piece(3, 2, 3);
    break;
  case 6:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 3, 2);
    pieces[4] = new Piece(1, 1, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 7:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 2);
    pieces[2] = new Piece(1, 1, 2);
    pieces[3] = new Piece(1, 2, 2);
    pieces[4] = new Piece(1, 3, 2);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 8:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(1, 2, 2);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 9:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(1, 2, 2);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 3, 2);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 10:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 3, 2);
    pieces[4] = new Piece(1, 2, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 1, 3);
    pieces[9] = new Piece(3, 1, 4);
    break;
  case 11:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 1, 3);
    pieces[4] = new Piece(1, 2, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 3, 2);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 12:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 3);
    pieces[2] = new Piece(1, 1, 3);
    pieces[3] = new Piece(1, 2, 3);
    pieces[4] = new Piece(1, 3, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 13:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 3);
    pieces[3] = new Piece(1, 3, 3);
    pieces[4] = new Piece(2, 0, 2);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 2, 2);
    pieces[9] = new Piece(3, 3, 2);
    break;
  case 14:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(2, 0, 4);
    pieces[5] = new Piece(2, 2, 4);
    pieces[6] = new Piece(3, 0, 2);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 0, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 15:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(2, 0, 4);
    pieces[5] = new Piece(2, 2, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 16:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 3, 2);
    pieces[4] = new Piece(2, 1, 2);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 17:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 1, 3);
    pieces[4] = new Piece(2, 0, 2);
    pieces[5] = new Piece(2, 2, 2);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 18:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(2, 1, 2);
    pieces[4] = new Piece(2, 1, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 2);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 0, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 19:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(2, 1, 2);
    pieces[4] = new Piece(2, 1, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 20:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 3, 0);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(2, 1, 2);
    pieces[4] = new Piece(2, 1, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 0, 1);
    pieces[8] = new Piece(3, 3, 2);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 21:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 2);
    pieces[2] = new Piece(1, 1, 2);
    pieces[3] = new Piece(2, 2, 2);
    pieces[4] = new Piece(2, 2, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 22:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(2, 0, 2);
    pieces[4] = new Piece(2, 2, 2);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 23:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(2, 1, 2);
    pieces[4] = new Piece(2, 0, 3);
    pieces[5] = new Piece(2, 2, 3);
    pieces[6] = new Piece(3, 0, 2);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 24:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(2, 0, 2);
    pieces[3] = new Piece(2, 2, 2);
    pieces[4] = new Piece(2, 0, 3);
    pieces[5] = new Piece(2, 2, 3);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 25:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 2);
    pieces[2] = new Piece(2, 2, 2);
    pieces[3] = new Piece(2, 2, 3);
    pieces[4] = new Piece(2, 0, 4);
    pieces[5] = new Piece(2, 2, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 26:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(2, 1, 2);
    pieces[3] = new Piece(2, 0, 3);
    pieces[4] = new Piece(2, 2, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 3, 0);
    pieces[7] = new Piece(3, 3, 1);
    pieces[8] = new Piece(3, 0, 2);
    pieces[9] = new Piece(3, 3, 2);
    break;
  case 27:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(2, 0, 2);
    pieces[2] = new Piece(2, 2, 2);
    pieces[3] = new Piece(2, 0, 3);
    pieces[4] = new Piece(2, 2, 3);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 28:
    pieces[0] = new Piece(4, 1, 1);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 3, 2);
    pieces[4] = new Piece(1, 0, 3);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 1, 0);
    pieces[7] = new Piece(3, 2, 0);
    pieces[8] = new Piece(3, 0, 2);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 29:
    pieces[0] = new Piece(4, 2, 0);
    pieces[1] = new Piece(2, 0, 1);
    pieces[2] = new Piece(2, 0, 2);
    pieces[3] = new Piece(2, 2, 2);
    pieces[4] = new Piece(2, 0, 3);
    pieces[5] = new Piece(2, 2, 3);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 1, 0);
    pieces[8] = new Piece(3, 2, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 30:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 2);
    pieces[2] = new Piece(1, 3, 2);
    pieces[3] = new Piece(1, 1, 3);
    pieces[4] = new Piece(1, 2, 3);
    pieces[5] = new Piece(2, 1, 2);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 3, 0);
    pieces[8] = new Piece(3, 0, 1);
    pieces[9] = new Piece(3, 3, 1);
    break;
  case 31:
    pieces[0] = new Piece(4, 1, 1);
    pieces[1] = new Piece(1, 0, 1);
    pieces[2] = new Piece(1, 3, 1);
    pieces[3] = new Piece(2, 0, 0);
    pieces[4] = new Piece(2, 2, 0);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 32:
    pieces[0] = new Piece(4, 0, 0);
    pieces[1] = new Piece(1, 2, 1);
    pieces[2] = new Piece(1, 0, 2);
    pieces[3] = new Piece(1, 1, 2);
    pieces[4] = new Piece(2, 2, 0);
    pieces[5] = new Piece(2, 1, 4);
    pieces[6] = new Piece(3, 3, 1);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 2, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 33:
    pieces[0] = new Piece(4, 2, 3);
    pieces[1] = new Piece(1, 1, 0);
    pieces[2] = new Piece(1, 2, 0);
    pieces[3] = new Piece(1, 3, 0);
    pieces[4] = new Piece(2, 0, 2);
    pieces[5] = new Piece(2, 0, 3);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 0, 1);
    pieces[8] = new Piece(3, 2, 2);
    pieces[9] = new Piece(3, 3, 2);
    break;
  case 34:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 0, 2);
    pieces[4] = new Piece(1, 1, 2);
    pieces[5] = new Piece(1, 3, 2);
    pieces[6] = new Piece(3, 2, 2);
    pieces[7] = new Piece(3, 2, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 35:
    pieces[0] = new Piece(4, 1, 0);
    pieces[1] = new Piece(1, 0, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(2, 0, 2);
    pieces[4] = new Piece(2, 2, 2);
    pieces[5] = new Piece(2, 1, 3);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 36:
    pieces[0] = new Piece(4, 2, 0);
    pieces[1] = new Piece(1, 3, 3);
    pieces[2] = new Piece(2, 0, 0);
    pieces[3] = new Piece(2, 0, 1);
    pieces[4] = new Piece(2, 0, 2);
    pieces[5] = new Piece(2, 2, 2);
    pieces[6] = new Piece(3, 0, 3);
    pieces[7] = new Piece(3, 2, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 2, 4);
    break;
  case 37:
    pieces[0] = new Piece(4, 0, 0);
    pieces[1] = new Piece(1, 3, 0);
    pieces[2] = new Piece(2, 0, 2);
    pieces[3] = new Piece(2, 2, 2);
    pieces[4] = new Piece(2, 0, 3);
    pieces[5] = new Piece(2, 2, 3);
    pieces[6] = new Piece(3, 2, 0);
    pieces[7] = new Piece(3, 2, 1);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 38:
    pieces[0] = new Piece(4, 0, 0);
    pieces[1] = new Piece(1, 2, 0);
    pieces[2] = new Piece(1, 3, 0);
    pieces[3] = new Piece(1, 0, 3);
    pieces[4] = new Piece(1, 1, 3);
    pieces[5] = new Piece(2, 0, 2);
    pieces[6] = new Piece(3, 2, 2);
    pieces[7] = new Piece(3, 3, 2);
    pieces[8] = new Piece(3, 2, 3);
    pieces[9] = new Piece(3, 3, 3);
    break;
  case 39:
    pieces[0] = new Piece(4, 0, 0);
    pieces[1] = new Piece(1, 0, 2);
    pieces[2] = new Piece(1, 1, 2);
    pieces[3] = new Piece(2, 2, 0);
    pieces[4] = new Piece(2, 2, 1);
    pieces[5] = new Piece(2, 2, 2);
    pieces[6] = new Piece(3, 2, 3);
    pieces[7] = new Piece(3, 3, 3);
    pieces[8] = new Piece(3, 0, 4);
    pieces[9] = new Piece(3, 3, 4);
    break;
  case 40:
    pieces[0] = new Piece(4, 0, 1);
    pieces[1] = new Piece(1, 3, 0);
    pieces[2] = new Piece(1, 2, 1);
    pieces[3] = new Piece(1, 3, 2);
    pieces[4] = new Piece(2, 1, 3);
    pieces[5] = new Piece(2, 2, 4);
    pieces[6] = new Piece(3, 0, 0);
    pieces[7] = new Piece(3, 1, 0);
    pieces[8] = new Piece(3, 2, 0);
    pieces[9] = new Piece(3, 1, 4);
    break;
  }
}


void displayFundo() {
  pushStyle();
  background(#CE9447);

  fill(#83571D);
  rect(offsetX-5, offsetY-5, 310, 385);

  fill(#FF2600, 150);
  rect(offsetX+75, offsetY+225, 150, 150);

  fill(0);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("KLOTSKI", width/2, 20);
  textSize(18);
  popStyle();
}
