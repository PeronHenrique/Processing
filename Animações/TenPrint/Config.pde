static class Config {
  enum PrintDirection {
    HORIZONTAL,
      VERTICAL,
      SPIRAL,
  }

  enum PrintType {
    BARS,
      CIRCLES,
      SQUARES,
      SQUARES_AND_CIRCLES,
      DOTS,
  }


  static final float PROBABILITY = 0.5;
  static final int SPACING = 20;
  static final int SIZE_X = 15;
  static final int SIZE_Y = 15;
  static final PrintDirection DIRECTION = PrintDirection.SPIRAL;
  static final PrintType TYPE = PrintType.DOTS;
}
