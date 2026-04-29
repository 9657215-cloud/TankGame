class PowerUp {
  float x, y, w, h;
  float speed;
  char idir;
  int type;   // 0 = score, 1 = health, 2 = speed
  PImage imgScore, imgHealth, imgSpeed;

  PowerUp(float w, float h, float speed) {
    this.w = w;
    this.h = h;
    this.speed = speed;

    // Random type
    type = int(random(3));

    // Load images (you can replace with your own)
    imgScore = loadImage("Score.png");
    imgHealth  = loadImage("Star.png");
    imgSpeed = loadImage("Speed.png");

    // Spawn from edges like rocks
    int side = int(random(4));
    if (side == 0) { idir = 's'; x = random(width); y = -100; }
    else if (side == 1) { idir = 'w'; x = random(width); y = height + 100; }
    else if (side == 2) { idir = 'd'; x = -100; y = random(height); }
    else { idir = 'a'; x = width + 100; y = random(height); }
  }

  void display() {
    imageMode(CENTER);
    if (type == 0) image(imgScore, x, y, w, h);
    if (type == 1) image(imgHealth,  x, y, w, h);
    if (type == 2) image(imgSpeed, x, y, w, h);
  }

  void move() {
    if (idir == 'w') y -= speed;
    if (idir == 's') y += speed;
    if (idir == 'a') x -= speed;
    if (idir == 'd') x += speed;
  }

  boolean reachedEdge() {
    return (x < -150 || x > width + 150 || y < -150 || y > height + 150);
  }
}
