// Tank Game | April 1 2026 | Hailey Price

Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
PImage bg;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  score = 0;

  bg = loadImage("tankbg.png");
  t1 = new Tank();

  objTimer = new Timer(1000);
  objTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  // Spawn rocks on timer
  if (objTimer.isFinished()) {
    rocks.add(new Rock(100, 100, random(1, 5), 10));
    objTimer.start();
  }

  // --- ROCKS ---
  for (int i = rocks.size() - 1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
    r.move();

    if (r.reachedEdge()) {
      rocks.remove(i);
      continue;
    }

    if (t1.intersect(r)) {
      // handle tank collision here
    }
  }

  // --- PROJECTILES ---
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();

    // Check collision with rocks
    for (int j = rocks.size() - 1; j >= 0; j--) {
      Rock r = rocks.get(j);

      if (p.intersect(r)) {
        score += 100;
        projectiles.remove(i);
        rocks.remove(j);
        break;
      }
    }
  }

  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') t1.move('w');
  if (key == 's') t1.move('s');
  if (key == 'a') t1.move('a');
  if (key == 'd') t1.move('d');
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 7;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(0, 150);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);

  fill(255);
  textSize(24);
  textAlign(CENTER);
  text("Score: " + score, width/2, 25);
}
