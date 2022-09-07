class MandelbrotSet implements ColorInterfaceCalculator {

  MandelbrotSet () {
  }

  color setColorAt(double x, double y) {
    int maxIterations = 256;
    int iteration = 0;

    double zx = 0;
    double zy = 0;

    while (iteration < maxIterations) {
      double z2a =  zx * zx - zy * zy ;
      double z2b = 2*zx*zy;
      zx = z2a + x;
      zy = z2b + y;

      if (zx*zx + zy*zy > 4)
        return color(map(iteration, 0, maxIterations, 0, 230), 230, 230);
        //return color(255);

      iteration++;
    }

    return color(0);
  }


  String getName() {
    return "Mandelbrot Set";
  }
}
