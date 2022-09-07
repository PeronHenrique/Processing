class Square { //<>//
  int x, y;
  ArrayList<Line> lines;


  Square (int x, int y) {
    this.x = x;
    this.y = y;
    lines = new ArrayList<Line>(0);
  }

  void update(Point[][] v, int i, int j) {
    Point TL = v[i][j];
    Point TR = v[i+1][j];
    Point DL = v[i][j+1];
    Point DR = v[i+1][j+1];
    boolean T = false, D = false, R = false, L = false;
    int n = 0;

    if (isIntersection(TL.value, TR.value)) { 
      T = true; 
      n++;
    }
    if (isIntersection(DL.value, DR.value)) { 
      D = true; 
      n++;
    }
    if (isIntersection(TL.value, DL.value)) { 
      L = true; 
      n++;
    }
    if (isIntersection(TR.value, DR.value)) { 
      R = true; 
      n++;
    }

    if (n == 0) return;

    if (n == 1) {
      if (T) {
        PVector p1 = new PVector(lerp(TL, TR, 'x'), TL.y);
        if (DR.value == 0) {
          PVector p2 = new PVector(DR.x, DR.y);
          lines.add(new Line(p1, p2));
          return;
        }
        if (DL.value == 0) {
          PVector p2 = new PVector(DL.x, DL.y);
          lines.add(new Line(p1, p2));
          return;
        }
      }

      if (D) {
        PVector p1 = new PVector(lerp(DL, DR, 'x'), DL.y);
        if (TR.value == 0) {
          PVector p2 = new PVector(TR.x, TR.y);
          lines.add(new Line(p1, p2));
          return;
        }
        if (TL.value == 0) {
          PVector p2 = new PVector(TL.x, TL.y);
          lines.add(new Line(p1, p2));
          return;
        }
      }

      if (L) {
        PVector p1 = new PVector(TL.x, lerp(TL, DL, 'y'));
        if (DR.value == 0) {
          PVector p2 = new PVector(DR.x, DR.y);
          lines.add(new Line(p1, p2));
          return;
        }
        if (TR.value == 0) {
          PVector p2 = new PVector(TR.x, TR.y);
          lines.add(new Line(p1, p2));
          return;
        }
      }

      if (R) {
        PVector p1 = new PVector(TR.x, lerp(TR, DR, 'y'));
        if (TL.value == 0) {
          PVector p2 = new PVector(TL.x, TL.y);
          lines.add(new Line(p1, p2));
          return;
        }
        if (DL.value == 0) {
          PVector p2 = new PVector(DL.x, DL.y);
          lines.add(new Line(p1, p2));
          return;
        }
      }
    }

    if (n == 2) {
      if (T) {
        PVector p1 = new PVector(lerp(TL, TR, 'x'), TL.y);
        if (D) {          
          PVector p2 = new PVector(lerp(DL, DR, 'x'), DL.y);
          lines.add(new Line(p1, p2));
          return;
        }
        if (R) {
          PVector p2 = new PVector(TR.x, lerp(TR, DR, 'y'));
          lines.add(new Line(p1, p2));
          return;
        }
        if (L) {
          PVector p2 = new PVector(TL.x, lerp(TL, DL, 'y'));
          lines.add(new Line(p1, p2));
          return;
        }
      }

      if (D) {
        PVector p1 = new PVector(lerp(DL, DR, 'x'), DL.y);
        if (R) {
          PVector p2 = new PVector(TR.x, lerp(TR, DR, 'y'));
          lines.add(new Line(p1, p2));
          return;
        }
        if (L) {
          PVector p2 = new PVector(TL.x, lerp(TL, DL, 'y'));
          lines.add(new Line(p1, p2));
          return;
        }
      }

      if (R) {
        PVector p1 = new PVector(TR.x, lerp(TR, DR, 'y'));
        PVector p2 = new PVector(TL.x, lerp(TL, DL, 'y'));
        lines.add(new Line(p1, p2));
        return;
      }
    }

    if (n == 4) {
      Point C = new Point((TL.x+DR.x)/(2*RESOLUTION), (TL.y+DR.y)/(2*RESOLUTION));
      expression.evaluate(C);

      if (isIntersection(TR.value, C.value)) {
        PVector p1 = new PVector(lerp(TL, TR, 'x'), TL.y);
        PVector p2 = new PVector(TL.x, lerp(TL, DL, 'y'));
        lines.add(new Line(p1, p2));

        p1 = new PVector(lerp(DL, DR, 'x'), DL.y);
        p2 = new PVector(TR.x, lerp(TR, DR, 'y'));
        lines.add(new Line(p1, p2));
      } else {
        PVector p1 = new PVector(lerp(TL, TR, 'x'), TL.y);
        PVector p2 = new PVector(TR.x, lerp(TR, DR, 'y'));
        lines.add(new Line(p1, p2));

        p1 = new PVector(lerp(DL, DR, 'x'), DL.y);
        p2 = new PVector(TL.x, lerp(TL, DL, 'y'));
        lines.add(new Line(p1, p2));
      }
      return;
    }
    
    println("DODO");
  } 

  boolean isIntersection(float a, float b) {
    return a*b < 0;
  }

  float lerp(Point A, Point B, char c) {
    float av = A.value;
    float bv = B.value;
    float ap = 0, bp = 0;
    if (c == 'x') {
      ap = A.x;
      bp = B.x;
    }
    if (c == 'y') {
      ap = A.y;
      bp = B.y;
    }

    return ap + (bp-ap)/(av-bv)*av;
  }


  void display() {
    pushMatrix();
    translate(MARGIN + GRID_WIDTH/2, MARGIN + GRID_HEIGHT/2);
    for (Line l : lines) l.display();
    popMatrix();
  }
}



class Line {

  PVector p1, p2;
  Line(PVector p1, PVector p2) {
    this.p1 = p1;
    this.p2 = p2;
  }


  void display() {
    pushStyle();
    strokeWeight(1);
    stroke(YELLOW);
    line(p1.x, -p1.y, p2.x, -p2.y);
    popStyle();
  }
}
