int tamanho;
int inicio;
int destino;

final int SELECT_PIN_START = 0;
final int SELECT_PIN_END = 1;
final int SELECT_NUM_DISC = 2;
final int ANIMACAO = 3;
final int WAIT_RESET = 4;
int Etapa = 0;

final int SUBIDA = 0;
final int HORIZONTAL = 1;
final int DESCIDA = 2;
int movimento = 0;

Pino[] pinos = new Pino[3];
Disco[] discos = new Disco[10];

JSONArray moves = new JSONArray();
int Passo_atual = 0;
int[] detalhes_passo_atual = new int[3];  //{disco, inicio, final}
boolean passo_finalizado = true;
int velocidade = 10;


void Config_Animation() {
  discos = new Disco[tamanho+1];
  for (int i = 0; i<discos.length; i++) discos[i] = new Disco(i, inicio);
  for (int i = 0; i<pinos.length; i++)  
    if (pinos[i].id == inicio) pinos[i].q_disco = tamanho;
    
  hanoi_solve(tamanho, inicio, destino);
}




void ler_detalhes_passo() {
  detalhes_passo_atual[0] = moves.getJSONObject(Passo_atual).getInt("Peça");
  detalhes_passo_atual[1] = moves.getJSONObject(Passo_atual).getInt("Posição");
  detalhes_passo_atual[2] = moves.getJSONObject(Passo_atual).getInt("Destino");
}

void Reset() {
  Etapa = 0;
  movimento = 0;
  pinos = new Pino[3];
  discos = new Disco[10];
  for (int i = 0; i<pinos.length; i++)  pinos[i]  = new Pino(i);
  for (int i = 0; i<discos.length; i++) discos[i] = new Disco(i, 1);
  moves = new JSONArray();
  Passo_atual = 0;
  passo_finalizado = true;
}
