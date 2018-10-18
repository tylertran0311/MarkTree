import de.voidplus.leapmotion.*;
import beads.*;
import java.util.Arrays;
import ddf.minim.*;
import ddf.minim.ugens.*;


AudioContext ac;
AudioInput in;
AudioRecorder recorder;
Minim minim;
boolean recorded = false;
AudioOutput out;
FilePlayer player;


LeapMotion leap;
PVector handPosition;
boolean swipeOnorOff = true;
String swipeIs = "On";

float xValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
float yValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

float chimeWidth[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
float chimeHeight[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

float x= 100;
final float y = height;
final int W=1150;
final int H=600;
final int BARW=950;
final int BARH=50;
final int RECORDX=750;
final int Y=500;
final int PLAYX=750+150;
final int maxAmount = 18; // defines the amount of chimes (can have more chimes that appear offscreen though
int chimeNumber[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};


boolean isRecord=false;
boolean isPlay=false;

color white, black, buttonColor, buttonHighlight;

void setup()
{
  //fullScreen();
  size(1920, 1080); // use this if your screen is not 1080p
  background(255);



  leap = new LeapMotion(this).allowGestures("swipe, key_tap"); 
  handPosition = new PVector();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  recorder = minim.createRecorder(in, "your_recording.wav");
  out = minim.getLineOut(Minim.STEREO);

  ac = new AudioContext();

  white=color(255);
  black=color(120);
  buttonColor=color(211);
  buttonHighlight=color(100);
}

void draw()
{





  float m=0.5; //change this to move chimes across the width of the screen
  float n=4;
  float d=0;
  float b=height/14;
  float c=width/6;



  strokeWeight(3);
  stroke(0);
  fill(150, 111, 51);
  rect (20, height/4, maxAmount*x, x/2); // wooden bar rectangle



  for (int i=0; i<maxAmount; i++)
  {
    //strokeWeight();
    stroke(0);
    line (b+d, c, b+d, c*1.30); //string connecting to chime    
    d=d+100; //the number value here changes the width between the strings


    fill(192, 192, 192);
    noStroke();
    rect (x*m, 4*x, x/2, n*x); //chimes    

    xValues[i] = x*m;    
    yValues[i] = 4*x;

    chimeWidth[i] = x/2;
    chimeHeight[i] = n*x;

    m++;
    n=n-0.2;
    chimeNumber[i] = i;
  }




  if (leap.getHands().size()>0) { //if more than 1 hand
    handPosition=leap.getHands().get(0).getStabilizedPosition();
  }//get hand position
  strokeWeight(2.5);
  stroke(0);
  fill(255, 0, 0);
  ellipse(handPosition.x, handPosition.y, 30, 30);

  textSize(32);
  fill(0);
  text("Press 's' to turn swipe mode on or off, Swipe Mode is: " + swipeIs, width/4.10, height/1.20);

  if ( recorder.isRecording() )
  {
    text("Now recording, press the 'r' key to stop recording", width/3.5, height/6);
  } else if (!recorded)
  {
    text("Press the 'r' key to start recording", width/3, height/6);
  } else
  {
    text("Press the 'a' key to save the recording to disk and play it back or Press the 'n' key for a new recording", width/15.7, height/6);
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

void leapOnKeyTapGesture(KeyTapGesture g) {
  println("you tapped");


  if (handPosition.x >=xValues[0] && handPosition.x <=(xValues[0]+chimeWidth[0]) & handPosition.y >=yValues[0] && handPosition.y <=(yValues[0]+chimeHeight[0]) ) {
    sound(0);
  } else if (handPosition.x >=xValues[1] && handPosition.x <=(xValues[1]+chimeWidth[1]) & handPosition.y >=yValues[1] && handPosition.y <=(yValues[1]+chimeHeight[1]) ) {
    sound(1);
  } else if (handPosition.x >=xValues[2] && handPosition.x <=(xValues[2]+chimeWidth[2]) & handPosition.y >=yValues[2] && handPosition.y <=(yValues[2]+chimeHeight[2]) ) {
    sound(2);
  } else  if (handPosition.x >=xValues[3] && handPosition.x <=(xValues[3]+chimeWidth[3]) & handPosition.y >=yValues[3] && handPosition.y <=(yValues[3]+chimeHeight[3]) ) {
    sound(3);
  } else if (handPosition.x >=xValues[4] && handPosition.x <=(xValues[4]+chimeWidth[4]) & handPosition.y >=yValues[4] && handPosition.y <=(yValues[4]+chimeHeight[4]) ) {
    sound(4);
  } else if (handPosition.x >=xValues[5] && handPosition.x <=(xValues[5]+chimeWidth[5]) & handPosition.y >=yValues[5] && handPosition.y <=(yValues[5]+chimeHeight[5]) ) {
    sound(5);
  } else if (handPosition.x >=xValues[6] && handPosition.x <=(xValues[6]+chimeWidth[6]) & handPosition.y >=yValues[6] && handPosition.y <=(yValues[6]+chimeHeight[6]) ) {
    sound(6);
  } else if (handPosition.x >=xValues[7] && handPosition.x <=(xValues[7]+chimeWidth[7]) & handPosition.y >=yValues[7] && handPosition.y <=(yValues[7]+chimeHeight[7]) ) {
    sound(7);
  } else if (handPosition.x >=xValues[8] && handPosition.x <=(xValues[8]+chimeWidth[8]) & handPosition.y >=yValues[8] && handPosition.y <=(yValues[8]+chimeHeight[8]) ) {
    sound(8);
  } else if (handPosition.x >=xValues[9] && handPosition.x <=(xValues[9]+chimeWidth[9]) & handPosition.y >=yValues[9] && handPosition.y <=(yValues[9]+chimeHeight[9]) ) {
    sound(9);
  } else if (handPosition.x >=xValues[10] && handPosition.x <=(xValues[10]+chimeWidth[10]) & handPosition.y >=yValues[10] && handPosition.y <=(yValues[10]+chimeHeight[10]) ) {
    sound(10);
  } else  if (handPosition.x >=xValues[11] && handPosition.x <=(xValues[11]+chimeWidth[11]) & handPosition.y >=yValues[11] && handPosition.y <=(yValues[11]+chimeHeight[11]) ) {
    sound(11);
  } else  if (handPosition.x >=xValues[12] && handPosition.x <=(xValues[12]+chimeWidth[12]) & handPosition.y >=yValues[12] && handPosition.y <=(yValues[12]+chimeHeight[12]) ) {
    sound(12);
  } else if (handPosition.x >=xValues[13] && handPosition.x <=(xValues[13]+chimeWidth[13]) & handPosition.y >=yValues[13] && handPosition.y <=(yValues[13]+chimeHeight[13]) ) {
    sound(13);
  } else if (handPosition.x >=xValues[14] && handPosition.x <=(xValues[14]+chimeWidth[14]) & handPosition.y >=yValues[14] && handPosition.y <=(yValues[14]+chimeHeight[14]) ) {
    sound(14);
  } else if (handPosition.x >=xValues[15] && handPosition.x <=(xValues[15]+chimeWidth[15]) & handPosition.y >=yValues[15] && handPosition.y <=(yValues[15]+chimeHeight[15]) ) {
    sound(15);
  } else if (handPosition.x >=xValues[16] && handPosition.x <=(xValues[16]+chimeWidth[16]) & handPosition.y >=yValues[16] && handPosition.y <=(yValues[16]+chimeHeight[16]) ) {
    sound(16);
  } else if (handPosition.x >=xValues[17] && handPosition.x <=(xValues[17]+chimeWidth[17]) & handPosition.y >=yValues[17] && handPosition.y <=(yValues[17]+chimeHeight[17]) ) {
    sound(17);
  } else if (handPosition.x >=xValues[18] && handPosition.x <=(xValues[18]+chimeWidth[18]) & handPosition.y >=yValues[18] && handPosition.y <=(yValues[18]+chimeHeight[18]) ) {
    sound(18);
  } else if (handPosition.x >=xValues[19] && handPosition.x <=(xValues[19]+chimeWidth[19]) & handPosition.y >=yValues[19] && handPosition.y <=(yValues[19]+chimeHeight[19]) ) {
    sound(19);
  } else if (handPosition.x >=xValues[20] && handPosition.x <=(xValues[20]+chimeWidth[20]) & handPosition.y >=yValues[20] && handPosition.y <=(yValues[20]+chimeHeight[20]) ) {
    sound(20);
  } else if (handPosition.x >=xValues[21] && handPosition.x <=(xValues[21]+chimeWidth[21]) & handPosition.y >=yValues[21] && handPosition.y <=(yValues[21]+chimeHeight[21]) ) {
    sound(21);
  } else if (handPosition.x >=xValues[22] && handPosition.x <=(xValues[22]+chimeWidth[22]) & handPosition.y >=yValues[22] && handPosition.y <=(yValues[22]+chimeHeight[22]) ) {
    sound(22);
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
      if (handPosition.x >=0 && handPosition.x <=960) {
        glissandoLowtoHigh();
      } else if (handPosition.x >=961 && handPosition.x <=1920) {
        glissandoHightoLow();
      }
      break;
    }
  }
}
