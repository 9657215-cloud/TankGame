// 1 April 2026 | TankGame by Hailey Price
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


  //Distribute object on timer
  if (objTimer.isFinished()) {
    rocks.add(new Rock(100, 100, int(random(1, 10)), 10));
    //Restart Timer
    objTimer.start();
  }

//Displays and removes obstacles
  for (int i = 0; i < projectiles.size(); i++) {
    Rock r = rocks.get(i);
    r.display();
    r.move();
    if(r.reachedEdge()){
      rocks.remove(i);
    }
    //detect collison to tank
    if(t1.intersect(r)) {}
    // impact to change score, health, and rocks
  }

  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < rocks.size(); j++) {
      Rock r = rocks.get(j);
      if (p.intersect(r)) {
        score = score + 100;
        projectiles.remove(i);
        rocks.remove(j);
      }
    }
    p.display();
    p.move();
  }

  for (int i = 0; i < rocks.size(); i ++) {
    Rock p = rocks.get(i);
    p.display();
    p.move();
  }
  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key =='w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx * dy*dy);

  if (mag > 0) {
    dx /=mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}



void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
