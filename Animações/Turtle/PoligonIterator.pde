public class PoligonIterator implements TurtleIterator {
  private int[] pX = {100, 100, 200, 250, 270, 300, 330, 350};
  private int[] pY = {100, 100,  50, 70, 20, 20, 30, 30};
  private int[] t = {800, 800, 600, 500, 440, 400, 340, 300};
  private float[] d = {2.0, 2.0, 2.60, 3, 3.25, 3.41, 3.89, 4.2};
  
  
  private int counter;
  private ArrayList<PVector> path;
  private int sides;

  public PoligonIterator (int sides) {
    this.sides = sides;
    if (sides < 3) this.sides = 3;
    if (sides > 10) this.sides = 10;
    counter = 0;
    path = new ArrayList<PVector>(0);
    path.add(new PVector(pX[this.sides-3], pY[this.sides-3]));
    createPoligonPath(pX[this.sides-3], pY[this.sides-3], t[this.sides-3], 0);
  }

  private void createPoligonPath(float x, float y, float tamanho, float angle) {
    if (tamanho < 3) return;

    for (int i = 0; i< sides; i++) {
      float newX = x + tamanho * cos(angle);
      float newY = y + tamanho * sin(angle);
      path.add(new PVector(newX, newY));
      angle += radians(360/(float) sides);
      createPoligonPath(newX, newY, tamanho/d[sides-3], angle);
      x = newX;
      y = newY;
    }
  }

  public PVector nextStep() {
    PVector pv = path.get(counter);
    counter++;
    return pv;
  }

  public boolean hasNext() {
    return counter < path.size();
  }
}
