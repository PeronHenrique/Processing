class JuliaSet implements ColorInterfaceCalculator {
  float a;
  float b;

  JuliaSet (float a, float b) {
    this.a = a;
    this.b = b;
  }

  color setColorAt(double x, double y) {
    int maxIterations = 256;
    int iteration = 0;

    double zx = x;
    double zy = y;

    while (iteration < maxIterations) {
      double z2a =  zx * zx - zy * zy ;
      double z2b = 2*zx*zy;
      zx = z2a + a;
      zy = z2b + b;

      if (zx*zx + zy*zy > 4)
        return color(map(iteration, 0, maxIterations, 0, 230), 230, 230);
        
      iteration++;
    }

    return color(0);
  }


  String getName() {
    return "Julia Set with " +  nf(a, 1, 4) + " " + nfs(b, 1, 4) + "i";
  }
}
