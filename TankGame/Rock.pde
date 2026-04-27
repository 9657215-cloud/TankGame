class Rock {
  float x, y;
  float w, h;
  float speed;
  float health;
  char idir;
  PImage img;

  Rock(float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;

    // Random spawn direction
    int side = int(random(4));

    if (side == 0) { // top
      idir = 's';
      x = random(width);
      y = -100;
    } else if (side == 1) { // bottom
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (side == 2) { // left
      idir = 'd';
      x = -100;
      y = random(height);
    } else { // right
      idir = 'a';
      x = width + 100;
      y = random(height);
    }

    img = loadImage("rock1.png");
  }

  void display() {
    imageMode(CENTER);
    image(img, x, y);
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
