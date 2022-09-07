public enum PenColor {
  WHITE(0xFFFFFFFF),
    BLACK(0xFF000000),
    RED(0xFFFF0000),
    GREEN(0xFF00FF00),
    BLUE(0xFF0000FF),
    CYAN(0xFF00FFFF),
    MAGENTA(0xFFFF00FF),
    YELLOW(0xFFFFFF00);

  private int pen;

  private PenColor(int pen) {
    this.pen = pen;
  }

  public int getColor() {
    return pen;
  }
}

public class TurtleAnimator {
  private color pen;
  private ArrayList<PVector> steps;
  private TurtleIterator ti;
  private boolean changed;
  private PGraphics pg;
  private PShape ps;

  public TurtleAnimator(TurtleIterator ti, PenColor pen) {
    changed = false;
    pg = createGraphics(1000, 1000);
    setPenColor(pen);
    this.ti = ti;
    steps = new ArrayList<PVector> (0);
  }

  public void setPenColor(PenColor pen) {
    this.pen = pen.getColor();
  }

  public PGraphics getGraphics () {
    if(!changed) return pg;

    changed = false;

    ps = createShape(PShape.PATH);
    ps.beginShape();
    ps.noFill();
    ps.strokeWeight(1);
    ps.stroke(pen);
    for (PVector s : steps)
      ps.vertex(s.x, s.y);
    ps.endShape();

    
    pg.beginDraw();
    pg.smooth();
    pg.background(0);
    pg.shape(ps);
    pg.endDraw();
    return pg;
  }

  public boolean step() {
    if(ti.hasNext()){
      steps.add(ti.nextStep());
      changed = true;
    }
    
    return changed;
  }
}
