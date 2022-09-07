FractalSet fractal;
int fractalW = 500;
int fractalH = 500;
double cx = 0;
double cy = 0;
double scale = 1.0;
PGraphics img;


void setup() {
  size(500, 600);
  colorMode(HSB);
  
  //fractal = new FractalSet(new MandelbrotSet());
  //fractal = new FractalSet(new JuliaSet(-0.70176, -0.3842));
  fractal = new FractalSet(new JuliaSet(-0.8, 0.156));
  //fractal = new FractalSet(new JuliaSet(-0.7269, 0.1889));
  
  
  fractal.calculate(cx, cy, scale);
  img = fractal.getImage();

  textSize(30);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  image(img, 0, 50, fractalW, fractalH);
  text("Fractal: " + fractal.getName() + ".", width/2, 25);
  text("Henrique Peron,  26/03/2022.", width/2, height - 25);
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    cx -= ((mouseX - pmouseX) / (double) fractalW)*2/scale;
    cy += ((mouseY - pmouseY) / (double) fractalH)*2/scale;
  }
  delayCalculate();
}


void mousePressed() {
  if (mouseButton == RIGHT) {
    println(mouseX);
    println(mouseY);
  }
}

void mouseWheel(MouseEvent event) {
  scale += scale * 0.1 * event.getCount();
  delayCalculate();
}
