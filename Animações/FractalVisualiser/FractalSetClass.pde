class FractalSet { //<>//
  PGraphics img;
  ColorInterfaceCalculator colorInterface;

  
  FractalSet(ColorInterfaceCalculator colorInterface) {
    img = createGraphics(fractalW, fractalH);
    this.colorInterface = colorInterface;
  }


  void calculate(double cx, double cy, double scale) {
    double inicioX = cx - 1/scale;
    double finalX = cx + 1/scale;
    double inicioY = cy + 1/scale;
    double finalY = cy - 1/scale;

    img.beginDraw();
    img.background(0);
    img.loadPixels();

    for (int i = 0; i < img.width; i++) {
      for (int j = 0; j < img.width; j++) {
        double x = map(i, 0, img.width, inicioX, finalX);
        double y = map(j, 0, img.height, inicioY, finalY);
        img.pixels[i + j * img.width] = colorInterface.setColorAt(x, y);
      }
    }

    img.updatePixels();
    img.endDraw();

    println("x from: " + inicioX + " to: " + finalX);
    println("y from: " + inicioY + " to: " + finalY);
    println("done!");
  }
  
  
  double map(double value, double start1, double stop1, double start2, double stop2){
    double percent = value /(stop1 - start1);
    return start2 + percent * (stop2 - start2);
  }

  String getName() {
    return colorInterface.getName();
  }

  PGraphics getImage() {
    return img;
  }
}
