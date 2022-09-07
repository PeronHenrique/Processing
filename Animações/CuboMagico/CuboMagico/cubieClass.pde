class Cubie {
  PShape cubie;
  float sizeCubies;
  boolean[] exterior; //R U F L D B//
  PVector rotation;
  PVector rotation_inc;

  Cubie(int i, int j, int k) {
    rotation = new PVector(0,0,0);
    rotation_inc = new PVector(0,0,0);
    exterior = new boolean[6];
    sizeCubies = 400/ordem;
    getFaces(i, j, k);
    makeCubie();

    float x = (i-float(ordem)/2)*sizeCubies*offset;
    float y = (j-float(ordem)/2)*sizeCubies*offset;
    float z = (k-float(ordem)/2)*sizeCubies*offset;
    cubie.translate(x, y, z);
  }

  void getFaces(int i, int j, int k) {
    if (i == 0) exterior[0] = true;
    if (j == 0) exterior[1] = true;
    if (k == 0) exterior[2] = true;
    if (i == ordem-1) exterior[3] = true;
    if (j == ordem-1) exterior[4] = true;
    if (k == ordem-1) exterior[5] = true;
  }

  void makeCubie() {
    cubie = createShape(GROUP);

    PShape temp1 = createShape(); //cor azul
    temp1.beginShape();
    temp1.vertex(0, 0, 0);
    temp1.vertex(0, sizeCubies, 0);
    temp1.vertex(sizeCubies, sizeCubies, 0);
    temp1.vertex(sizeCubies, 0, 0);
    temp1.endShape(CLOSE);
    if (exterior[2]) temp1.setFill(cores[2]);
    else temp1.setFill(color(0));
    cubie.addChild(temp1);

    PShape temp2 = createShape();  //cor verde
    temp2.beginShape();
    temp2.vertex(0, 0, sizeCubies);
    temp2.vertex(0, sizeCubies, sizeCubies);
    temp2.vertex(sizeCubies, sizeCubies, sizeCubies);
    temp2.vertex(sizeCubies, 0, sizeCubies);
    temp2.endShape(CLOSE);
    if (exterior[5]) temp2.setFill(cores[3]);
    else temp2.setFill(color(0));
    cubie.addChild(temp2);

    PShape temp3 = createShape(); //cor amarela
    temp3.beginShape();
    temp3.vertex(0, 0, 0);
    temp3.vertex(0, 0, sizeCubies);
    temp3.vertex(sizeCubies, 0, sizeCubies);
    temp3.vertex(sizeCubies, 0, 0);
    temp3.endShape(CLOSE);
    if (exterior[1]) temp3.setFill(cores[1]);
    else temp3.setFill(color(0));
    cubie.addChild(temp3);

    PShape temp4 = createShape(); //cor branca
    temp4.beginShape();
    temp4.vertex(0, sizeCubies, 0);
    temp4.vertex(0, sizeCubies, sizeCubies);
    temp4.vertex(sizeCubies, sizeCubies, sizeCubies);
    temp4.vertex(sizeCubies, sizeCubies, 0);
    temp4.endShape(CLOSE);
    if (exterior[4]) temp4.setFill(cores[0]);
    else temp4.setFill(color(0));
    cubie.addChild(temp4);

    PShape temp5 = createShape(); //cor vermelha
    temp5.beginShape();
    temp5.vertex(0, 0, 0);
    temp5.vertex(0, sizeCubies, 0);
    temp5.vertex(0, sizeCubies, sizeCubies);
    temp5.vertex(0, 0, sizeCubies);
    temp5.endShape(CLOSE);
    if (exterior[0]) temp5.setFill(cores[4]);
    else temp5.setFill(color(0));
    cubie.addChild(temp5);


    PShape temp6 = createShape(); //cor laranja
    temp6.beginShape();
    temp6.vertex(sizeCubies, 0, 0);
    temp6.vertex(sizeCubies, sizeCubies, 0);
    temp6.vertex(sizeCubies, sizeCubies, sizeCubies);
    temp6.vertex(sizeCubies, 0, sizeCubies);
    temp6.endShape(CLOSE);
    if (exterior[3]) temp6.setFill(cores[5]);
    else temp6.setFill(color(0));
    cubie.addChild(temp6);
  }

  void display() {
    shape(cubie);
  }
  
  void Rotate(float angle, float x, float y, float z){
    cubie.rotate(angle, x, y, z);
    rotation_inc.add(angle*x,angle*y,angle*z);
  }
  
  void setRotation(float angle, float x, float y, float z){
    cubie.rotate(-rotation_inc.x, 1, 0, 0);
    cubie.rotate(-rotation_inc.y, 0, 1, 0);
    cubie.rotate(-rotation_inc.z, 0, 0, 1);
    rotation_inc = new PVector(0,0,0);
    cubie.rotate(angle, x, y, z);
    rotation.add(angle*x,angle*y,angle*z);
  }
}
