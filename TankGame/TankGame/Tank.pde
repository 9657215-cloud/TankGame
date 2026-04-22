class Tank {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTank, itankD, itankL, itankR;
  char idir;
  
  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 75.0;
    iTank = loadImage("tank.png");
    itankD = loadImage("tankD.png");
    itankL = loadImage("tankL.png");
    itankR = loadImage("tankR.png");
    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image (iTank, x, y);
    } else if (idir == 'a') {
      image (itankL, x, y);
    } else if (idir == 's') {
      image (itankD, x, y);
    } else if (idir == 'd') {
      image (itankR, x, y);
    }
  }


  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }

  void fire() {
  }
   boolean intersect(Rock r) {
    float distance = dist(x, y, r.x, r.y);
    if (distance < 100) {
      return true;
    }else {
      return false;
    }
  }
}
