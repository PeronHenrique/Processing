float cx = 0;      // circle position (set with mouse)
float cy = 0;
float r = 30;      // circle radius

float sx = 200;    // square position
float sy = 100;
float sw = 200;    // and dimensions
float sh = 200;


void setup() {
  size(600, 400);
  noStroke();
  stroke(0);
}


void draw() {
  background(255);

  // update square to mouse coordinates
  cx = mouseX;
  cy = mouseY;

  // check for collision
  // if hit, change rectangle color
  //boolean hit = circleRect(cx,cy,r, sx,sy,sw,sh);
  boolean hit = isColiding();
  if (hit) {
    fill(255, 150, 0);
  } else {
    fill(0, 150, 255);
  }
  rect(sx, sy, sw, sh);


  line(0, sy, width, sy);
  line(0, sy+sh, width, sy+sh);
  line(sx, 0, sx, height);
  line(sx+sw, 0, sx+sw, height);

  // draw the circle
  fill(0, 150);
  ellipse(cx, cy, r*2, r*2);
}








class mRect {
  PVector A;
  PVector B;
  PVector C;
  PVector D;

  mRect (PVector A, PVector B, PVector C, PVector D) {
    this.A = A;
    this.B = B;
    this.C = C;
    this.D = D;
  }
}

class mCircle {
  PVector P;
  float R;

  mCircle (PVector P, float R) {
    this.P = P;
    this.R = R;
  }
}

boolean isColiding() {
  PVector P = new PVector(cx, cy); 
  float R = r;
  //A = TL, B = BL, C = BR, D = TR;
  PVector A = new PVector(sx, sy);
  PVector B = new PVector(sx, sy+sh);
  PVector C = new PVector(sx+sw, sy+sh);
  PVector D = new PVector(sx+sw, sy);

  mCircle S = new mCircle(P, R);

  return(pointInRect(P, new mRect(A, B, C, D)) ||  
    lineIntersectCircle(S, A, B) ||  
    lineIntersectCircle(S, B, C) ||  
    lineIntersectCircle(S, C, D) ||  
    lineIntersectCircle(S, D, A));
}


boolean pointInRect(PVector P, mRect R) {
  //A = TL, B = BL, C = BR, D = TR;
  if (P.x < R.A.x) return false;
  if (P.x > R.C.x) return false;
  if (P.y < R.A.y) return false;
  if (P.y > R.C.y) return false;
  return true;
}

boolean lineIntersectCircle(mCircle S, PVector A, PVector B) {
  PVector D = B.copy().sub(A);
  PVector C = S.P.copy().sub(A);
  float d = C.dot(D.copy().normalize());

  PVector N = C.copy().sub(D.copy().setMag(d));

  if (N.mag() < S.R) {
    if(d < -r || d > D.mag() + r) return false;
    if((d < 0 || d > D.mag()) && C.mag() > r) return false;    
    return true;
  }
  return false;
}





//// CIRCLE/RECTANGLE
//boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

//  // temporary variables to set edges for testing
//  float testX = cx;
//  float testY = cy;

//  // which edge is closest?
//  if (cx < rx)         testX = rx;      // test left edge
//  else if (cx > rx+rw) testX = rx+rw;   // right edge
//  if (cy < ry)         testY = ry;      // top edge
//  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

//  // get distance from closest edges
//  float distX = cx-testX;
//  float distY = cy-testY;
//  float distance = sqrt( (distX*distX) + (distY*distY) );

//  // if the distance is less than the radius, collision!
//  if (distance <= radius) {
//    return true;
//  }
//  return false;
//}
