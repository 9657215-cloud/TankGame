class Projectile {
  float x, y, w, h;
  float vx, vy;

  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
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
    return dist(x, y, r.x, r.y) < (r.w/2 + w/2);
  }

  boolean reachedEdge() {
    return (x < 0 || x > width || y < 0 || y > height);
  }
}
