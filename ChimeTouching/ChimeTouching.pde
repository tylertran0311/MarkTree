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

ArrayList<Boundary> boundaries;

ArrayList<Pair> pairs;

ArrayList<Chime> chimes;

Pair p1;
Chime c1;
Box box;
Spring spring;
Boundary ground;
//Spring spring;

void setup() {
  size(1000,800);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  box = new Box(width/2,height/2);
  p1 = new Pair(width/4,height*3/4);
  ground = new Boundary(width/2, height, width, 40);
  box2d.listenForCollisions();
  
  spring = new Spring();
  //selectFolder("Please select the folder which contains the chime sounds:", "soundFilePath");
  
  pairs = new ArrayList<Pair>();
}

void draw(){
  background(255);
  box2d.step();
  box2d.setGravity(0, -10);
  
  spring.update(mouseX,mouseY);
  //spring.update(mouseX,mouseY);
  for(Pair p: pairs) {
    p.display();
  }
  p1.display();
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
  
  if (o1.getClass() == Chime.class && o2.getClass() == Chime.class) {
    Chime c1 = (Chime) o1;
    println("Chime:" + c1.getID());
    Chime c2 = (Chime) o1;
    println("Chime:" + c2.getID());
  } if(o1.getClass() == Box.class && o2.getClass() == Boundary.class) {
    Box b = (Box) o1;
    println("HIT");
  }
}


//void soundFilePath(File selection) {
//  filePath = selection.getAbsolutePath();
//}

void endContact(Contact cp) {
}
