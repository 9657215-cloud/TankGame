class Rock {
  // Member Variable
  float x, y, w, h, speed, health;
  //PImage iTankW;
  char idir;

  PImage obs1;

  // Constructor
  Rock(float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed= speed;
    this.health = health;
   if (int(random(4))==2){
    idir = 'w';
    x = random(width);
    y = height + 100;
   }else if (int(random(3))==1) {
     idir = 'd';
     x = -100;
     y = random(height);
   }else if(int(random(2))==1) {
   idir = 'a';
   x = width+100;
   y=random(height);
   }else if(int(random(2))==1){
     idir = 's';
     x= random(width);
     y=height+100;
   }
    
  
    obs1 = loadImage("rock1.png");
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1, x, y);
  }


  void move() {
    x = x + speed;
    if (x>width + w/2) {
      x = -w/2;
    }
  }

  boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
    }
  }
}
