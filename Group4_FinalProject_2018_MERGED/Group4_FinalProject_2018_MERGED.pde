import de.voidplus.leapmotion.*;
import beads.*;
import java.util.Arrays;
import ddf.minim.*;
import ddf.minim.ugens.*;

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

import javax.swing.*; 

Box2DProcessing box2d;
Chime c1;
Box box;
Boundary ground;

AudioContext ac;
AudioInput in;
AudioRecorder recorder;
Minim minim;
boolean recorded = false;
AudioOutput out;
FilePlayer player;

int stage = 1;
int buttonWidth = width*2;
int buttonHeight = height*2;
int startButtonX;
int startButtonY;
int aboutButtonX;
int aboutButtonY;
int backButtonX;
int backButtonY;
int instructionsButtonX;
int instructionsButtonY;
int filePathButtonY;



LeapMotion leap;
PVector handPosition;
boolean swipeOnorOff = true;
String swipeIs = "On";
boolean rectOver = false;
boolean rectOver_2 = false;
boolean rectOver_3 = false;
boolean rectOver_4 = false;
boolean rectOver_5 = false;

float xValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
float yValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

//float chimeWidth[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
//float chimeHeight[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

int len = 300;
int number = 30;
int number_2 = 200;

ArrayList<Boundary> boundaries;
float boundaryX;
float boundaryY;
int boundaryWidth;
int boundaryHeight;
float multiplier;

ArrayList<Chime> chimes;
int chimeX;
int chimeY;
int chimeWidth;
int chimeHeight;


ArrayList<DistanceJointDef> distanceJointDefs;
ArrayList<DistanceJoint> distanceJoint;
ArrayList<Vec2> chimeVectors;
ArrayList<Vec2> boundaryVectors;

float x= 100;
float y = height;
int W=1150;
int H=600;
int BARW=950;
int BARH=50;
int RECORDX=750;
int Y=500;
int PLAYX=750+150;
int maxAmount; // defines the amount of chimes (can have more chimes that appear offscreen though
int chimeNumber[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};


boolean isRecord=false;
boolean isPlay=false;

color white, black, buttonColor, buttonHighlight;

void setup()
{
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  String preset="10";
  String op1s = JOptionPane.showInputDialog(frame, "Select Number of Chimes, less than 10", preset);
  if (op1s != null) { 
    maxAmount=Integer.parseInt(op1s);
  }
  
  
  if (op1s == null || maxAmount > 10) {
    op1s = JOptionPane.showInputDialog(frame, "Select Number of Chimes, less than 10", preset);
    maxAmount = Integer.parseInt(op1s);
  }

  fullScreen();
  //size(1920, 1080); // use this if your screen is not 1080p
  background(255);
  frameRate(60);
  //display();
  startButtonX = width/2 - 300;
  startButtonY = height/2;
  aboutButtonX = width/2;
  aboutButtonY = height/2 - 300;
  backButtonX = 0;
  backButtonY = 0;
  instructionsButtonX = width/2 + 300;
  instructionsButtonY = height/2;
  filePathButtonY = height/2 + 300;

  leap = new LeapMotion(this).allowGestures(); 
  handPosition = new PVector();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  recorder = minim.createRecorder(in, "your_recording.wav");
  out = minim.getLineOut(Minim.STEREO);

  ac = new AudioContext();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();


  box2d.listenForCollisions();


  selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");

  //CREATING BOUNDARIES
  boundaries = new ArrayList<Boundary>();

  multiplier = 0.05;
  boundaryX = width;
  boundaryY = displayHeight*65/1080;
  boundaryWidth = 20;
  boundaryHeight = 20;

  for (int i = 0; i <= maxAmount; i++) {
    boundaries.add(new Boundary(boundaryX*multiplier, boundaryY, boundaryWidth, boundaryHeight));
    multiplier = multiplier + 0.1;
  }



  boundaries.add(new Boundary(width/2, height, width, 10));
  boundaries.add(new Boundary(width/2, displayHeight*70/1080, width, 10));
  boundaries.add(new Boundary(width, height/2, 10, height));
  boundaries.add(new Boundary(0, height/2, 10, height));

  //CREATING CHIMES
  chimeX = width/4;
  chimeY = height*3/4;
  chimeWidth = 50;
  chimeHeight = maxAmount*50;


  chimes = new ArrayList<Chime>();
  for (int i = 0; i <= maxAmount; i++) {
    chimes.add(new Chime(chimeX, chimeY, chimeWidth, chimeHeight, i));
    chimeHeight = chimeHeight - number; // I added this
  }
  println(chimes);

  //DISTANCE JOINT DEFS
  distanceJointDefs = new ArrayList<DistanceJointDef>();

  for (int i = 0; i <= maxAmount; i++) {
    distanceJointDefs.add(new DistanceJointDef());
    println(distanceJointDefs);
  }

  for (int i = 0; i < maxAmount; i++) {

    distanceJointDefs.get(i).bodyA = chimes.get(i).body;
    distanceJointDefs.get(i).bodyB = boundaries.get(i).b;

    distanceJointDefs.get(i).length = box2d.scalarPixelsToWorld(len - number);
  }
  //println(distanceJointDefs);

  //DISTANCE JOINT
  distanceJoint = new ArrayList<DistanceJoint>();
  for (int i = 0; i< maxAmount; i++) {
    distanceJoint.add((DistanceJoint)box2d.world.createJoint(distanceJointDefs.get(i)));
  }
  //display();
}

void display() {

  chimeVectors = new ArrayList<Vec2>();
  boundaryVectors = new ArrayList<Vec2>();

  for (int i = 0; i< maxAmount; i++) {
    chimeVectors.add(box2d.getBodyPixelCoord(chimes.get(i).body));
    boundaryVectors.add(box2d.getBodyPixelCoord(boundaries.get(i).b));
    stroke(0);
    line(chimeVectors.get(i).x, (chimeVectors.get(i).y - chimes.get(i).getHeight()/2), boundaryVectors.get(i).x, boundaryVectors.get(i).y); //the number has issues here

    chimes.get(i).display();
    boundaries.get(i).display();
  }
}

void soundFilePath(File selection) {
  if (selection != null) {
    filePath = selection.getAbsolutePath();
    filePath = filePath + "\\";
  } else {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");
  }
}



void draw()
{

  //println(buttonWidth);
  //println(mouseX);
  if (mouseX >= (startButtonX - buttonWidth)  & mouseX <= (startButtonX + buttonWidth) & mouseY >=(startButtonY-buttonHeight) & mouseY <=(startButtonY+buttonHeight)
    ) {
    rectOver = true;
  } else {
    rectOver = false;
  }

  if (mouseX >= (aboutButtonX - buttonWidth)  & mouseX <= (aboutButtonX + buttonWidth) & mouseY >=(aboutButtonY-buttonHeight) & mouseY <=(aboutButtonY+buttonHeight)
    ) {
    rectOver_2 = true;
  } else {
    rectOver_2 = false;
  }

  if (mouseX >= (backButtonX - buttonWidth)  & mouseX <= (backButtonX + buttonWidth) & mouseY >=(backButtonY-buttonHeight) & mouseY <=(backButtonY+buttonHeight)) {
    if (stage == 2 || stage == 3 || stage == 4) {
      rectOver_3 = true;
    }
  } else {

    rectOver_3 = false;
  }

  if (
    mouseX >= (instructionsButtonX - buttonWidth)  & mouseX <= (instructionsButtonX + buttonWidth) & mouseY >=(instructionsButtonY-buttonHeight) & mouseY <=(instructionsButtonY+buttonHeight)
    ) {
    rectOver_4 = true;
  } else {
    rectOver_4 = false;
  }

  if (mouseX >= (aboutButtonX - buttonWidth)  & mouseX <= (aboutButtonX + buttonWidth) & mouseY >=(filePathButtonY-buttonHeight) & mouseY <=(filePathButtonY+buttonHeight)
    ) {
    rectOver_5 = true;
  } else {
    rectOver_5 = false;
  }





  if (stage==1) {

    background(255);



    textSize(32);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    if (rectOver) {

      fill(color(0, 0, 255));
    } else {
      fill(255);
    }

    rect(startButtonX, startButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Start", startButtonX, startButtonY);


    if (rectOver_2) {

      fill(color(255, 255, 0));
    } else {
      fill(255);
    }
    rect(aboutButtonX, aboutButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("About", aboutButtonX, aboutButtonY);

    if (rectOver_5) {

      fill(color(224, 224, 224));
    } else {
      fill(255);
    }
    rect(width/2, filePathButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Add Sounds", width/2, filePathButtonY);

    if (rectOver_4) {

      fill(color(255, 0, 0));
    } else {
      fill(255);
    }
    rect(instructionsButtonX, instructionsButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Instructions", instructionsButtonX, instructionsButtonY);
  }

  if (stage==2) {

    background(255);
    println(frameRate);
    rectMode(CORNER);
    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);




    strokeWeight(3);
    stroke(0);
    fill(150, 111, 51);
    rect (5, 10, width-10, displayHeight*60/1080); // wooden bar rectangle



    textSize(32);
    fill(0);
    text("Press 's' to turn swipe mode on or off, Swipe Mode is: " + swipeIs, width/2, height/1.5);

    if ( recorder.isRecording() )
    {
      text("Now recording, press the 'r' key to stop recording", width/2, height/1.25);
    } else if (!recorded)
    {
      text("Press the 'r' key to start recording", width/2, height/1.25);
    } else
    {
      text("Press the 'a' key to save the recording to disk and play it back or Press the 'n' key for a new recording", width/2, height/1.25);
    }

    //Interaction();
    box2d.step();
    box2d.setGravity(0, -10);


    display();


    if (leap.getHands().size()>0) { //if more than 1 hand
      handPosition=leap.getHands().get(0).getStabilizedPosition();
    }//get hand position
    //spring.update(handPosition.x,handPosition.y);
    box = new Box(handPosition.x, handPosition.y);
    box.display();
  }

  if (stage==3) {
    background(255);

    rectMode(CORNER);
    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Interactive virtual Mark Tree Created in Processing by Kian Southgate, Fucheng Guo, Diep Quang Anh Tran,", width/2, height/2);
    text("Samuel Li, Qianchen Li and Jianfeng Wu © 2018", width/2, height/1.80);
  }

  if (stage == 4) {
    background(255);

    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rectMode(CORNER);
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);


    text("Instructions:", width/2, height/4);
    text("1.Select the folder which contains the sound files for the individual chimes (called Final Clips WAV)", width/2, height/3.3);
    text("2.Click Open to choose the folder", width/2, height/2.85);
    text("3.Ensure your volume is low!!!", width/2, height/2.5);
    text("4.Click Start", width/2, height/2.2);
    text("5.Plug in the Leap Motion", width/2, height/2);
    text("6.Use the Leap Motion to interact with the virtual mark tree and have fun!", width/2, height/1.80);
  }
}

void mouseClicked() {
  if (rectOver == true && filePath != null) {
    stage =2;
  } else if (filePath == null && rectOver==true) {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");
  }

  if (rectOver_2 == true) {
    stage =3;
  }

  if (rectOver_3 == true) {
    stage=1;
  }

  if (rectOver_4 == true) {
    stage = 4;
  }

  if (rectOver_5 == true) {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");
  }
}




void keyPressed() {
  background(255);


  if (key=='s') {
    if (swipeOnorOff == false) {
      swipeOnorOff = true;
      swipeIs = "On";
      println("swipe is on");
    } else if (swipeOnorOff == true) {
      swipeOnorOff = false;
      swipeIs = "Off";
      println("swipe is off");
    }
  }

  if (!recorded && key == 'r')
  {
    if (recorder.isRecording())
    {
      recorder.endRecord();
      recorded = true;
    } else
    {
      recorder.beginRecord();
    }
  }

  if (recorded && key == 'a')
  {
    if (player != null)
    {
      player.unpatch(out);
      player.close();
    }
    player = new FilePlayer(recorder.save());
    player.patch(out);
    player.play();
  }

  if (recorded && key == 'n') {
    recorded = false;
    recorder = minim.createRecorder(in, "your_recording.wav");
  }
}

void leapOnSwipeGesture(SwipeGesture g, int state) {

  println("you swiped");
  if (swipeOnorOff == true) {
    switch(state) {
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      if (handPosition.x >=0 && handPosition.x <=width/2) {
        glissandoLowtoHigh();
      } else if (handPosition.x >=width/2 && handPosition.x <=width) {
        glissandoHightoLow();
      }
      break;
    }
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
    if (filePath!=null) {
      sound(c1.getID());
    }
    //println("Chime:" + c1.getID());
    Chime c2 = (Chime) o2;
    if (filePath!=null) {
      sound(c2.getID());
    }

    //println("Chime:" + c2.getID());
  }
}




void endContact(Contact cp) {
}
