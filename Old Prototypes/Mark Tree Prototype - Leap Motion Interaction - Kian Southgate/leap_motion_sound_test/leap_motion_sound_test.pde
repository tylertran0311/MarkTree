import de.voidplus.leapmotion.*;
import beads.*;

LeapMotion leap;
PVector handPosition;
PImage img;

//***LEAP MOTION DEVICE NEEDED TO RUN THIS CODE***
//Please also install the leap motion library for processing + the beads library and ensure the file paths for the image and sound files are correct
//Please also ensure your sound is turned on but at a low volume :) and the leap motion device does not always register the gesture correctly so you may have to try the gesture a few times and this code only works well with one hand

void setup() {
  size(910, 712);
  img = loadImage("Mark Tree.png");
  leap = new LeapMotion(this).allowGestures(); 
  handPosition = new PVector();
}

void draw() {
  background(255);
  image(img, 0, 0);
  if (leap.getHands().size()>0){ //if more than 1 hand
    handPosition=leap.getHands().get(0).getStabilizedPosition(); //get hand position
  }
  
  strokeWeight(2.5);
  fill(255,0,0);
  ellipse(handPosition.x, handPosition.y, 23, 23); //draw ellipse on screen for position
  //println(handPosition.x + ", " + handPosition.y);
}

void leapOnSwipeGesture(SwipeGesture g, int state) {
  
  switch(state) {
  case 1: // Start
     break;
  case 2: // Update
    break;
  case 3: // Stop
    //the below code plays a glissando from high to low when you swipe from left to right and from low to high when you swipe from right to left
    //make this more positional in final product, may also record different sounds dependent on where the user swipes from (may not swipe from last or first chime)
  if (handPosition.x >=500 && handPosition.x <=1000) {
    sound();    
  } else if (handPosition.x >=0 && handPosition.x <=500) {
    sound_2();    
  }
  break;
                }    
}


void leapOnKeyTapGesture(KeyTapGesture g) {
  //The below code plays higher pitched notes when you tap and the x value of the position of your hand is between 0 and 500 or on the left of the screen and lower pitched notes when you tap and the x value of your hand position is between 500 and 1000 or on the right of the screen
  if (handPosition.x >=500 && handPosition.x <=1000) {
    sound_3();
  } else if (handPosition.x >=0 && handPosition.x <=500) {
    sound_4();
  }
}

void sound() {
 //println("glissando high to low");
  AudioContext ac = new AudioContext();  
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample("C:/Users/Kian/Documents/UTS - Copy/Year 4/Spring Sem/Interactive Media/Mark Tree Prototype - Leap Motion Interaction - Kian Southgate/Sound Clips/Final Clips WAV/glissando high to low.wav"));
  Gain g = new Gain(ac, 1, 1);
  g.addInput(player);    
  ac.out.addInput(g);
  ac.start();
}

void sound_2() {
  // println("glissando low to high");
  AudioContext ac = new AudioContext();
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample("C:/Users/Kian/Documents/UTS - Copy/Year 4/Spring Sem/Interactive Media/Mark Tree Prototype - Leap Motion Interaction - Kian Southgate/Sound Clips/Final Clips WAV/glissando low to high.wav"));
  Gain g = new Gain(ac, 1, 1);
  g.addInput(player);    
  ac.out.addInput(g);
  ac.start();
}

void sound_3() {
  //make this more positional in final product
  AudioContext ac = new AudioContext();  
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample("C:/Users/Kian/Documents/UTS - Copy/Year 4/Spring Sem/Interactive Media/Mark Tree Prototype - Leap Motion Interaction - Kian Southgate/Sound Clips/Final Clips WAV/" + int(random(13, 23)) + ".wav"));
  Gain g = new Gain(ac, 1, 1);
  g.addInput(player);    
  ac.out.addInput(g);
  ac.start();
}

void sound_4() {
   //make this more positional in final product
  AudioContext ac = new AudioContext();  
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample("C:/Users/Kian/Documents/UTS - Copy/Year 4/Spring Sem/Interactive Media/Mark Tree Prototype - Leap Motion Interaction - Kian Southgate/Sound Clips/Final Clips WAV/" + int(random(1, 13)) + ".wav"));
  Gain g = new Gain(ac, 1, 1);
  g.addInput(player);    
  ac.out.addInput(g);
  ac.start();
}
