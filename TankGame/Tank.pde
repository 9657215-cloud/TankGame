class Tank {
  float x, y;
  float w = 100;
  float h = 100;
  float speed = 10;
  float health = 75;

  PImage upImg, downImg, leftImg, rightImg;
  char idir = 'w';

  Tank() {
    x = width/2;
    y = height/2;

    upImg = loadImage("tank.png");
    downImg = loadImage("tankD.png");
    leftImg = loadImage("tankL.png");
    rightImg = loadImage("tankR.png");
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') image(upImg, x, y);
    if (idir == 's') image(downImg, x, y);
    if (idir == 'a') image(leftImg, x, y);
    if (idir == 'd') image(rightImg, x, y);
  }

  void move(char dir) {
    idir = dir;
    if (dir == 'w') y -= speed;
    if (dir == 's') y += speed;
    if (dir == 'a') x -= speed;
    if (dir == 'd') x += speed;
  }

  boolean intersect(Rock r) {
    return dist(x, y, r.x, r.y) < 60;
  }
}
