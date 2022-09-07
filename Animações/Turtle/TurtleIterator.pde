public interface TurtleIterator {
  public PVector nextStep();
  public boolean hasNext();
}

public class TestIterator implements TurtleIterator {
  private int counter;

  public TestIterator () {
    counter = 0;
  }

  public PVector nextStep() {
    PVector pv = new PVector(counter*10, counter*10);
    counter++;
    return pv;
  }

  public boolean hasNext(){
    return counter < 101;
  }
}
