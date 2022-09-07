void expande() { //<>// //<>// //<>// //<>//
  if (expandir) {
    expandir = false;
    dimensao++;
    display_background();

    for (Tile t : tiles) {
      t.expande_posicao();
      t.display_colorido(255);
    }
  }
  
  estagio_animacao--;
  if (estagio_animacao == 0) {
    expandir = true;
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}



void mostra_direcao() {
  for (Tile t : tiles) {
    t.display_Arrow();
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void destaca_conflitos() {
  for (Tile t : tiles) {
    t.compara();
    t.display_Arrow();
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void elimina_conflitos() {
  for (int i=0; i<tiles.size(); i++) {
    if (tiles.get(i).vai_colidir) {
      tiles.remove(tiles.get(i));
      i--;
    }
  }

  display_background();

  for (Tile t : tiles) {
    t.display_Arrow();
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void movimenta() {
  display_background();
  for (Tile t : tiles) {
    t.display_Arrow();
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void destaca_buracos() {
  pushStyle();
  loadPixels();
  fill(255, 140, 0);
  strokeWeight(map(tile_size, width/2, 0, 5, 1));
  for (int i=0; i<dimensao*2; i++) {
    for (int j=0; j<dimensao*2; j++) {
      float offset = map(tile_size, width/2, 0, 5, 1) + 1;
      color pixel = pixels[round(j*tile_size+offset)*width + round(offset + i*tile_size)];
      if (pixel == color(240)) {
        rect(i*tile_size, j*tile_size, 2*tile_size, 2*tile_size);
        loadPixels();
      }
    }
  }
  popStyle();


  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void preenche_buracos() {
  for (int i=0; i<dimensao*2; i++) {
    for (int j=0; j<dimensao*2; j++) {
      float offset = map(tile_size, width/2, 0, 5, 1) + 1;
      color pixel = pixels[round(j*tile_size+offset)*width + round(offset + i*tile_size)];
      if (pixel == color(255, 140, 0)) {
        fill_2x2(i, j);
        tiles.get(tiles.size()-1).display_Arrow();
        tiles.get(tiles.size()-2).display_Arrow();
        loadPixels();
      }
    }
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void colorir() {
  //display_background();
  for (Tile t : tiles) {
    t.display_colorido(255);
  }

  estagio_animacao--;
  if (estagio_animacao == 0) {
    estagio_animacao = 20;
    estado = (estado + 1) % 8;
    if (pausado) noLoop();
  }
}


void fill_2x2(int x, int y) {
  if (random(1) < 0.5) {
    tiles.add(new Tile(x, y, "ESQUERDA"));
    tiles.add(new Tile(x+1, y, "DIREITA"));
  } else {
    tiles.add(new Tile(x, y, "CIMA"));
    tiles.add(new Tile(x, y+1, "BAIXO"));
  }
}


void display_background() {
  pushStyle();
  background(0); 
  tile_size = width/float(2*dimensao);
  strokeWeight(map(tile_size, width/2, 0, 5, 1));
  for (int i=0; i<dimensao*2; i++) {
    for (int j=0; j<dimensao*2; j++) {
      if (j+i > dimensao-2 && j+i < 3*dimensao && i-j < dimensao+1 && i-j > -(dimensao+1)) {
        fill(240);
        rect(i*tile_size, j*tile_size, tile_size, tile_size);
      }
    }
  }
  popStyle();
}
