final color CIRCLE = #1FCE3D;
final color POINT1 = #CE1FBD;
final color POINT2 = #F0EA41;
final color POINT3 = #FF1C24;
final color POINT4 = #4EC2D6;

final int canvaWidth = 300;
final int raio = 110;
final int points = 800;

final int pointSize = 4;

void settings() {
  size(2*canvaWidth, 2*canvaWidth);
}

void setup() {
  reset();
  frameRate(100);
}

void draw() {
  if (frameCount % points == 0) reset();
  choosePointRejectingSampling();
  choosePointPolar();
  choosePointSquareRoot();
  choosePointReflectingSum();
}


void reset() {
  background(0);

  pushStyle();
  fill(0);
  strokeWeight(5);
  stroke(CIRCLE);
  ellipseMode(RADIUS);
  ellipse(canvaWidth/2, canvaWidth/2, raio, raio);
  ellipse(3*canvaWidth/2, canvaWidth/2, raio, raio);
  ellipse(canvaWidth/2, 3*canvaWidth/2, raio, raio);
  ellipse(3*canvaWidth/2, 3*canvaWidth/2, raio, raio);
  popStyle();

  pushStyle();
  stroke(255);
  strokeWeight(2);
  line(0, canvaWidth, width, canvaWidth);
  line(canvaWidth, 0, canvaWidth, height);
  popStyle();

  pushStyle();
  pushMatrix();
  translate(0, 20);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(25);
  text("Rejecting Sampling", canvaWidth/2, 0);
  text("Polar Coordinates", 3*canvaWidth/2, 0);
  text("Square Root", canvaWidth/2, canvaWidth);
  text("Reflecting Sum", 3*canvaWidth/2, canvaWidth);
  popMatrix();
  popStyle();


  text("Henrique Peron 07/09/2022", 7, height-15);
}
