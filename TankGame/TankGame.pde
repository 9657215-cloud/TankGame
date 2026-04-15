// 1 April 2026 | TankGame by Hailey Price
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
PImage bg;
int score;


void setup() {
  size(500, 500);
  score = 0;
    bg = loadImage("tankbg.png");
  t1 = new Tank();
 rocks.add(new Rock(200,200,100,100,100,int(random(1,10))));
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg,0,0);
  for (int i = 0; i < rocks.size(); i++) {
  Rock p = rocks.get(i);
  p.display();
  p.move();
}
  
  
  
  
  for (int i = 0; i < projectiles.size(); i++) {
  Projectile p = projectiles.get(i);
  p.display();
  p.move();
}
  t1.display();

  scorePanel();
}

void keyPressed() {
  if(key =='w'){
    t1.move('w');
  }else if(key == 's') {
  t1.move('s');
  }else if(key == 'a') {
  t1.move('a');
  }else if(key == 'd') {
  t1.move('d');
  }
  
}

void mousePressed() {
  projectiles.add(new Projectile(t1.x,t1.y,4,10));
}




void scorePanel() {
  fill(127,200);
  rectMode(CENTER);
  noStroke();
  rect(width/2,15,width,30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score,width/2,25);
}
