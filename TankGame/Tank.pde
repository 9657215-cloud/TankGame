class Tank {
  float x, y, w, h, speed, health, score;
  PImage iTank, itankD, itankL, itankR;
  char idir;

  Tank() {
    x = width/2;
    y = height/2;
    w = 100;
    h = 100;
    speed = 5.0;
    health = 100.0;
    score = score+5.0;

    iTank = loadImage("tank.png");
    itankD = loadImage("tankD.png");
    itankL = loadImage("tankL.png");
    itankR = loadImage("tankR.png");
    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') image(iTank, x, y);
    if (idir == 'a') image(itankL, x, y);
    if (idir == 's') image(itankD, x, y);
    if (idir == 'd') image(itankR, x, y);
  }

  void move(char dir) {
    idir = dir;
    if (dir == 'w') y -= speed;
    if (dir == 's') y += speed;
    if (dir == 'a') x -= speed;
    if (dir == 'd') x += speed;
  }

  boolean intersect(Rock r) {
    return dist(x, y, r.x, r.y) < (w/2 + r.w/2);
  }
}
