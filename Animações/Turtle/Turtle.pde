TurtleAnimator ta;

public enum Animation {
  TEST,
    POLIGON,
    STAR;
}

Animation tipe = Animation.TEST;
int sides = 3;
boolean saveFoto = false;
PenColor pen = PenColor.YELLOW;


public void setup() {
  size(600, 600);
  switch(tipe) {
  case TEST:
    ta = new TurtleAnimator(new TestIterator(), pen);
    break;

  case POLIGON:
    ta = new TurtleAnimator(new PoligonIterator(sides), pen);
    break;

  case STAR:
    ta = new TurtleAnimator(new StarIterator(), pen);
    break;

  default:
    exit();
    break;
  }
}

public void draw() {
  for (int i = 0; i < 1; i++)
    if (!ta.step()) {
      if (saveFoto)
        exitAnimation();
      noLoop();
      break;
    }
  image(ta.getGraphics(), 0, 0, width, height);
}

public void exitAnimation() {
  if (tipe == Animation.POLIGON)
    ta.getGraphics().save("data/Poligon " + sides + ".png");
  if (tipe == Animation.STAR)
    ta.getGraphics().save("data/Star.png");
  println("done!!");
  exit();
}
