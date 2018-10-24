import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import beads.*;
import org.jaudiolibs.beads.*;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;
Box2DProcessing box2d;

int len = 300;
int number = 50;
int number_2 = 200;

ArrayList<Boundary> boundaries;
float boundaryX;
int boundaryY;
int boundaryWidth;
int boundaryHeight;
float multiplier;

//ArrayList<Pair> pairs;

ArrayList<Chime> chimes;
int chimeX;
int chimeY;
int chimeWidth;
float chimeHeight[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
int maxAmount=4;

ArrayList<DistanceJointDef> distanceJointDefs;
ArrayList<DistanceJoint> distanceJoint;
ArrayList<Vec2> chimeVectors;
ArrayList<Vec2> boundaryVectors;

//Pair p1;
Chime c1;
Box box;
Spring spring;
Boundary ground;

void setup() {
  size(1000,800);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  box = new Box(width/2,height/2);
  //p1 = new Pair(width/4,height*3/4);
  ground = new Boundary(width/2, height, width, 40);
  box2d.listenForCollisions();
  
  spring = new Spring();
  //selectFolder("Please select the folder which contains the chime sounds:", "soundFilePath");
  
  //CREATING BOUNDARIES
  boundaries = new ArrayList<Boundary>();
  
  multiplier = 0.2;
  boundaryX = width;
  boundaryY = 0;
  boundaryWidth = 20;
  boundaryHeight = 20;
  
  for (int i = 0; i <= maxAmount; i++){
  boundaries.add(new Boundary(boundaryX*multiplier, boundaryY, boundaryWidth, boundaryHeight));
  multiplier = multiplier + 0.1;
  }
  
  
  //pairs = new ArrayList<Pair>();
  
  //CREATING CHIMES
  chimeX = width/4;
  chimeY = height*3/4;
  chimeWidth = 50;
  chimeHeight[0] = maxAmount*100;
  
  
  chimes = new ArrayList<Chime>();
  for (int i = 0; i <= maxAmount; i++){
    if(i!=0){
    chimeHeight[i] = chimeHeight[i] - chimeHeight[i-1]/1.25;
    }
    chimes.add(new Chime(chimeX,chimeY,chimeWidth,chimeHeight[i],i));
   
  }
  println(chimes);
  
  //DISTANCE JOINT DEFS
  distanceJointDefs = new ArrayList<DistanceJointDef>();
  
  for(int i = 0; i <= maxAmount; i++){
    distanceJointDefs.add(new DistanceJointDef());
    //println(distanceJointDefs);
  }
  
  for(int i = 0; i < maxAmount; i++){

    distanceJointDefs.get(i).bodyA = chimes.get(i).body;
    distanceJointDefs.get(i).bodyB = boundaries.get(i).b;
    
    distanceJointDefs.get(i).length = box2d.scalarPixelsToWorld(250);
  }
  println(distanceJointDefs);
  
  //DISTANCE JOINT
  distanceJoint = new ArrayList<DistanceJoint>();
  for (int i = 0; i< maxAmount; i++){
    distanceJoint.add((DistanceJoint)box2d.world.createJoint(distanceJointDefs.get(i)));
  }
  display(); 
}

void display(){
  chimeVectors = new ArrayList<Vec2>();
  boundaryVectors = new ArrayList<Vec2>();
  
    for (int i = 0; i< maxAmount; i++){
     chimeVectors.add(box2d.getBodyPixelCoord(chimes.get(i).body));
     boundaryVectors.add(box2d.getBodyPixelCoord(boundaries.get(i).b));
      
     stroke(0);

  println(chimeHeight[i]);
     line(chimeVectors.get(i).x,(chimeVectors.get(i).y - abs(chimeHeight[i]/2)), boundaryVectors.get(i).x, boundaryVectors.get(i).y); //the number has issues here
     

     
     chimes.get(i).display();
     boundaries.get(i).display();
    }
}

void draw(){
  background(255);
  box2d.step();
  box2d.setGravity(0, -10);
  
  spring.update(mouseX,mouseY);
  
  display();
  box.display();
  ground.display();
}

void mouseReleased() {
  spring.destroy();
}

void mousePressed() {
  // Check to see if the mouse was clicked on the box
  if (box.contains(mouseX, mouseY)) {
    // And if so, bind the mouse location to the box with a spring
    spring.bind(mouseX,mouseY,box);
  }
}

void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2. getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if (o1==null || o2==null) {
     return;
  }
  if (o1.getClass() == Chime.class && o2.getClass() == Chime.class) {
    Chime c1 = (Chime) o1;
    println("Chime:" + c1.getID());
    Chime c2 = (Chime) o1;
    println("Chime:" + c2.getID());
  //} if(o1.getClass() == Box.class && o2.getClass() == Boundary.class) {
  //  Box b = (Box) o1;
  //  //println("HIT");
  }
}


//void soundFilePath(File selection) {
//  filePath = selection.getAbsolutePath();
//}

void endContact(Contact cp) {
}
