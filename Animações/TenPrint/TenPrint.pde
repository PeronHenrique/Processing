private float x; //<>// //<>//
private float y;
private boolean clear;
private boolean runing;

void settings () {
  int sx = Config.SPACING*Config.SIZE_X;
  int sy = Config.SPACING*Config.SIZE_Y;
  size(sx, sy);
}
void setup () {
  background (0);
  stroke(255);
  runing = true;
  initPosition();
}

void draw() {
  if (!runing) {
    noLoop();
    return;
  }

  if (clear) {
    clear = false;
    background (0);
  }

  printPosition();
  nextPosition();
}

void mouseClicked() {
  clear = true;
  runing = true;
  initPosition();
  loop();
}


int spiralLength = 1;
int spiralStep = 0;
int spiralState = 0;

void initPosition() {
  if (Config.DIRECTION == Config.PrintDirection.SPIRAL) {
    x = (Config.SIZE_X/ 2.0 - 0.5) * Config.SPACING;
    y = (Config.SIZE_Y/ 2.0 - 0.5) * Config.SPACING;
    spiralLength = 1;
    spiralStep = 0;
    spiralState = 0;
  } else {
    y = 0;
    x = 0;
  }
}

void nextPosition() {
  switch (Config.DIRECTION) {
  case HORIZONTAL:
  default:
    x += Config.SPACING;
    if (x >= width) {
      x = 0;
      y += Config.SPACING;
      if (y >= height) runing = false;
    }
    break;

  case VERTICAL:
    y += Config.SPACING;
    if (y >= height) {
      y = 0;
      x += Config.SPACING;
      if (x >= width) runing = false;
    }

  case SPIRAL:
    if (y >= height && x >= width) runing = false;

    if (spiralStep < spiralLength) {
      switch(spiralState) {
      case 0:
        x += Config.SPACING;
        break;
      case 1:
        y -= Config.SPACING;
        break;
      case 2:
        x -= Config.SPACING;
        break;
      case 3:
        y += Config.SPACING;
        break;
      }
      spiralStep++;
    } else {
      spiralStep = 0;
      spiralState = (spiralState + 1) % 4;
      if (spiralState % 2 == 0) spiralLength++;
      nextPosition();
    }
    break;
  }
}

void printPosition() {
  pushStyle();
  noFill();
  switch (Config.TYPE) {
  case BARS:
  default:
    if (random(1) < Config.PROBABILITY)
      line(x, y, x+Config.SPACING, y+Config.SPACING);
    else
      line(x, y+Config.SPACING, x+Config.SPACING, y);
    break;

  case CIRCLES:
    if (random(1) < Config.PROBABILITY)
      ellipse(x+Config.SPACING/2, y+Config.SPACING/2, Config.SPACING, Config.SPACING);
    else
      ellipse(x+Config.SPACING/2, y+Config.SPACING/2, Config.SPACING/2, Config.SPACING/2);
    break;

  case SQUARES:
    if (random(1) < Config.PROBABILITY)
      rect(x, y, Config.SPACING, Config.SPACING);
    else
      rect(x+Config.SPACING/4, y+Config.SPACING/4, Config.SPACING/2, Config.SPACING/2);
    break;

  case SQUARES_AND_CIRCLES:
    if (random(1) < Config.PROBABILITY)
      ellipse(x+Config.SPACING/2, y+Config.SPACING/2, Config.SPACING, Config.SPACING);
    else
      rect(x, y, Config.SPACING, Config.SPACING);
    break;

  case DOTS:
    if (random(1) < Config.PROBABILITY)
      strokeWeight(Config.SPACING/1.5);
    else
      strokeWeight(Config.SPACING/3);
    point(x+Config.SPACING/2, y+Config.SPACING/2);
    break;
  }
  popStyle();
}
