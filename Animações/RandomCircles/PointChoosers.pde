 //<>//
void  choosePointRejectingSampling() {

  float x = 0, y = 0;

  while (sq(x - canvaWidth/2) + sq(y - canvaWidth/2) > sq(raio)) {
    x = random(canvaWidth);
    y = random(canvaWidth);
  }

  pushStyle();
  stroke(POINT1);
  strokeWeight(pointSize);
  point(x, y);
  popStyle();
}

void  choosePointPolar() {
  float r = random(raio);
  float t = random(TWO_PI);

  float x = r*cos(t) + 3*canvaWidth/2;
  float y = r*sin(t) + canvaWidth/2;

  pushStyle();
  stroke(POINT2);
  strokeWeight(pointSize);
  point(x, y);
  popStyle();
}


void  choosePointSquareRoot() {
  float r = raio*sqrt(random(1));
  float t = random(TWO_PI);

  float x = r*cos(t) + canvaWidth/2;
  float y = r*sin(t) + 3*canvaWidth/2;

  pushStyle();
  stroke(POINT3);
  strokeWeight(pointSize);
  point(x, y);
  popStyle();
}


void  choosePointReflectingSum() {
  float r = random(1) + random(1);
  if (r >= 1) r = 2 - r;
  
  r *= raio;
  float t = random(TWO_PI);

  float x = r*cos(t) + 3*canvaWidth/2;
  float y = r*sin(t) + 3*canvaWidth/2;

  pushStyle();
  stroke(POINT4);
  strokeWeight(pointSize);
  point(x, y);
  popStyle();
}
