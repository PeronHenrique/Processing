PImage foto;
Retrato[][] imagens;
PImage tela;

int iteracao = 0;
int n_iteracoes = 9;
int passo_iteracao = 0;
int n_passos = 20;
boolean fimIteracao = true;



void setup () {

  size(256, 286);
  background(0);
  textSize(15);
  text("Henrique Peron, 28/11/2020", 5, 276);

  //foto = loadImage("pinguim.png");
  //foto = loadImage("nebulosa.png");
  foto = loadImage("Gato.jpg");
  //foto = loadImage("foto.jpg");


  foto.resize(256, 256);

  image(foto, 0, 0);
  tela = get();

  frameRate(20);
}

void draw() {

  if (fimIteracao) {
    criarImagens();
  } else {
    moverImagens();
  }

}
