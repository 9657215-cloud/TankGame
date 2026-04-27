class Projectile {
  float x, y;
  float vx, vy;
  float w = 10;
  float h = 10;

  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Rock r) {
    return dist(x, y, r.x, r.y) < 40;
  }

  boolean reachedEdge() {
    return (x < 0 || x > width || y < 0 || y > height);
  }
}
