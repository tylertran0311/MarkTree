int numChimes = 2;
Chime[] chimes = new Chime[numChimes];
PVector[] stringAnchors = new PVector[numChimes];
float chimesBounciness;
float wallBounciness; // Only used in hard collisions
float springConstant; // Only used in soft collisions
float stringForceConstant;
PVector grav;
PVector wind;
float stringLength;
float startingAngle;

void setup() {
  size(300,300);
  frameRate(60);
  background(255);
  grav = new PVector(0, 0.20);
  wind = new PVector(0, 0);
  wallBounciness = 0.99;
  chimesBounciness = 0.99; // Only used in hard collisions
  springConstant = 0.05; // Only used in soft collisions
  stringLength = 100;
  stringForceConstant = 4;
  for (int i = 0; i < numChimes; i++) {
    float h = 100;
    float w = 30;
    if (i < 2) {startingAngle = radians(-20);}
    else {startingAngle = radians(0);}
    stringAnchors[i] = new PVector(width/2 - 2*w*((numChimes-1)/2-i),0);
    chimes[i] = new Chime(stringAnchors[i].x-stringLength*sin(startingAngle),stringAnchors[i].y+stringLength*cos(startingAngle),0,0,2,h,w,i,chimes);
  }
}

void draw() {
  noStroke();
  fill(255, 100);
  rect(0, 0, width, height);

  for (int i = 0; i < numChimes; i++) {
    chimes[i].run();
  }
}

class Chime {
  PVector pos;
  PVector vel;
  PVector acc;

  float mass;
  float cHeight;
  float cWidth;
  float topSpeed;
  
  int id;
  Chime[] others;

  Chime(float xpos, float ypos, float xvel, float yvel, float m, float h, float w, int ident, Chime[] otherchimes) {
    pos = new PVector(xpos, ypos);
    vel = new PVector(xvel, yvel);
    acc = new PVector(0, 0);

    mass = m;
    cHeight = h;
    cWidth = w;
    topSpeed = 20;
    
    id = ident;
    others = otherchimes;
  }

  void run() {
    update(id);
    display(id);
  }

  void display(int id) {
    stroke(2);
    line(stringAnchors[id].x,stringAnchors[id].y,chimes[id].pos.x,chimes[id].pos.y);
    noStroke();
    if (numChimes > 1) {
      fill(255-int(map(id,0,numChimes-1,0,255)), 0, int(map(id,0,numChimes-1,0,255)));
    } else {fill(255,0,0);}
    noStroke();
    rect(pos.x - cWidth/2, pos.y, cWidth, cHeight);
  }

  void update(int id) {    
    PVector stringVec = PVector.sub(stringAnchors[id],chimes[id].pos);
    PVector stringHat = PVector.sub(stringAnchors[id],chimes[id].pos).normalize();
    PVector stringForce = PVector.mult(stringHat,stringForceConstant*(stringVec.mag()-stringLength));
    
    applyForce(id,PVector.mult(grav,mass));
    applyForce(id,stringForce);
    applyForce(id,wind);

    vel.add(acc);
    vel.limit(topSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(int id, PVector force) {
    PVector a = PVector.div(force, mass);
    chimes[id].acc.add(a);
  }
} 
