public class StarIterator implements TurtleIterator {
  
  private int counter;
  private ArrayList<PVector> path;

  public StarIterator () {
    counter = 0;
    path = new ArrayList<PVector>(0);
    int xi = 0;
    int yi = 380;
    path.add(new PVector(xi, yi));
    createStarPath(xi, yi, 1000, 0);
  }

  private void createStarPath(float x, float y, float tamanho, float angle) {
    if (tamanho < 15) return;
 
    for (int i = 0; i< 5; i++) {
      float newX = x + tamanho * cos(angle);
      float newY = y + tamanho * sin(angle);
      path.add(new PVector(newX, newY));
      angle += radians(144);
      createStarPath(newX, newY, tamanho/3.5, angle);
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
