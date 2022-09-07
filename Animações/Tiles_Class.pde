class Tile {
  float x_atual;
  float y_atual;
  String direcao;
  boolean vai_colidir;


  Tile(int x_, int y_, String direcao_) {
    x_atual = x_;
    y_atual = y_;
    direcao = direcao_;
  }

  void expande_posicao() {
    x_atual++;
    y_atual++;

  }


  void compara() {
    switch(direcao) {
    case "DIREITA":
      for (Tile t : tiles) 
        if (round(t.x_atual) == round(x_atual+1) && round(t.y_atual) == round(y_atual) && t.direcao.equals("ESQUERDA"))
          vai_colidir = true;     
      break;
    case "ESQUERDA":
      for (Tile t : tiles) 
        if (round(t.x_atual) == round(x_atual-1) && round(t.y_atual) == round(y_atual) && t.direcao.equals("DIREITA"))
          vai_colidir = true;  
      break;
    case "CIMA":
      for (Tile t : tiles) 
        if (round(t.x_atual) == round(x_atual) && round(t.y_atual) == round(y_atual-1) && t.direcao.equals("BAIXO"))
          vai_colidir = true;  
      break;
    case "BAIXO":
      for (Tile t : tiles) 
        if (round(t.x_atual) == round(x_atual) && round(t.y_atual) == round(y_atual+1) && t.direcao.equals("CIMA"))
          vai_colidir = true;  
      break;
    default:
      break;
    }
  }

  void display_colorido(int transparencia) {
    pushMatrix();
    pushStyle();
    switch(direcao) {
    case "DIREITA":
      fill(255, 0, 0, transparencia);
      rect(x_atual*tile_size, y_atual*tile_size, tile_size, 2*tile_size);
      break;
    case "ESQUERDA":
      fill(255, 255, 0, transparencia);
      rect(x_atual*tile_size, y_atual*tile_size, tile_size, 2*tile_size);
      break;
    case "CIMA":
      fill(0, 0, 255, transparencia);
      rect(x_atual*tile_size, y_atual*tile_size, 2*tile_size, tile_size);
      break;
    case "BAIXO":
      fill(0, 255, 0, transparencia);
      rect(x_atual*tile_size, y_atual*tile_size, 2*tile_size, tile_size);
      break;
    default:
      break;
    }
    popStyle();
    popMatrix();
  }

  void display_Arrow() {
    pushMatrix();
    pushStyle();
    if (vai_colidir) fill(#FCA93B);
    else fill(222, 210, 200);
    switch(direcao) {
    case "DIREITA":
      if (estado == 4)
        x_atual += 0.05;
      rect(x_atual*tile_size, y_atual*tile_size, tile_size, 2*tile_size);
      translate((x_atual+.5)*tile_size, (y_atual+1)*tile_size);
      rotate(0);
      arrow();
      break;
    case "ESQUERDA":  
      if (estado == 4) 
        x_atual -= 0.05;
      rect(x_atual*tile_size, y_atual*tile_size, tile_size, 2*tile_size);
      translate((x_atual+.5)*tile_size, (y_atual+1)*tile_size);
      rotate(PI);
      arrow();
      break;
    case "CIMA":
      if (estado == 4)
        y_atual -= 0.05;
      rect(x_atual*tile_size, y_atual*tile_size, 2*tile_size, tile_size);
      translate((x_atual+1)*tile_size, (y_atual+.5)*tile_size);
      rotate(-PI/2);
      arrow();
      break;
    case "BAIXO":
      if (estado == 4) 
        y_atual += 0.05;
      rect(x_atual*tile_size, y_atual*tile_size, 2*tile_size, tile_size);
      translate((x_atual+1)*tile_size, (y_atual+.5)*tile_size);
      rotate(PI/2);
      arrow();
      break;
    default:
      break;
    }
    popStyle();
    popMatrix();
    if (!vai_colidir) display_colorido(90);
  }

  private void arrow() {
    fill(0);
    stroke(0);
    strokeWeight(tile_size*.05);
    line(0, 0, -tile_size*.3, 0);
    noStroke();
    triangle(0, -tile_size*.2, 0, tile_size*.2, tile_size*.4, 0);
  }
}
